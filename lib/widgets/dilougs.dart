// ignore_for_file: deprecated_member_use, sort_child_properties_last, non_constant_identifier_names
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:rnn_yaatra/constants/colors.dart';
import 'package:rnn_yaatra/constants/images.dart';
import 'package:rnn_yaatra/helpers/navigation_helper.dart';
import 'package:rnn_yaatra/main.dart'; 
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';


Future<void> showErrorDialog({
  required BuildContext context,
  String? title,
  String? content,
  VoidCallback? onConfirm,
  VoidCallback? onCancel,
  String? buttonText,
  String? cancelButtonText,
  bool? isHideCancelButton,
  EdgeInsets? padding,
}) {
  return showDialog(
    context: navigatorKey.currentContext!,
    barrierDismissible: false,
    builder: (context) {
      return Center(
        child: Material(
          color: Colors.transparent,
          child: Padding(
            padding: padding ?? const EdgeInsets.symmetric(horizontal: 50),
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.WHITE,
                borderRadius: BorderRadius.circular(20.0),
              ),
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Lottie.asset(AppLottie.ALERT, height: 100),

                  const SizedBox(height: 10),

                  Text(
                    title ?? 'Confirmation',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 5),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      content ?? "Are you sure? you want to proceed",
                      textAlign: TextAlign.center,
                    ),
                  ),

                  const SizedBox(height: 25),

                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: isHideCancelButton == true
                          ? MediaQuery.of(context).size.width * 0.2
                          : 16,
                    ),
                    child: Row(
                      children: [
                        if (isHideCancelButton != true)
                          Expanded(
                            child: InkWell(
                              onTap: onCancel ??
                                  () {
                                    Navigator.pop(context);
                                  },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColor.GREY_EXTRA_LIGHT,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                height: 45,
                                child: Center(
                                  child: Text(
                                    cancelButtonText ?? "Cancel",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: AppColor.TEXT_GREY,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),

                        if (isHideCancelButton != true)
                          const SizedBox(width: 15),

                        Expanded(
                          child: InkWell(
                            onTap: onConfirm ??
                                () {
                                  Navigator.pop(context);
                                },
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColor.PRIMARY_COLOR,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: 45,
                              child: Center(
                                child: Text(
                                  buttonText ?? "Proceed",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.WHITE,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}


Future<void> showSuccessDialog({
  required BuildContext context,
  String? title,
  String? content,
  VoidCallback? onConfirm,
  VoidCallback? onCancel,
  String? buttonText,
  String? cancelButtonText,
  bool? isHideCancelButton,
  EdgeInsets? padding,
}) {
  return showDialog(
    context: navigatorKey.currentContext!,
    barrierDismissible: false,
    builder: (context) {
      return Center(
        child: Material(
          color: Colors.transparent,
          child: Padding(
            padding: padding ?? const EdgeInsets.symmetric(horizontal: 50),
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.WHITE,
                borderRadius: BorderRadius.circular(20.0),
              ),
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Lottie.asset(AppLottie.SUCCESS, height: 100),

                  const SizedBox(height: 10),

                  Text(
                    title ?? 'Success',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 5),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      content ?? "Operation completed successfully",
                      textAlign: TextAlign.center,
                    ),
                  ),

                  const SizedBox(height: 25),

                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: isHideCancelButton == true
                          ? MediaQuery.of(context).size.width * 0.2
                          : 16,
                    ),
                    child: Row(
                      children: [
                        if (isHideCancelButton != true)
                          Expanded(
                            child: InkWell(
                              onTap: onCancel ??
                                  () {
                                    Navigator.pop(context);
                                  },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColor.GREY_EXTRA_LIGHT,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                height: 45,
                                child: Center(
                                  child: Text(
                                    cancelButtonText ?? "Cancel",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: AppColor.TEXT_GREY,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),

                        if (isHideCancelButton != true)
                          const SizedBox(width: 15),

                        Expanded(
                          child: InkWell(
                            onTap: onConfirm ??
                                () {
                                  Navigator.pop(context);
                                },
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColor.PRIMARY_COLOR,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: 45,
                              child: Center(
                                child: Text(
                                  buttonText ?? "Ok",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.WHITE,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}


Future<void> showSearchJobConfirmationDialog({
  required BuildContext context,
  String? title,
  String? content,
  Widget? contentWidget,
  VoidCallback? onConfirm,
  VoidCallback? onCancel,
  String? buttonText,
  String? cancelButtonText,
  bool? isHideCancelButton,
  EdgeInsets? padding,
}) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return Center(
        child: Material(
          color: Colors.transparent,
          child: Padding(
            padding: padding ?? const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.WHITE,
                borderRadius: BorderRadius.circular(20.0),
              ),
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Lottie.asset(
                    AppLottie.SEND_EMAIL,
                    height: 110,
                  ),

                  const SizedBox(height: 10),

                  Text(
                    title ?? 'Confirmation',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 5),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: contentWidget ??
                        Text(
                          content ?? "Are you sure? you want to proceed.",
                          textAlign: TextAlign.center,
                        ),
                  ),

                  const SizedBox(height: 25),

                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: isHideCancelButton == true
                          ? MediaQuery.of(context).size.width * 0.2
                          : 16,
                    ),
                    child: Row(
                      children: [
                        if (isHideCancelButton != true)
                          Expanded(
                            child: InkWell(
                              onTap: onCancel ??
                                  () {
                                    Navigator.pop(context);
                                  },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColor.GREY_EXTRA_LIGHT,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                height: 45,
                                child: Center(
                                  child: Text(
                                    cancelButtonText ?? "Cancel",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: AppColor.TEXT_GREY,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),

                        if (isHideCancelButton != true)
                          const SizedBox(width: 15),

                        Expanded(
                          child: InkWell(
                            onTap: onConfirm ??
                                () {
                                  Navigator.pop(context);
                                },
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColor.PRIMARY_COLOR,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: 45,
                              child: Center(
                                child: Text(
                                  buttonText ?? "Proceed",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.WHITE,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

Future<void> showConfirmationDialog({
  String? title,
  String? content,
  Widget? contentWidget,
  VoidCallback? onConfirm,
  VoidCallback? onCancel,
  String? buttonText,
  String? cancelButtonText,
  bool? isHideCancelButton,
  EdgeInsets? padding,
}) {
  return showDialog(
    context: navigatorKey.currentContext!,
    barrierDismissible: false,
    builder: (context) {
      return Center(
        child: Material(
          color: Colors.transparent,
          child: Padding(
            padding: padding ?? const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.WHITE,
                borderRadius: BorderRadius.circular(20.0),
              ),
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Lottie.asset(
                    AppLottie.ALERT,
                    height: 110,
                  ),

                  const SizedBox(height: 10),

                  Text(
                    title ?? 'Confirmation',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 5),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: contentWidget ??
                        Text(
                          content ?? "Are you sure? you want to proceed.",
                          textAlign: TextAlign.center,
                        ),
                  ),

                  const SizedBox(height: 25),

                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: isHideCancelButton == true
                          ? MediaQuery.of(context).size.width * 0.2
                          : 16,
                    ),
                    child: Row(
                      children: [
                        if (isHideCancelButton != true)
                          Expanded(
                            child: InkWell(
                              onTap: onCancel ??
                                  () {
                                    Navigator.pop(context);
                                  },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColor.GREY_EXTRA_LIGHT,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                height: 45,
                                child: Center(
                                  child: Text(
                                    cancelButtonText ?? "Cancel",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: AppColor.TEXT_GREY,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),

                        if (isHideCancelButton != true)
                          const SizedBox(width: 15),

                        Expanded(
                          child: InkWell(
                            onTap: onConfirm ??
                                () {
                                  Navigator.pop(context);
                                },
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColor.PRIMARY_COLOR,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: 45,
                              child: Center(
                                child: Text(
                                  buttonText ?? "Proceed",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.WHITE,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}


// show_feedback_dialoug(){
//   // final FeedbackController feedbackController = Get.put(FeedbackController());
//   // feedbackController.is_feedback_send.value = false;
//   Get.dialog(
//       Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             child: Container(
//                 decoration: BoxDecoration(
//                   color: AppColor.WHITE,
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
//                 child: Material(
//                   color: Colors.transparent,
//                   child: SingleChildScrollView(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           children: [
//                             // Image.asset(AppIcons.SMILE,height: 22,width: 22,),
//                             AddHorizontalSpacing(10),
//                             Expanded(child: Text("Feedback",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),)),
//                             InkWell(
//                               onTap: (){
//                                 Get.back();
//                               },
//                               child: Icon(Icons.close,color: AppColor.TEXT_GREY,),
//                             ),
//                           ],
//                         ),
//                         Divider(
//                           color: AppColor.GREY_LIGHT,
//                         ),
//                         AddVerticalSpacing(10),
//                         Text("How would you rate app ?",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
//                         AddVerticalSpacing(3),
//                         Text("We strive to enhance the experience for our customers. please kindly give us your valuable feedback.",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500,color: AppColor.TEXT_GREY),),
//                         AddVerticalSpacing(20),
//                         // Obx(() => feedbackController.is_feedback_send.isTrue ? Column(
//                         //   crossAxisAlignment: CrossAxisAlignment.center,
//                         //   children: [
//                         //     Center(
//                         //       child: ZoomIn(child: Icon(Iconsax.tick_circle,color: Colors.green,size: 45,)),
//                         //     ),
//                         //     AddVerticalSpacing(15),
//                         //     FadeIn(
//                         //       delay: Duration(milliseconds: 550),
//                         //         child: Text("Thanks for your feedback",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15,color: AppColor.PRIMARY_COLOR),)),
//                         //     AddVerticalSpacing(15),
//                         //   ],
//                         // ) : Column(
//                         //   crossAxisAlignment: CrossAxisAlignment.center,
//                         //   children: [
//                         //     Center(
//                         //       child: RatingBar.builder(
//                         //         initialRating: 3,
//                         //         minRating: 1,
//                         //         direction: Axis.horizontal,
//                         //         allowHalfRating: true,
//                         //         itemCount: 5,
//                         //         itemSize: 30.0,
//                         //         itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
//                         //         itemBuilder: (context, _) => Icon(
//                         //           Icons.star,
//                         //           color: Colors.amber,
//                         //         ),
//                         //         onRatingUpdate: (rating) {
//                         //           print(rating);
//                         //         },
//                         //       ),
//                         //     ),
//                         //     AddVerticalSpacing(15),
//                         //     input_text_field(
//                         //         hint_text: "Type something...",
//                         //         is_textarea: true
//                         //     ),
//                         //     AddVerticalSpacing(25),
//                         //     primaryButton(
//                         //         title: "Send",
//                         //         onTap: (){
//                         //           feedbackController.is_feedback_send.value = true;
//                         //         }
//                         //     )
//                         //   ],
//                         // )),
                        

//                       ],
//                     ),
//                   ),
//                 )
//             ),
//           ),
//         ],
//       )
//   );
// }

final progressDialogProvider = StateProvider<bool>((ref) => false);

class ProgressDialog {

  /// SIMPLE LOADER UI
  Widget showLoading() {
    return Center(
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          color: AppColor.WHITE,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: CircularProgressIndicator(
            color: AppColor.PRIMARY_COLOR,
          ),
        ),
      ),
    );
  }

  Widget showLoadingCart({double? size}) {
    return Center(
      child: CircularProgressIndicator(
        color: AppColor.PRIMARY_COLOR,
      ),
    );
  }


  Widget showLoadingDot({double? size}) {
    return Center(
      child: LoadingAnimationWidget.staggeredDotsWave(
        color: AppColor.PRIMARY_COLOR,
        size: 30,
      ),
    );
  }

  Widget showCartQtyLoading() {
    return Center(
      child: CircularProgressIndicator(
        color: AppColor.PRIMARY_COLOR,
      ),
    );
  }

  /// SHOW DIALOG
  void show(
    BuildContext context,
    WidgetRef ref, {
    String? loadingText,
  }) {
    ref.read(progressDialogProvider.notifier).state = true;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async {
            hide(context, ref);
            return false;
          },
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
              color: Colors.black54,
              child: Center(
                child: Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                    color: AppColor.WHITE,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: CircularProgressIndicator(
                      color: AppColor.PRIMARY_COLOR,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  /// HIDE DIALOG
  void hide(BuildContext context, WidgetRef ref) {
    final canPop = ref.read(progressDialogProvider);

    if (canPop) {
      Navigator.of(context, rootNavigator: true).pop();
      ref.read(progressDialogProvider.notifier).state = false;
    }
  }
}



// show_report_item_dialoug({required RxString select_reason,required RxBool is_request_submit,txt_message_controller,onClickSubmit}) {
//   Get.dialog(
//     Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             child: Material(
//               color: Colors.transparent,
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: AppColor.WHITE,
//                   borderRadius: BorderRadius.circular(8.0),
//                 ),
//                 width: Get.width,
//                 padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
//                 child: Obx(()=> is_request_submit == true ? Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text("Report".toUpperCase(),style: TextStyle(fontWeight: FontWeight.w600,fontSize: 13,color: AppColor.PRIMARY_COLOR),),
//                     AddVerticalSpacing(20),
//                     Center(
//                       child: Icon(Iconsax.tick_circle,color: AppColor.GREEN,size: 60,),
//                     ),
//                     AddVerticalSpacing(10),
//                     Center(
//                       child: Text("Thanks for your feedback. we will take action soon.",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: AppColor.TEXT_GREY),textAlign: TextAlign.center,),
//                     ),
//                     AddVerticalSpacing(20),
//                     primaryButton(
//                         title: "Close",
//                         onTap: (){
//                           Get.back();
//                           Future.delayed(Duration(milliseconds: 300),(){
//                             is_request_submit.value = false;
//                           });
//                         }
//                     ),
//                   ],
//                 ) : Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text("Report".toUpperCase(),style: TextStyle(fontWeight: FontWeight.w600,fontSize: 13,color: AppColor.PRIMARY_COLOR),),
//                     AddVerticalSpacing(20),
//                     Text("You're about to report :(",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
//                     Text("Once you submit a report administration will take action soon.",style: TextStyle(fontSize: 13),),
//                     AddVerticalSpacing(15),
//                     Container(
//                       decoration: BoxDecoration(
//                         color: AppColor.RED.withOpacity(0.04),
//                         borderRadius: BorderRadius.circular(8.0),
//                       ),
//                       padding: EdgeInsets.symmetric(horizontal: 16,vertical: 12),
//                       child: Row(
//                         children: [
//                           Icon(Iconsax.info_circle,color: AppColor.RED,size: 20,),
//                           AddHorizontalSpacing(10),
//                           Expanded(child: Text("Don't worry! Your data will be safe.",style: TextStyle(color: AppColor.RED),)),
//                         ],
//                       ),
//                     ),
//                     AddVerticalSpacing(20),
//                     inputRequiredText(
//                         text: "Select Reason",
//                         isRequired: true
//                     ),
//                     AddVerticalSpacing(10),
//                     Obx(()=> InkWell(
//                       onTap: (){
//                         // show_filter_bottomsheet(
//                         //     title: "Select Report",
//                         //     input_title: "Search title",
//                         //     item_list: AppDummyData.report_reason,
//                         //     filter_key_name: 'name',
//                         //     show_key_name: 'name',
//                         //     response: (item){
//                         //       select_reason.value = item['name'];
//                         //     }
//                         // );
//                       },
//                       child: IgnorePointer(
//                         ignoring: true,
//                         child: input_text_field(
//                           hint_text: select_reason.isNotEmpty ? select_reason.value : "Select Reason",
//                           icon: Icon(Icons.question_mark,color: AppColor.PRIMARY_COLOR,),
//                         ),
//                       ),
//                     ),),
//                     AddVerticalSpacing(15),
//                     inputRequiredText(
//                         text: "Feedback",
//                         isRequired: true
//                     ),
//                     AddVerticalSpacing(10),
//                     input_text_field(
//                       controller: txt_message_controller,
//                       is_textarea: true,
//                       hint_text: "Share your feedback here...",
//                       icon: Icon(Iconsax.document,color: AppColor.PRIMARY_COLOR),
//                     ),
//                     AddVerticalSpacing(30),
//                     Row(
//                       children: [
//                         Expanded(
//                           child: InkWell(
//                             onTap: (){
//                               Get.back();
//                             },
//                             child: Container(
//                               decoration: BoxDecoration(
//                                   border: Border.all(color: AppColor.PRIMARY_COLOR),
//                                   borderRadius: BorderRadius.circular(8.0)
//                               ),
//                               padding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
//                               child: Center(
//                                 child: Text("Cancel",style: TextStyle(fontWeight: FontWeight.w600,color: AppColor.PRIMARY_COLOR,fontSize: 13),),
//                               ),
//                             ),
//                           ),
//                         ),
//                         AddHorizontalSpacing(15),
//                         Expanded(
//                           child: InkWell(
//                             onTap: onClickSubmit ?? (){
//                               Get.back();
//                             },
//                             child: Container(
//                               decoration: BoxDecoration(
//                                   color: AppColor.PRIMARY_COLOR,
//                                   border: Border.all(color: AppColor.PRIMARY_COLOR),
//                                   borderRadius: BorderRadius.circular(8.0)
//                               ),
//                               padding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
//                               child: Center(
//                                 child: Text("Submit",style: TextStyle(fontWeight: FontWeight.w600,color: AppColor.WHITE,fontSize: 13),),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),

//                     // Row(
//                     //   children: [
//                     //     Expanded(
//                     //       child: Container(
//                     //         decoration: BoxDecoration(
//                     //           border: Border.all(
//                     //             color: AppColor.GREY_LIGHT,
//                     //           ),
//                     //           borderRadius: BorderRadius.circular(8.0),
//                     //         ),
//                     //         child: Center(
//                     //           child: Text("Cancel"),
//                     //         ),
//                     //       ),
//                     //     )
//                     //   ],
//                     // ),
//                   ],
//                 ),)
//               ),
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }


show_image_picker_dialoug({onCameraTap,onGalleryTap,onCancelTap}) {
  showCupertinoDialog(
                  context: navigatorKey.currentContext!, 
                  builder: (context) => CupertinoAlertDialog(
                    title: Text("Select Image Source"),
                    actions: [
                      CupertinoDialogAction(
                        child: Text("Camera"),
                        onPressed: onCameraTap ?? () {
                          AppNav.back();
                        },
                      ),
                      CupertinoDialogAction(
                        child: Text("Gallery"), 
                        onPressed: onGalleryTap ?? () {
                          AppNav.back();
                        },
                      ),
                      CupertinoDialogAction(
                        child: Text("Cancel"),
                        onPressed: () => onCancelTap ?? AppNav.back(),
                      )
                    ],
                  )
                );
}