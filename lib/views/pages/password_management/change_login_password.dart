import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rnn_yaatra/constants/colors.dart';
import 'package:rnn_yaatra/services/account_services.dart';
import 'package:rnn_yaatra/utils/screen_helper.dart';
import 'package:rnn_yaatra/utils/spacings.dart';
import 'package:rnn_yaatra/utils/txt_styles.dart';
import 'package:rnn_yaatra/widgets/app_bar.dart';
import 'package:rnn_yaatra/widgets/buttons.dart';
import 'package:rnn_yaatra/widgets/container_item.dart';
import 'package:rnn_yaatra/widgets/dilougs.dart';
import 'package:rnn_yaatra/widgets/snack_bar.dart';
import 'package:rnn_yaatra/widgets/text_fields.dart';

class ChangeLoginPassword extends ConsumerStatefulWidget {
  const ChangeLoginPassword({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChangeLoginPasswordState();
}

class _ChangeLoginPasswordState extends ConsumerState<ChangeLoginPassword> {
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  final AccountServices _accountServices = AccountServices();

  bool _invisibleOldPassword = true;
  bool _invisibleNewPassword = true;
  bool _invisibleConfirmPassword = true;

  Future<void> _submitChangePassword() async {
    final oldPass = _oldPasswordController.text.trim();
    final newPass = _newPasswordController.text.trim();
    final confirmPass = _confirmPasswordController.text.trim();

    if (oldPass.isEmpty) {
      AlertToast.show_message_dialog(
        title: "Validation",
        message: "Please enter Old Password!",
      );
      return;
    }

    if (newPass.isEmpty) {
      AlertToast.show_message_dialog(
        title: "Validation",
        message: "Please enter New Password!",
      );
      return;
    }

    if (confirmPass.isEmpty) {
      AlertToast.show_message_dialog(
        title: "Validation",
        message: "Please enter Confirm Password!",
      );
      return;
    }

    if (newPass != confirmPass) {
      AlertToast.show_message_dialog(
        title: "Validation",
        message: "New Password and Confirm Password do not match!",
      );
      return;
    }

    ProgressDialog().show(context, ref);

    try {
      final res = await _accountServices.changePassword(
        oldPassword: oldPass,
        newPassword: newPass,
      );

      if (!mounted) return;
      ProgressDialog().hide(context, ref);

      if (res.status == true) {
        AlertToast.show_message_dialog(
          title: "Success",
          message: res.message ?? "Password changed successfully!",
        );
        _oldPasswordController.clear();
        _newPasswordController.clear();
        _confirmPasswordController.clear();
        context.pop();
      } else {
        AlertToast.show_message_dialog(
          title: "Change Password Failed",
          message: res.message ?? "Failed to change password. Please check your old password.",
        );
      }
    } catch (e) {
      if (mounted) {
        ProgressDialog().hide(context, ref);
        AlertToast.show_message_dialog(
          title: "Error",
          message: "An error occurred while changing password.",
        );
      }
    }
  }

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Change Login Password",
        onBackPressed: () {
          context.pop();
        },
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AddVerticalSpacing(20.0),
            Container(
              decoration: BoxDecoration(
                color: AppColor.WHITE,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: AppColor.GREY_LIGHT.withValues(alpha: 0.7),
                    spreadRadius: 2.0,
                    offset: const Offset(0, 2),
                    blurRadius: 6.0,
                  )
                ],
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
                              Icon(Iconsax.key5, color: Colors.white, size: 16),
                              SizedBox(width: 6),
                              Text(
                                "Change Login Password",
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
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AddVerticalSpacing(15.0),
                        Text("Old Password", style: StyleHelper.popinsStyle(fontSize: 14.0, fontWeight: FontWeight.w600)),
                        AddVerticalSpacing(5.0),
                        input_text_field(
                          controller: _oldPasswordController,
                          bg_color: AppColor.WHITE,
                          isShadowHide: true,
                          hint_text: "Enter Old Password",
                          icon:  Icon(Icons.key, color: AppColor.TEXT_GREY, size: 20.0),
                          obscureText: _invisibleOldPassword,
                          suffix_icon: Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: CustomInkWell(
                              onTap: () {
                                setState(() {
                                  _invisibleOldPassword = !_invisibleOldPassword;
                                });
                              },
                              child: Icon(_invisibleOldPassword ? Iconsax.eye_slash : Iconsax.eye, size: 20.0),
                            ),
                          ),
                        ),

                        AddVerticalSpacing(15.0),
                        Text("New Password", style: StyleHelper.popinsStyle(fontSize: 14.0, fontWeight: FontWeight.w600)),
                        AddVerticalSpacing(5.0),
                        input_text_field(
                          controller: _newPasswordController,
                          bg_color: AppColor.WHITE,
                          isShadowHide: true,
                          hint_text: "Enter New Password",
                          icon:  Icon(Icons.key, color: AppColor.TEXT_GREY, size: 20.0),
                          obscureText: _invisibleNewPassword,
                          suffix_icon: Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: CustomInkWell(
                              onTap: () {
                                setState(() {
                                  _invisibleNewPassword = !_invisibleNewPassword;
                                });
                              },
                              child: Icon(_invisibleNewPassword ? Iconsax.eye_slash : Iconsax.eye, size: 20.0),
                            ),
                          ),
                        ),

                        AddVerticalSpacing(15.0),
                        Text("Confirm Password", style: StyleHelper.popinsStyle(fontSize: 14.0, fontWeight: FontWeight.w600)),
                        AddVerticalSpacing(5.0),
                        input_text_field(
                          controller: _confirmPasswordController,
                          bg_color: AppColor.WHITE,
                          isShadowHide: true,
                          hint_text: "Enter Confirm Password",
                          icon:  Icon(Icons.key, color: AppColor.TEXT_GREY, size: 20.0),
                          obscureText: _invisibleConfirmPassword,
                          suffix_icon: Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: CustomInkWell(
                              onTap: () {
                                setState(() {
                                  _invisibleConfirmPassword = !_invisibleConfirmPassword;
                                });
                              },
                              child: Icon(_invisibleConfirmPassword ? Iconsax.eye_slash : Iconsax.eye, size: 20.0),
                            ),
                          ),
                        ),

                        AddVerticalSpacing(25.0),

                        primaryButton(
                          title: "Submit",
                          onTap: _submitChangePassword,
                        ),
                      ],
                    ),
                  ),
                  AddVerticalSpacing(15.0),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
