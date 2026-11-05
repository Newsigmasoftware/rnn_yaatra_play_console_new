import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart'; 
import 'package:rnn_yaatra/constants/colors.dart';
import 'package:rnn_yaatra/constants/constants.dart';
import 'package:rnn_yaatra/helpers/image_picker_helper.dart';
import 'package:rnn_yaatra/helpers/navigation_helper.dart';
import 'package:rnn_yaatra/models/master_models/get_bank_list_response_model.dart';
import 'package:rnn_yaatra/utils/screen_helper.dart';
import 'package:rnn_yaatra/utils/spacings.dart';
import 'package:rnn_yaatra/utils/strings_helper.dart';
import 'package:rnn_yaatra/utils/txt_styles.dart';
import 'package:rnn_yaatra/view_models/account_view_models/get_profile_detail_view_model.dart';
import 'package:rnn_yaatra/view_models/account_view_models/kyc_view_model.dart';
import 'package:rnn_yaatra/view_models/master_view_model.dart'; 
import 'package:rnn_yaatra/widgets/app_bar.dart';
import 'package:rnn_yaatra/widgets/buttons.dart';
import 'package:rnn_yaatra/widgets/container_item.dart';
import 'package:rnn_yaatra/widgets/dilougs.dart';
import 'package:rnn_yaatra/widgets/image_view.dart';
import 'package:rnn_yaatra/widgets/shimmer.dart';
import 'package:rnn_yaatra/widgets/show_bottomsheet_filter.dart';
import 'package:rnn_yaatra/widgets/text_fields.dart';



