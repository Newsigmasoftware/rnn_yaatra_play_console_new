// ignore_for_file: deprecated_member_use, non_constant_identifier_names 
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rnn_yaatra/main.dart';
import 'package:rnn_yaatra/widgets/dilougs.dart';
import 'package:toastification/toastification.dart';

class AlertToast {
  // static error_snackbar({title,message}){
  //   Get.snackbar( title ?? "Error", message ?? "",colorText: AppColor.WHITE,backgroundColor: AppColor.RED,snackPosition: SnackPosition.BOTTOM,margin: EdgeInsets.only(bottom: 30,left: 16,right: 16));
  // }

  // static error_snackbar({title, message}) {
  //   // show_alert_dialog(
  //   //   content: message ?? "",
  //   //   title: title ?? "Alert!!",
  //   //   is_hide_cancel_button: true,
  //   //   padding: EdgeInsets.symmetric(horizontal: 55),
  //   //   button_text: "ok".tr
  //   // );
  //   Get.snackbar(title ?? "Error", message ?? "",
  //       colorText: AppColor.WHITE,
  //       backgroundColor: AppColor.RED,
  //       snackPosition: SnackPosition.BOTTOM,
  //       margin: EdgeInsets.only(bottom: 30, left: 16, right: 16));
  // }

  // static success_snackbar({title, message}) {
  //   Get.snackbar(title ?? "Error", message ?? "",
  //       colorText: AppColor.WHITE,
  //       backgroundColor: AppColor.GREEN,
  //       snackPosition: SnackPosition.BOTTOM,
  //       margin: EdgeInsets.only(bottom: 30, left: 16, right: 16));
  // }

  // showCustomSnackBar(String message, {bool isError = true}) {
  //   Get.showSnackbar(GetBar(
  //     backgroundColor: isError ? Colors.red : Colors.green,
  //     message: message,
  //     maxWidth: Get.width,
  //     duration: const Duration(seconds: 3),
  //     snackStyle: SnackStyle.FLOATING,
  //     margin: const EdgeInsets.all(10.0),
  //     borderRadius: 5.0,
  //     isDismissible: true,
  //     dismissDirection: DismissDirection.horizontal,
  //   ));
  // }

  // showCustomSnackBarError(String message) {
  //   Get.showSnackbar(GetBar(
  //     backgroundColor: Colors.red,
  //     message: message,
  //     maxWidth: Get.width,
  //     duration: const Duration(seconds: 3),
  //     snackStyle: SnackStyle.FLOATING,
  //     margin: const EdgeInsets.all(10.0),
  //     borderRadius: 5.0,
  //     isDismissible: true,
  //     dismissDirection: DismissDirection.horizontal,
  //   ));
  // }

  // showCustomSnackBarSuccess(
  //   String message,
  // ) {
  //   Get.showSnackbar(GetBar(
  //     backgroundColor: Colors.green,
  //     message: message,
  //     maxWidth: Get.width,
  //     duration: const Duration(seconds: 3),
  //     snackStyle: SnackStyle.FLOATING,
  //     margin: const EdgeInsets.all(10.0),
  //     borderRadius: 5.0,
  //     isDismissible: true,
  //     dismissDirection: DismissDirection.horizontal,
  //   ));
  // }

  static show_success_toast({String? title,String? message}) {
    Toastification().show(
      type: ToastificationType.success,
      style: ToastificationStyle.flat,
      alignment: Alignment.topRight,
      direction: TextDirection.ltr,
      context: navigatorKey.currentContext, // optional if you use ToastificationWrapper
      title: Text(
        title ?? 'SUCCESS',
        style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
      ),
      description: Text(
        message ?? "",
        style: GoogleFonts.poppins(fontSize: 15),
      ),
      autoCloseDuration: const Duration(seconds: 5),
    );
  }

