import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rnn_yaatra/constants/colors.dart'; 
import 'package:rnn_yaatra/helpers/navigation_helper.dart';
import 'package:rnn_yaatra/models/account_models/get_max_plan_response_model.dart';
import 'package:rnn_yaatra/models/account_models/get_profile_detail_response_model.dart';
import 'package:rnn_yaatra/routing/app_router.dart';
import 'package:rnn_yaatra/services/account_services.dart';
import 'package:rnn_yaatra/utils/screen_helper.dart';
import 'package:rnn_yaatra/utils/spacings.dart';
import 'package:rnn_yaatra/utils/txt_styles.dart';
import 'package:rnn_yaatra/widgets/app_bar.dart';
import 'package:rnn_yaatra/widgets/buttons.dart';
import 'package:rnn_yaatra/widgets/container_item.dart';
import 'package:rnn_yaatra/widgets/dilougs.dart';
import 'package:rnn_yaatra/widgets/show_bottomsheet_filter.dart';
import 'package:rnn_yaatra/widgets/snack_bar.dart';
import 'package:rnn_yaatra/widgets/text_fields.dart';

class PuchasePlan extends ConsumerStatefulWidget {
  const PuchasePlan({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PuchasePlanState();
}

class _PuchasePlanState extends ConsumerState<PuchasePlan> {
  final TextEditingController _balanceController = TextEditingController(text: "0.00");
  final TextEditingController _topupUserIdController = TextEditingController();
  final TextEditingController _topupUserNameController = TextEditingController();
  final TextEditingController _packageController = TextEditingController();
  final TextEditingController _transPasswordController = TextEditingController();

  String? _selectedPackageId;
  List<Map<String, dynamic>> _packageList = [];

  final AccountServices _accountServices = AccountServices();
  bool _isLoadingBalance = false;
  bool _isLoadingTopupDetail = false;
  bool _isPasswordVisible = false;

  bool _isTransPasswordValid = false;
  bool _isValidatingPassword = false;

  Timer? _debounceTimer;
  Timer? _transPassDebounceTimer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadFundBalance();
    });
  }

  Future<void> _loadFundBalance() async {
    setState(() {
      _isLoadingBalance = true;
    });
    try {
      final res = await _accountServices.getFundBalance();
      if (res.data != null && res.data!.isNotEmpty) {
        _balanceController.text = res.data!.first.balance ?? "0.00";
      } else {
        _balanceController.text = "0.00";
      }
    } catch (e) {
      _balanceController.text = "0.00";
    } finally {
      if (mounted) {
        setState(() {
          _isLoadingBalance = false;
        });
      }
    }
  }

  void _onTopupUserIdChanged(String val) {
    if (_debounceTimer?.isActive ?? false) _debounceTimer!.cancel();

    final userId = val.trim();
    if (userId.isEmpty) {
      setState(() {
        _topupUserNameController.text = "";
        _packageController.text = "";
        _selectedPackageId = null;
        _packageList = [];
        _isLoadingTopupDetail = false;
      });
      return;
    }

    _debounceTimer = Timer(const Duration(milliseconds: 500), () async {
      if (!mounted) return;
      setState(() {
        _isLoadingTopupDetail = true;
      });

      try {
        final profileFuture = _accountServices.get_profile_detail(userID: userId);
        final maxPlanFuture = _accountServices.getMaxPlan(userId: userId);

        final results = await Future.wait<dynamic>([profileFuture, maxPlanFuture]);

        if (!mounted) return;

        final profileRes = results[0] as GetProfileDetailResponseModel;
        final maxPlanRes = results[1] as GetMaxPlanResponseModel;

        if (profileRes.data != null && profileRes.data!.username != null && profileRes.data!.username!.isNotEmpty) {
          _topupUserNameController.text = profileRes.data!.username!;
        } else {
          _topupUserNameController.text = "";
        }

        if (maxPlanRes.data != null && maxPlanRes.data!.isNotEmpty) {
          _packageList = maxPlanRes.data!.map((e) {
            return {
              "title": e.planName?.trim() ?? "",
              "value": e.id ?? "",
              "amount": e.amount ?? "",
            };
          }).toList();
        } else {
          _packageList = [];
        }
        _packageController.text = "";
        _selectedPackageId = null;

      } catch (e) {
        if (mounted) {
          _topupUserNameController.text = "";
          _packageController.text = "";
          _selectedPackageId = null;
          _packageList = [];
        }
      } finally {
        if (mounted) {
          setState(() {
            _isLoadingTopupDetail = false;
          });
        }
      }
    });
  }

  _onTransPasswordChanged(String val,{Function? callbakFn}) {
    if (_transPassDebounceTimer?.isActive ?? false) _transPassDebounceTimer!.cancel();

    final pass = val.trim();
    if (pass.isEmpty) {
      setState(() {
        _isTransPasswordValid = false;
        _isValidatingPassword = false;
      });
      return;
    }

    _transPassDebounceTimer = Timer(const Duration(milliseconds: 500), () async {
      if (!mounted) return;
      setState(() {
        _isValidatingPassword = true;
      });

      try {
        final res = await _accountServices.getTransPassword(transPassword: pass);
        if (!mounted) return;
        setState(() {
          _isTransPasswordValid = (res.success == true);
        });
        if(res.success == true){
          if(callbakFn != null){
            callbakFn(res);
          }
        }
        
      } catch (e) {
        if (mounted) {
          setState(() {
            _isTransPasswordValid = false;
          });
        }
      } finally {
        if (mounted) {
          setState(() {
            _isValidatingPassword = false;
          });
        }
      }
    });
  }

  void _openPackageSelector() {
    if (_topupUserIdController.text.trim().isEmpty) {
      AlertToast.show_message_dialog(
        title: "Validation",
        message: "Please enter Topup User Id first!",
      );
      return;
    }

    if (_packageList.isEmpty) {
      AlertToast.show_message_dialog(
        title: "Travel Plan Info",
        message: "No Travel Plan available for this user.",
      );
      return;
    }

    AppNav.to(
      buildContext: context,
      ShowFilterBottomsheetPageRiverpod(
        itemList: _packageList,
        filterKeyName: "title",
        showKeyName: "title",
        inputTitle: "Select Travel Plan",
        title: "Select Travel Plan",
        response: (res) {
          setState(() {
            _packageController.text = res['title'] ?? "";
            _selectedPackageId = res['value']?.toString();
          });
        },
      ),
    );
  }

  Future<void> _submitTopup() async {
    final topupUserId = _topupUserIdController.text.trim();
    final transPass = _transPasswordController.text.trim();

    if (topupUserId.isEmpty) {
      AlertToast.show_message_dialog(
        title: "Validation",
        message: "Please enter Topup User Id!",
      );
      return;
    }

    if (_selectedPackageId == null || _selectedPackageId!.isEmpty) {
      AlertToast.show_message_dialog(
        title: "Validation",
        message: "Please Select Travel Plan!",
      );
      return;
    }

    if (transPass.isEmpty) {
      AlertToast.show_message_dialog(
        title: "Validation",
        message: "Please enter Transaction Password!",
      );
      return;
    }

    if (!_isTransPasswordValid) {
      AlertToast.show_message_dialog(
        title: "Validation",
        message: "Invalid Transaction Password!",
      );
      return;
    }

    ProgressDialog().show(context, ref);

    try {
      final res = await _accountServices.topupUserWithWallet(
        planId: _selectedPackageId,
        topupUserId: topupUserId,
      );

      if (!mounted) return;
      ProgressDialog().hide(context, ref);

      if (res.id != "0" && res.id != null) {
        AlertToast.show_message_dialog(
          title: "Success",
          message: res.msg ?? "Travel Plan Requested Successfully!",
        );
        setState(() {
          _topupUserIdController.clear();
          _topupUserNameController.clear();
          _packageController.clear();
          _transPasswordController.clear();
          _selectedPackageId = null;
          _isTransPasswordValid = false;
        });
        _loadFundBalance();
      } else {
        AlertToast.show_message_dialog(
          title: "Topup Failed",
          message: res.msg ?? "Failed to topup user. Please try again.",
        );
      }
    } catch (e) {
      if (mounted) {
        ProgressDialog().hide(context, ref);
        AlertToast.show_message_dialog(
          title: "Error",
          message: "An error occurred while processing topup.",
        );
      }
    }
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    _transPassDebounceTimer?.cancel();
    _balanceController.dispose();
    _topupUserIdController.dispose();
    _topupUserNameController.dispose();
    _packageController.dispose();
    _transPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Book Travel",
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AddVerticalSpacing(10.0),
            
            Container(
              decoration: BoxDecoration(
                color: AppColor.WHITE,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: AppColor.GREY_LIGHT.withValues(alpha: 0.7),
                    spreadRadius: 2.0,
                    offset: const Offset(0, 2),
                    blurRadius: 6.0
                  )
                ]
              ),
              width: ScreenHelper().get_width(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                          decoration: const BoxDecoration(
                            color: Color(0xFF0D47A1),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              bottomRight: Radius.circular(16),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(Icons.currency_rupee, color: Colors.white, size: 16),
                              SizedBox(width: 6),
                              Text(
                                "Book Travel",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  AddVerticalSpacing(12.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: Icon(Icons.info_outline,size: 15.0,color: AppColor.RED,)
                          ),
                          TextSpan(
                            text: "  Select a travel plan and submit your request for company processing.",
                            style: StyleHelper.popinsStyle(fontSize: 11.0,color: AppColor.RED,fontWeight: FontWeight.w600),
                          )
                        ]
                      ),
                    ),
                  ),

                  // AddVerticalSpacing(14.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: CustomInkWell(
                      onTap: (){
                        AppNav.push(context: context,path: AppRouteString.HowItWorksScreen);
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.info_outline,color: AppColor.PRIMARY_COLOR,size: 18.0),
                          AddHorizontalSpacing(5.0),
                          Text("How it works?",style: StyleHelper.popinsStyle(color: AppColor.PRIMARY_COLOR,fontWeight: FontWeight.w600,fontSize: 13.0))
                        ],
                      ),
                    ),
                  ),


                  AddVerticalSpacing(15.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Available Balance(₹):", style: StyleHelper.popinsStyle(fontSize: 14.0, fontWeight: FontWeight.w600)),
                        AddVerticalSpacing(5.0),
                        input_text_field(
                          controller: _balanceController,
                          readOnly: true,
                          bg_color: AppColor.WHITE,
                          isShadowHide: true,
                          hint_text: "0.00",
                          suffix_icon: _isLoadingBalance
                              ? const Padding(
                                  padding: EdgeInsets.all(12.0),
                                  child: SizedBox(
                                    height: 16,
                                    width: 16,
                                    child: CircularProgressIndicator(strokeWidth: 2),
                                  ),
                                )
                              : null,
                        ),

                        AddVerticalSpacing(15.0),
                        Text("User Id", style: StyleHelper.popinsStyle(fontSize: 14.0, fontWeight: FontWeight.w600)),
                        AddVerticalSpacing(5.0),
                        input_text_field(
                          controller: _topupUserIdController,
                          onChanged: _onTopupUserIdChanged,
                          bg_color: AppColor.WHITE,
                          isShadowHide: true,
                          hint_text: "Enter User Id",
                          icon: Icon(Iconsax.user, color: AppColor.TEXT_GREY, size: 20.0),
                        ),

                        AddVerticalSpacing(15.0),
                        Text("User Name", style: StyleHelper.popinsStyle(fontSize: 14.0, fontWeight: FontWeight.w600)),
                        AddVerticalSpacing(5.0),
                        input_text_field(
                          controller: _topupUserNameController,
                          readOnly: true,
                          bg_color: AppColor.WHITE,
                          isShadowHide: true,
                          hint_text: "User Name",
                          icon: Icon(Iconsax.user, color: AppColor.TEXT_GREY, size: 20.0),
                          suffix_icon: _isLoadingTopupDetail
                              ? const Padding(
                                  padding: EdgeInsets.all(12.0),
                                  child: SizedBox(
                                    height: 16,
                                    width: 16,
                                    child: CircularProgressIndicator(strokeWidth: 2),
                                  ),
                                )
                              : null,
                        ),

                        AddVerticalSpacing(15.0),
                        Text("Select Tour Package", style: StyleHelper.popinsStyle(fontSize: 14.0, fontWeight: FontWeight.w600)),
                        AddVerticalSpacing(5.0),
                        CustomInkWell(
                          onTap: _openPackageSelector,
                          child: input_text_field(
                            controller: _packageController,
                            readOnly: true,
                            bg_color: AppColor.WHITE,
                            isShadowHide: true,
                            hint_text: "--SELECT--",
                            icon: Icon(Iconsax.gift, color: AppColor.TEXT_GREY, size: 20.0),
                            suffix_icon: Padding(
                              padding: EdgeInsets.only(top: 10.0),
                              child: Icon(Icons.arrow_drop_down, color: AppColor.GREY_MEDIUM),
                            )
                          ),
                        ),

                        // AddVerticalSpacing(15.0),
                        // Text("Transaction Password", style: StyleHelper.popinsStyle(fontSize: 14.0, fontWeight: FontWeight.w600)),
                        // AddVerticalSpacing(5.0),
                        // input_text_field(
                        //   controller: _transPasswordController,
                        //   onChanged: _onTransPasswordChanged,
                        //   obscureText: !_isPasswordVisible,
                        //   bg_color: AppColor.WHITE,
                        //   isShadowHide: true,
                        //   hint_text: "Enter Transaction Password",
                        //   icon: Icon(Iconsax.key, color: AppColor.TEXT_GREY, size: 20.0),
                        //   suffix_icon: Row(
                        //     mainAxisSize: MainAxisSize.min,
                        //     children: [
                        //       if (_isValidatingPassword)
                        //         const Padding(
                        //           padding: EdgeInsets.symmetric(horizontal: 6.0),
                        //           child: SizedBox(
                        //             height: 16,
                        //             width: 16,
                        //             child: CircularProgressIndicator(strokeWidth: 2),
                        //           ),
                        //         )
                        //       else if (_transPasswordController.text.trim().isNotEmpty)
                        //         Padding(
                        //           padding: const EdgeInsets.symmetric(horizontal: 6.0),
                        //           child: Icon(
                        //             _isTransPasswordValid ? Icons.check_circle : Icons.cancel,
                        //             color: _isTransPasswordValid ? Colors.green : Colors.red,
                        //             size: 18.0,
                        //           ),
                        //         ),
                        //       IconButton(
                        //         icon: Icon(
                        //           _isPasswordVisible ? Iconsax.eye : Iconsax.eye_slash,
                        //           color: AppColor.GREY_MEDIUM,
                        //           size: 20.0,
                        //         ),
                        //         onPressed: () {
                        //           setState(() {
                        //             _isPasswordVisible = !_isPasswordVisible;
                        //           });
                        //         },
                        //       ),
                        //     ],
                        //   ),
                        // ),

                        AddVerticalSpacing(25.0),
                        !_isTransPasswordValid && _transPasswordController.text.trim().isNotEmpty ? Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text("Invalid password! Please enter the correct password.", style: StyleHelper.popinsStyle(color: AppColor.RED_DARK, fontWeight: FontWeight.w600),),
                        ) : SizedBox(),
                        _isValidatingPassword ? ProgressDialog().showLoadingDot() :  primaryButton(
                          title: "Submit Request",
                          // is_disable: !_isTransPasswordValid,
                          onTap: (){
                            showCustomBottomSheet(context: context, child: ShowOtpVerificationBottomSheet(
                              // onChangePassword: _onTransPasswordChanged,
                              callbackFn: (pass) async {
                                context.pop();
                                _transPasswordController.text = pass;
                                await _onTransPasswordChanged(pass,callbakFn: (ressds){
                                  _submitTopup();
                                });
                              },
                            ));
                          },
                          // onTap: _submitTopup,
                        ),

                      ],
                    ),
                  ),
                  AddVerticalSpacing(15.0),

                ],
              ),
            ),

            AddVerticalSpacing(20.0),
          ],
        ),
      ),
    );
  }
}



