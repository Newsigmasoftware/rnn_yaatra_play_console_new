import 'package:rnn_yaatra/constants/colors.dart';
import 'package:rnn_yaatra/main.dart'; 
import 'package:flutter/material.dart';  

class ProgressDialougGetX {

  static bool _isShowing = false;

  void show() {

    if(_isShowing) return;

    _isShowing = true;

    showGeneralDialog(

      context: navigatorKey.currentContext!,

      barrierDismissible: false,

      barrierLabel: "Loading",

      pageBuilder: (context, animation, secondaryAnimation) {

        return Scaffold(

          backgroundColor: Colors.black54,

          body: Center(

            child: Container(

              height: 90,
              width: 90,

              decoration: BoxDecoration(
                color: AppColor.WHITE,
                borderRadius: BorderRadius.circular(12),
              ),

              child: Center(
                child: CircularProgressIndicator(
                  color: AppColor.PRIMARY_COLOR,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void hide() {

    if(!_isShowing) return;

    if(navigatorKey.currentContext != null) {

      Navigator.of(
        navigatorKey.currentContext!,
        rootNavigator: true,
      ).pop();

      _isShowing = false;
    }
  }
}

// // ignore_for_file: deprecated_member_use, sort_child_properties_last, non_constant_identifier_names
 
// import 'package:get/get.dart';
// import 'package:flutter/material.dart'; 
// import 'package:new_com/constants/colors.dart';


// class MyProgressController extends GetxController {
//   var canPop = false.obs;

//   readValue() {
//     return canPop;
//   }

//   changeValue(val) {
//     canPop = RxBool(val);
//     // print(canPop);
//     // update();
//   }
// }



// class ProgressDialougGetX {
//   final MyProgressController pressController = Get.put(MyProgressController());

//   // showloading() {
//   //   return Center(
//   //     child: Container(
//   //       height: 100,
//   //       width: 100,
//   //       decoration: BoxDecoration(
//   //         color: AppColor.WHITE,
//   //         borderRadius: BorderRadius.circular(10),
//   //       ),
//   //       child: Center(
//   //         child: LoadingAnimationWidget.discreteCircle(color: AppColor.PRIMARY_COLOR, size: 30.0),
//   //       ),
//   //     ),
//   //   );
//   // }

//   Widget showLoadingCart({double? size}) {
//     return Center(
//       child: CircularProgressIndicator(
//         color: AppColor.PRIMARY_COLOR,
//       ),
//     );
//   }

   

//   show(
//       context, {
//         loadingText,
//       }) {
//     pressController.changeValue(true);
//     showProgressDialogue(context, loadingText);
//   }

//   hide(
//       context,
//       ) {
//     if (pressController.readValue().value) {
//       // Navigator.pop(context);
//       context.pop();
//       pressController.changeValue(false);
//     }
//   }

//   showProgressDialogue(
//     context,
//     loadingText,
//     ) {
//   // var canPressOk=true;
//   // blankScreen(context,loadingText);
//   return showDialog<void>(
//     context: context,
//     barrierDismissible: false, // user must tap button!
//     builder: (BuildContext context) {
//       return WillPopScope(
//         onWillPop: () {
//           ProgressDialougGetX().hide(context);
//           return Future.value(false);
//         },
//         child: Scaffold(
//             backgroundColor: Colors.transparent,
//             body: GestureDetector(
//               onTap: () {},
//               child: Container(
//                 color: Colors.black54,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Expanded(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Container(
//                             height: 90,
//                             width: 90,
//                             decoration: BoxDecoration(
//                               color: AppColor.WHITE,
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             child: Center(
//                               child: CircularProgressIndicator(
//                                 color: AppColor.PRIMARY_COLOR,
//                               ),
//                             ),
//                           ),
//                           // Text(
//                           //   loadingText ?? 'Default',
//                           //   style: TextStyle(
//                           //     color: Colors.white,
//                           //     fontSize: 15,
//                           //   ),
//                           // ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             )),
//       );
//     },
//   );
// }
// }

 