  static show_warning_toast({String? title,String? message}) {
    Toastification().show(
      type: ToastificationType.warning,
      style: ToastificationStyle.flat,
      alignment: Alignment.topRight,
      direction: TextDirection.ltr,
      context: navigatorKey.currentContext, // optional if you use ToastificationWrapper
      title: Text(
        title ?? 'ALERT',
        style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
      ),
      description: Text(
        message ?? "",
        style: GoogleFonts.poppins(fontSize: 15),
      ),
      autoCloseDuration: const Duration(seconds: 5),
    );
  }


  static show_error_toast({String? title,String? message}) {
    Toastification().show(
      type: ToastificationType.error,
      style: ToastificationStyle.flat,
      alignment: Alignment.topRight,
      direction: TextDirection.ltr,
      context: navigatorKey.currentContext, // optional if you use ToastificationWrapper
      title: Text(
        title ?? 'ERROR',
        style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
      ),
      description: Text(
        message ?? "",
        style: GoogleFonts.poppins(fontSize: 15),
      ),
      autoCloseDuration: const Duration(seconds: 5),
    );
  }


  static show_message_dialog({BuildContext? context,String? title,String? message,VoidCallback? onClose}) {
    return showSearchJobConfirmationDialog(
      context: context ?? navigatorKey.currentContext!,
      title: title ?? "",
      content: message ?? "",
      isHideCancelButton: true,
      buttonText: "Close",
      onConfirm: onClose
    );
  }
}


// show_alert_dialog({title,content,onConfirm,onCancel,is_hide_cancel_button,padding,cancel_button_text,button_text}) { 
//     Get.dialog(
//       Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Material(
//           color: Colors.transparent,
//           child: Padding(
//             padding: padding ?? EdgeInsets.symmetric(horizontal: 50),
//             child: Container(
//               decoration: BoxDecoration(
//                 color: AppColor.WHITE,
//                 borderRadius: BorderRadius.circular(20.0),
//               ),
//               width: Get.width,
//               padding: EdgeInsets.symmetric(vertical: 15),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Lottie.asset(AppLottie.ALERT,height: 100),
//                   // CircleAvatar(
//                   //   backgroundColor: AppColor.ORANGE_PENDING.withOpacity(0.1),
//                   //   radius: 35,
//                   //   child: Center(
//                   //     child: Icon(Iconsax.info_circle,color: AppColor.ORANGE_PENDING,size: 35,),
//                   //   ),
//                   // ),
//                   // AddVerticalSpacing(10),
//                   Text(title ?? 'confirmation'.tr,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),textAlign: TextAlign.center,),
//                   AddVerticalSpacing(5),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 16),
//                     child: Text(content ?? "Are you sure ? you want to proceed",style: TextStyle(fontSize: 15),textAlign: TextAlign.center,),
//                   ),
//                   AddVerticalSpacing(25),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: is_hide_cancel_button == true ? Get.width*0.2 : 16),
//                     child: Row(
//                       children: [
//                        is_hide_cancel_button == true ? SizedBox() : Expanded(
//                             child: InkWell(
//                               onTap: onCancel ?? (){
//                               Get.back();
//                               },
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                   color: AppColor.GREY_EXTRA_LIGHT,
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                                 height: 45,
//                                 child: Center(
//                                   child: Text(cancel_button_text ?? "Cancel".tr,style: TextStyle(fontWeight: FontWeight.w600,color: AppColor.TEXT_GREY),),
//                                 ),
//                               ),
//                             )
//                         ),
//                         is_hide_cancel_button == true ? SizedBox() : AddHorizontalSpacing(15),
//                         Expanded(
//                             child: InkWell(
//                               onTap: onConfirm ?? (){
//                                 Get.back();
//                               },
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                   color: AppColor.PRIMARY_COLOR,
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                                 height: 45,
//                                 child: Center(
//                                   child: Text(button_text ?? "Proceed".tr,style: TextStyle(fontWeight: FontWeight.w600,color: AppColor.WHITE),),
//                                 ),
//                               ),
//                             )
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ],
//           ),
//     );
//   }