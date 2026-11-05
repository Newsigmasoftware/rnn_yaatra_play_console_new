// ignore_for_file: unused_local_variable

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:rnn_yaatra/constants/colors.dart';
import 'package:rnn_yaatra/constants/constants.dart';
import 'package:rnn_yaatra/helpers/date_picker_helper.dart';
import 'package:rnn_yaatra/helpers/image_picker_helper.dart'; 
import 'package:rnn_yaatra/utils/screen_helper.dart';
import 'package:rnn_yaatra/utils/spacings.dart';
import 'package:rnn_yaatra/utils/strings_helper.dart';
import 'package:rnn_yaatra/utils/txt_styles.dart';
import 'package:rnn_yaatra/view_models/fund_management_view_models/deposit_request_view_model.dart';
import 'package:rnn_yaatra/widgets/app_bar.dart';
import 'package:rnn_yaatra/widgets/buttons.dart';
import 'package:rnn_yaatra/widgets/container_item.dart';
import 'package:rnn_yaatra/widgets/image_view.dart';
import 'package:rnn_yaatra/widgets/text_fields.dart';


class DepositRequest extends ConsumerStatefulWidget {
  const DepositRequest({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DepositRequestState();
}

class _DepositRequestState extends ConsumerState<DepositRequest> {
  final DepositRequestViewModel depositRequestViewModel = DepositRequestViewModel();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      depositRequestViewModel.getChain(ref);
    });
  }

  @override
  Widget build(BuildContext context) {
    var selectedTabIndex = ref.watch(depositRequestViewModel.pageStateProvider).selectedTabIndex;
    return Scaffold(
      appBar: CustomAppBar(
        title: "Deposit Request",
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AddVerticalSpacing(10.0),
            // Row(
            //   children: [
            //     Expanded(
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.center,
            //         children: [
            //           CircleAvatar(
            //             backgroundColor: AppColor.PRIMARY_COLOR,
            //             child: Icon(Iconsax.card5,color: AppColor.WHITE,size: 20.0,),
            //           ),
            //           AddVerticalSpacing(5.0),
            //           Text("Payment Mode",style: StyleHelper.popinsStyle(fontSize: 15.0,fontWeight: FontWeight.w500),),
            //         ],
            //       ),
            //     ),
            //     Container(
            //       width: 50.0,
            //       height: 2.0,
            //       decoration: BoxDecoration(
            //         color: selectedTabIndex > 0 ? AppColor.PRIMARY_COLOR : AppColor.GREY_LIGHT
            //       ),
            //     ),
            //     Expanded(
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.center,
            //         children: [
            //           CircleAvatar(
            //             backgroundColor: selectedTabIndex > 0 ?  AppColor.PRIMARY_COLOR : AppColor.PRIMARY_COLOR.withValues(alpha: 0.1),
            //             child: Icon(Icons.currency_rupee,color:  selectedTabIndex > 0 ?  AppColor.WHITE : AppColor.PRIMARY_COLOR,size: 20.0,),
            //           ),
            //           AddVerticalSpacing(5.0),
            //           Text("Request",style: StyleHelper.popinsStyle(fontSize: 15.0,fontWeight: FontWeight.w500),),
            //         ],
            //       ),
            //     ),
                
            //   ],
            // ),
            // AddVerticalSpacing(20.0),
            request_form_section(),
            // selectedTabIndex == 0 ? paymentModeSection() : selectedTabIndex == 1 ? request_form_section() : SizedBox(),
            AddVerticalSpacing(40.0),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 15.0,right: 15.0,bottom: 5.0,top: 5.0),
          child: Row(
            children: [
              // selectedTabIndex > 0 ? Expanded(
              //   child: primaryButton(
              //     title: "Back",
              //     bgColor: AppColor.TEXT_DARK,
              //     onTap: (){
              //       ref.read(depositRequestViewModel.pageStateProvider.notifier).setTabIndex(tabIndex: 0);
              //     }
              //   ),
              // ) : SizedBox(),
              // AddHorizontalSpacing(selectedTabIndex > 0 ? 10.0 : 0),
              Expanded(
                child: primaryButton(
                  // title: selectedTabIndex == 1 ? "Submit Request" : "Next",
                  title: "Submit Request",
                  onTap: (){
                    depositRequestViewModel.deposit_request(context, ref);
                    // if(selectedTabIndex == 1){
                    //   depositRequestViewModel.deposit_request(context, ref);
                    //   return;
                    // }
                    // ref.read(depositRequestViewModel.pageStateProvider.notifier).setTabIndex(tabIndex: 1);
                  }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget paymentModeSection() {
    var pageState = ref.watch(depositRequestViewModel.pageStateProvider);
    var chainList = pageState.chainList ?? [];
    var selectedChain = pageState.selectedChain;
    var isLoading = pageState.isLoadingChains;

    String qrImageUrl = "https://rnnyaatraay.com/Resources/RNNQR.jpg";
    if (selectedChain != null &&
        selectedChain.qRImage != null &&
        selectedChain.qRImage!.trim().isNotEmpty) {
      if (selectedChain.qRImage!.startsWith("http")) {
        qrImageUrl = selectedChain.qRImage!;
      } else {
        qrImageUrl = "${APIURL.IMAGE_BASE_URL}${selectedChain.qRImage}";
      }
    }

    return Container(
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
                        "Pay",
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
                Text("Company Payment QR",style: StyleHelper.popinsStyle(fontSize: 14.0,fontWeight: FontWeight.w600)),
                Text("Scan the QR using your preferred UPI or banking app.",style: StyleHelper.popinsStyle(fontSize: 11.0,fontWeight: FontWeight.w500)),
                AddVerticalSpacing(5.0),
                // isLoading
                //     ? Center(
                //         child: CircularProgressIndicator(
                //           color: AppColor.PRIMARY_COLOR,
                //         ),
                //       )
                //     : Container(
                //         padding: EdgeInsets.symmetric(horizontal: 12.0),
                //         decoration: BoxDecoration(
                //           color: AppColor.WHITE,
                //           border: Border.all(color: AppColor.GREY_LIGHT),
                //           borderRadius: BorderRadius.circular(10.0),
                //         ),
                //         child: DropdownButtonHideUnderline(
                //           child: DropdownButton<ChainData>(
                //             value: selectedChain,
                //             isExpanded: true,
                //             hint: Text("--SELECT--"),
                //             items: chainList.map((item) {
                //               return DropdownMenuItem<ChainData>(
                //                 value: item,
                //                 child: Text(
                //                   item.networkName ?? "QR Code",
                //                   style: StyleHelper.popinsStyle(fontSize: 14.0),
                //                 ),
                //               );
                //             }).toList(),
                //             onChanged: (val) {
                //               if (val != null) {
                //                 ref.read(depositRequestViewModel.pageStateProvider.notifier).setSelectedChain(val);
                //               }
                //             },
                //           ),
                //         ),
                //       ),

                AddVerticalSpacing(20.0),
                show_simple_network_image(
                  context,
                  imageURL: qrImageUrl,
                  height: 300.0,
                  fit: BoxFit.contain
                )

              ],
            ),
          ),
          AddVerticalSpacing(15.0),

        ],
      ),
    );
  }


  Widget request_form_section() {
    var recieptImage = ref.watch(depositRequestViewModel.pageStateProvider).selectedReceipt;
    return Container(
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
                        "Request",
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
                AddVerticalSpacing(15.0),
                Text("Payment Amount",style: StyleHelper.popinsStyle(fontSize: 14.0,fontWeight: FontWeight.w600)),
                AddVerticalSpacing(5.0),
                input_text_field(
                  controller: depositRequestViewModel.txt_amount,
                  bg_color: AppColor.WHITE,
                  isShadowHide: true,
                  hint_text: "Enter Payment Amount",
                  keyboardType: TextInputType.number,
                  icon: Icon(Icons.currency_rupee,color: AppColor.TEXT_GREY,size: 20.0,),
                ),

                AddVerticalSpacing(15.0),
                Text("Payment Date",style: StyleHelper.popinsStyle(fontSize: 14.0,fontWeight: FontWeight.w600)),
                AddVerticalSpacing(5.0),
                CustomInkWell(
                  onTap: (){
                    DatePickerHelper().pickDate(context, response: (res){
                      if (res != null && res.toString().isNotEmpty) {
                        try {
                          DateTime parsed = DateTime.parse(res.toString());
                          depositRequestViewModel.txt_deposit_date.text = DateFormat('dd-MMM-yyyy').format(parsed);
                        } catch (_) {
                          depositRequestViewModel.txt_deposit_date.text = res.toString();
                        }
                      }
                    });
                  },
                  child: input_text_field(
                    controller: depositRequestViewModel.txt_deposit_date,
                    readOnly: true,
                    bg_color: AppColor.WHITE,
                    isShadowHide: true,
                    hint_text: "Enter Deposit Date",
                    icon: Icon(Iconsax.calendar,color: AppColor.TEXT_GREY,size: 20.0,),
                  ),
                ),

                AddVerticalSpacing(15.0),
                Text("Remark",style: StyleHelper.popinsStyle(fontSize: 14.0,fontWeight: FontWeight.w600)),
                AddVerticalSpacing(5.0),
                input_text_field(
                  controller: depositRequestViewModel.txt_remark,
                  bg_color: AppColor.WHITE,
                  isShadowHide: true,
                  is_textarea: true,
                  hint_text: "Enter Remark",
                ),

                AddVerticalSpacing(15.0),
                Text("Upload Payment Receipt",style: StyleHelper.popinsStyle(fontSize: 14.0,fontWeight: FontWeight.w600)),
                AddVerticalSpacing(5.0),
                CustomInkWell(
                  onTap: (){
                    ImagePickerHelper.show_image_picker_dialog(
                      context,
                      pickFromCameraResult: (image){
                        ref.read(depositRequestViewModel.pageStateProvider.notifier).setReceiptImage(receiptImage: image);
                      },
                      pickFromGalleryResult: (image){
                        ref.read(depositRequestViewModel.pageStateProvider.notifier).setReceiptImage(receiptImage: image);
                      }
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
                          child: !StringsHelper.is_empty_or_null("$recieptImage") ?  ClipRRect(
                            borderRadius: BorderRadiusGeometry.circular(10.0),
                            child: Image.file(File("$recieptImage"),width: 60.0,height: 60.0,fit: BoxFit.cover,)) : Icon(Iconsax.document_upload5,color: AppColor.ORANGE_PENDING,size: 32.0,),
                        ),
                        AddHorizontalSpacing(10.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(StringsHelper.is_empty_or_null("$recieptImage") ? "Not Uploaded" : "Receipt Uploaded",style: StyleHelper.popinsStyle(fontSize: 14.0,fontWeight: FontWeight.w600)),
                              Text("Supported formats: PNG, JPG, JPEG",style: StyleHelper.popinsStyle(fontSize: 12.0,fontWeight: FontWeight.w400,color: AppColor.TEXT_GREY)),
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
    );
  }

}