class KycVerification extends ConsumerStatefulWidget {
  const KycVerification({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _KycVerificationState();
}

class _KycVerificationState extends ConsumerState<KycVerification> {

  final KycViewModel kycViewModel = KycViewModel();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      ref.read(getMasterViewModelGlobalNotifier.notifier).get_bank_list();
      ref.read(getProfileViewModelNotifier.notifier).get_kyc_detail(callbackfn: (kycDetailRes) {
        if(kycDetailRes.data != null){
          kycViewModel.txt_pan_no.text = kycDetailRes.data?.panno ?? "";
          kycViewModel.txt_bank_name.text = kycDetailRes.data?.bankName ?? "";
          kycViewModel.txt_bank_value.text = kycDetailRes.data?.bankName ?? "";
          kycViewModel.txt_account_no.text = kycDetailRes.data?.accountNo ?? "";
          kycViewModel.txt_ifsc_code.text = kycDetailRes.data?.ifsccode ?? "";
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var loadingKyc = ref.watch(getProfileViewModelNotifier).isLoadingKycDetail;
    var kycDetail = ref.watch(getProfileViewModelNotifier).kycDetailResponseModel;

    var pageState = ref.watch(kycViewModel.pageStateProvider);
    var selectedPanImage = pageState.selectedPanImage;
    var selectedPassbookImage = pageState.passbookImage;

    var isLoadingBank = ref.watch(getMasterViewModelGlobalNotifier).isLoadingBankList;
    var bankList = ref.watch(getMasterViewModelGlobalNotifier).bankListResponseModel;
    return Scaffold(
      appBar: CustomAppBar(
        title: 'KYC Verification Form',
        onBackPressed: () {
          context.pop();
        },
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AddVerticalSpacing(20.0),
            
            loadingKyc ? kyc_user_Detail_card_shimmer() : Container(
              decoration: BoxDecoration(
                color: AppColor.WHITE,
                border: Border.all(color: AppColor.PRIMARY_COLOR.withValues(alpha: 0.2)),
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: AppColor.GREY_LIGHT.withValues(alpha: 0.7),
                    spreadRadius: 2.0,
                    blurRadius: 6.0,
                    offset: Offset(0, 3)
                  )
                ]
              ),
              padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
              width: ScreenHelper().get_width(context),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("User Name",style: StyleHelper.popinsStyle(fontSize: 12.0,fontWeight: FontWeight.w500)),
                              Text(kycDetail?.data?.username ?? "",style: StyleHelper.popinsStyle(fontSize: 15.0,fontWeight: FontWeight.w600,color: AppColor.PRIMARY_COLOR)),
                            ],
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: AppColor.PRIMARY_COLOR.withValues(alpha: 0.1),
                          child: Icon(Iconsax.user,color: AppColor.PRIMARY_COLOR,size: 22.0,),
                        )
                      ],
                    )
                  ),
                  AddHorizontalSpacing(10.0),
                  Container(
                    width: 1.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      color: AppColor.GREY_LIGHT
                    ),
                  ),
                  AddHorizontalSpacing(10.0),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Joining Date",style: StyleHelper.popinsStyle(fontSize: 12.0,fontWeight: FontWeight.w500)),
                              Text(kycDetail?.data?.joiningDate ?? "",style: StyleHelper.popinsStyle(fontSize: 15.0,fontWeight: FontWeight.w600,color: AppColor.PRIMARY_COLOR)),
                            ],
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: AppColor.PRIMARY_COLOR.withValues(alpha: 0.1),
                          child: Icon(Iconsax.calendar,color: AppColor.PRIMARY_COLOR,size: 22.0,),
                        )
                      ],
                    )
                  ),
                ],
              ),
            ),

            AddVerticalSpacing(20.0),
            Container(
              decoration: BoxDecoration(
                color: AppColor.WHITE,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: AppColor.GREY_LIGHT.withValues(alpha: 0.7),
                    spreadRadius: 2.0,
                    offset: Offset(0, 2),
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
                        // Top-Left Badge Header
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
                            children: [
                              Icon(Iconsax.card,color: Colors.white, size: 16),
                              const SizedBox(width: 6),
                              Text(
                                "Pan Card",
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
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Text("Address Proof Type",style: StyleHelper.popinsStyle(fontSize: 14.0,fontWeight: FontWeight.w600)),
                        // AddVerticalSpacing(5.0),
                        // input_text_field(
                        //   bg_color: AppColor.WHITE,
                        //   isShadowHide: true,
                        //   hint_text: "Pan Card",
                        //   suffix_icon: Padding(
                        //     padding: EdgeInsets.only(top: 10),
                        //     child: Icon(Icons.arrow_drop_down,color: AppColor.GREY_MEDIUM,),
                        //   )
                        // ),

                        // AddVerticalSpacing(15.0),
                        Text("Pan Number",style: StyleHelper.popinsStyle(fontSize: 14.0,fontWeight: FontWeight.w600)),
                        AddVerticalSpacing(5.0),
                        input_text_field(
                          maxLength: 10,
                          controller: kycViewModel.txt_pan_no,
                          bg_color: AppColor.WHITE,
                          isShadowHide: true,
                          hint_text: "Enter Pan Number",
                          icon: Icon(Iconsax.card,color: AppColor.TEXT_GREY,size: 20.0,),
                        ),

                        AddVerticalSpacing(15.0),
                        Text("Upload Pan Card",style: StyleHelper.popinsStyle(fontSize: 14.0,fontWeight: FontWeight.w600)),
                        AddVerticalSpacing(5.0),
                        CustomInkWell(
                          onTap: (){
                            ImagePickerHelper.show_image_picker_dialog(
                              context,
                              pickFromCameraResult: (image){
                                ref.read(kycViewModel.pageStateProvider.notifier).setPanImage(image: image);
                              },
                              pickFromGalleryResult: (image){
                                ref.read(kycViewModel.pageStateProvider.notifier).setPanImage(image: image);
                              },
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColor.GREY_LIGHT),
                              color: AppColor.GREY_EXTRA_LIGHT.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(12.0)
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: AppColor.ORANGE_PENDING.withValues(alpha: 0.1),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  height: 60.0,
                                  width: 60.0,
                                  child: !StringsHelper.is_empty_or_null("$selectedPanImage") ? ClipRRect(
                                    borderRadius: BorderRadiusGeometry.circular(10.0),
                                    child: Image.file(File("$selectedPanImage"),width: 60.0,height: 60.0,fit: BoxFit.cover,)) : 
                                    !StringsHelper.is_empty_or_null("${kycDetail?.data?.userPanName ?? ""}") ? show_simple_network_image(
                                      context,
                                      imageURL: "${APIURL.IMAGE_BASE_URL}${kycDetail?.data?.userPanName ?? ""}",
                                      height: 60.0,
                                      width: 60.0,
                                      fit: BoxFit.cover,
                                      radius: 10.0
                                    ) : Icon(Iconsax.document_upload5,color: AppColor.ORANGE_PENDING,size: 32.0,),
                                ),
                                AddHorizontalSpacing(10.0),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(StringsHelper.is_empty_or_null("$selectedPanImage") ? "Not Uploaded" : "Pan Card Uploaded",style: StyleHelper.popinsStyle(fontSize: 14.0,fontWeight: FontWeight.w600)),
                                      Text("Supported formats: PNG, JPG, JPEG",style: StyleHelper.popinsStyle(fontSize: 12.0,fontWeight: FontWeight.w400,color: AppColor.TEXT_GREY)),
                                      // Text("Max file size: 100KB",style: StyleHelper.popinsStyle(fontSize: 12.0,fontWeight: FontWeight.w400,color: AppColor.TEXT_GREY)),
                                    ],
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: AppColor.WHITE,
                                    border: Border.all(color: AppColor.PRIMARY_COLOR_SUPPORTIVE),
                                    borderRadius: BorderRadius.circular(15.0)
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 2.0),
                                  child: Center(
                                    child: Text("Upload",style: StyleHelper.popinsStyle(fontSize: 12.0,color: AppColor.ORANGE_PENDING,fontWeight: FontWeight.w600)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  AddVerticalSpacing(15.0),

                ],
              ),
            ),

            AddVerticalSpacing(20.0),
            Container(
              decoration: BoxDecoration(
                color: AppColor.WHITE,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: AppColor.GREY_LIGHT.withValues(alpha: 0.7),
                    spreadRadius: 2.0,
                    offset: Offset(0, 2),
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
                        // Top-Left Badge Header
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
                            children: [
                              Icon(Iconsax.bank,color: Colors.white, size: 16),
                              const SizedBox(width: 6),
                              Text(
                                "Bank Proof",
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
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Bank Name",style: StyleHelper.popinsStyle(fontSize: 14.0,fontWeight: FontWeight.w600)),
                        AddVerticalSpacing(5.0),
                        isLoadingBank ? ProgressDialog().showLoadingDot() : CustomInkWell(
                          onTap: (){
                            List itemList = [];
                            bankList?.data?.forEach((element) => itemList.add(element.toJson()));
                            AppNav.to(buildContext: context,ShowFilterBottomsheetPageRiverpod(
                              itemList: itemList,
                              filterKeyName: GetBankListResponseModelItem.nameKey,
                              showKeyName: GetBankListResponseModelItem.nameKey,
                              inputTitle: "Select Bank",
                              title: "Select Bank",
                              response: (res){
                                GetBankListResponseModelItem item = GetBankListResponseModelItem.fromJson(res);
                                kycViewModel.txt_bank_name.text = item.name ?? "";
                                kycViewModel.txt_bank_value.text = item.id ?? "";
                              },
                            ));
                          },
                          child: input_text_field(
                            readOnly: true,
                            controller: kycViewModel.txt_bank_name,
                            bg_color: AppColor.WHITE,
                            isShadowHide: true,
                            hint_text: "Bank Name",
                            suffix_icon: Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Icon(Icons.arrow_drop_down,color: AppColor.GREY_MEDIUM,),
                            )
                          ),
                        ),

                        AddVerticalSpacing(15.0),
                        Text("Account No",style: StyleHelper.popinsStyle(fontSize: 14.0,fontWeight: FontWeight.w600)),
                        AddVerticalSpacing(5.0),
                        input_text_field(
                          controller: kycViewModel.txt_account_no,
                          bg_color: AppColor.WHITE,
                          isShadowHide: true,
                          hint_text: "Enter Account No",
                          icon: Icon(Iconsax.card,color: AppColor.TEXT_GREY,size: 20.0,),
                        ),
                        AddVerticalSpacing(15.0),
                        Text("IFSC Code",style: StyleHelper.popinsStyle(fontSize: 14.0,fontWeight: FontWeight.w600)),
                        AddVerticalSpacing(5.0),
                        input_text_field(
                          controller: kycViewModel.txt_ifsc_code,
                          bg_color: AppColor.WHITE,
                          isShadowHide: true,
                          hint_text: "Enter IFSC Code",
                          icon: Icon(Iconsax.code,color: AppColor.TEXT_GREY,size: 20.0,),
                        ),

                        AddVerticalSpacing(15.0),
                        Text("Upload Cheque/Passbook",style: StyleHelper.popinsStyle(fontSize: 14.0,fontWeight: FontWeight.w600)),
                        AddVerticalSpacing(5.0),
                        CustomInkWell(
                          onTap: (){
                            ImagePickerHelper.show_image_picker_dialog(
                              context,
                              pickFromCameraResult: (image){
                                ref.read(kycViewModel.pageStateProvider.notifier).setPassbookImage(passbookImage: image);
                              },
                              pickFromGalleryResult: (image){
                                ref.read(kycViewModel.pageStateProvider.notifier).setPassbookImage(passbookImage: image);
                              },
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColor.GREY_LIGHT),
                              color: AppColor.GREY_EXTRA_LIGHT.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(12.0)
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: AppColor.ORANGE_PENDING.withValues(alpha: 0.1),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  height: 60.0,
                                  width: 60.0,
                                  child: !StringsHelper.is_empty_or_null("$selectedPassbookImage") ? ClipRRect(
                                    borderRadius: BorderRadiusGeometry.circular(10.0),
                                    child: Image.file(File("$selectedPassbookImage"),width: 60.0,height: 60.0,fit: BoxFit.cover,)) : 
                                    !StringsHelper.is_empty_or_null(kycDetail?.data?.userChequeBookName ?? "") ? show_simple_network_image(
                                      context,
                                      imageURL: "${APIURL.IMAGE_BASE_URL}${kycDetail?.data?.userChequeBookName ?? ""}",
                                      height: 60.0,
                                      width: 60.0,
                                      fit: BoxFit.cover,
                                      radius: 10.0
                                    ) : Icon(Iconsax.document_upload5,color: AppColor.ORANGE_PENDING,size: 32.0,),
                                ),
                                AddHorizontalSpacing(10.0),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(StringsHelper.is_empty_or_null("$selectedPanImage") ? "Not Uploaded" : "Cheque/Passbook Uploaded",style: StyleHelper.popinsStyle(fontSize: 14.0,fontWeight: FontWeight.w600)),
                                      Text("Supported formats: PNG, JPG, JPEG",style: StyleHelper.popinsStyle(fontSize: 12.0,fontWeight: FontWeight.w400,color: AppColor.TEXT_GREY)),
                                      // Text("Max file size: 100KB",style: StyleHelper.popinsStyle(fontSize: 12.0,fontWeight: FontWeight.w400,color: AppColor.TEXT_GREY)),
                                    ],
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: AppColor.WHITE,
                                    border: Border.all(color: AppColor.PRIMARY_COLOR_SUPPORTIVE),
                                    borderRadius: BorderRadius.circular(15.0)
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 2.0),
                                  child: Center(
                                    child: Text("Upload",style: StyleHelper.popinsStyle(fontSize: 12.0,color: AppColor.ORANGE_PENDING,fontWeight: FontWeight.w600)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  AddVerticalSpacing(15.0),
                ],
              ),
            ),
            AddVerticalSpacing(60.0),
            

          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0,right: 15.0,top: 5.0,bottom: 5.0),
          child: 
          // loadingKyc ? SizedBox() : kycDetail?.data?.cstatus.toString() == "1" ? SizedBox() : 
          primaryButton(
            title: "Update Details",
            isLoading: pageState.isLoading,
            onTap: (){
              kycViewModel.updateKyc(ref, context: context);
            }
          ),
        ),
      ),
    );
  }
}

