import 'package:flutter/material.dart';

// class ScreenHelper {
//   static late double width;
//   static late double height;

//   // static void init() {
//   //   // final size = MediaQuery.of(context).size;
//   //   // width = size.width;
//   //   // height = size.height;
//   // }

//   static void init() {
//     final view = WidgetsBinding.instance.platformDispatcher.views.first;
//     final size = view.physicalSize / view.devicePixelRatio;
    
//     width = size.width;
//     height = size.height;
//   }
// }

class ScreenHelper {
  // static late double width;
  // static late double height;

  // static void init(BuildContext context) {
  //   print("ScreenHelper INIT CALLED");
  //   final size = MediaQuery.of(context).size;
  //   width = size.width;
  //   height = size.height;
  // }

  double get_width(context) {
    final size = MediaQuery.of(context).size;
    return size.width;
  }

  double get_height(context) {
    final size = MediaQuery.of(context).size;
    return size.height;
  }

}