class ShowOtpVerificationBottomSheet extends ConsumerWidget {
  final Function? callbackFn;
  final Function? onChangePassword;
  ShowOtpVerificationBottomSheet({super.key,this.callbackFn,this.onChangePassword});

  final invisiblePaswordState = StateProvider<bool>((ref) => true);
  final txt_password = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var invisiblePasword = ref.watch(invisiblePaswordState);
    return Container(
      height: 300.0,
      width: ScreenHelper().get_width(context),
      decoration: BoxDecoration(
        color: AppColor.WHITE,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        )
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Row(
            children: [
              Expanded(
                child: Text("Verify Your Password",style: StyleHelper.popinsStyle(fontSize: 15.0,fontWeight: FontWeight.w600)),
              ),
              CustomInkWell(
                onTap: (){
                  context.pop();
                },
                child: CircleAvatar(
                  backgroundColor: AppColor.PRIMARY_COLOR,
                  child: Icon(Icons.close,color: AppColor.WHITE,size: 18.0,),
                ),
              ),
            ],
          ),
          AddVerticalSpacing(15.0),
          inputRequiredText(
            text: "Password",
            isRequired: true
          ),
          AddVerticalSpacing(15.0),
          input_text_field(
            controller: txt_password,
            bg_color: AppColor.WHITE,
            hint_text: "Enter Your Password",
            obscureText: invisiblePasword,
            onChanged: onChangePassword,
            suffix_icon: Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: CustomInkWell(
                onTap: (){
                  ref.read(invisiblePaswordState.notifier).state = !invisiblePasword;
                },
                child: Icon(invisiblePasword ? Iconsax.eye_slash : Iconsax.eye,size: 20.0)),
            )
          ),

          AddVerticalSpacing(20.0),
          primaryButton(
            title: "Book Tour",
            onTap: (){
              if(txt_password.text.trim().isEmpty){
                AlertToast.show_message_dialog(
                  title: "VALIDATION",
                  message: "Please Enter Password!"
                );
                return;
              }

              if(callbackFn != null){
                callbackFn!(txt_password.text);
              }
            }
          ),
        ],
      ),
    );
  }
}