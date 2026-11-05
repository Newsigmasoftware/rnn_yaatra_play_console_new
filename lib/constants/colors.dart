// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:flutter/material.dart';

class AppColor{

  static const Color YELLOW_BG = Colors.pink;
  static const Color PRIMARY_COLOR = Color(0xff043d97);
  static const Color DISABLE_COLOR = Color(0xff3e5576);
  // static const Color PRIMARY_COLOR = Color(0xfff9c802);
  static const Color PRIMARY_COLOR_DARK = Color(0xff102b16);
  // Color.fromRGBO(76, 175, 80, 1)
  static const Color SECONDARY_COLOR = Color(0xffefa921);
  static const Color SECONDARY_COLOR_LIGHT = Color(0xff5c2fa1);

  static const Color GRADIANT_Light_1 = Color(0xff547dba);
  static const Color GRADIANT_DARK_2 = Color(0xff3266a5);
  static const Color CONTIANER_COLOR = Color(0xfff9f6eb);
  // static const Color SECONDARY_COLOR = Color(0xff6362f8);

  // static const Color PRIMARY_COLOR = Color(0xff6362f8);

  // static const Color PRIMARY_COLOR = Color(0xff2b461b);
  // static const Color YELLOW_BG = Color(0xffed7300);
  static const Color SCCAFOLD_BG = Color(0xfff7f6fb);
  static const Color RED = Colors.red;
  static const Color RED_DARK = Color(0xffdd3e42);
  static Color PINK = Colors.pink;
  static const Color GREEN = Colors.green;
  static const Color GREEN_MEDIUM = Color(0xff208376);
  static const Color BLACK = Colors.black;
  static const Color WHITE = Colors.white;
  static const Color BLACK_87 = Colors.black87;
  static const Color SCAFFOLD_BG_COLOR = Color(0xfffbf9f8);
  // static const Color SCAFFOLD_BG_COLOR = Color(0xfff9f9fe);
  // static const Color SCAFFOLD_BG_COLOR = Color(0xfff5f8fb);
  static const Color CARD_COLOR = Color(0xfff9f0e5);
  static const Color CARD_BORDER_COLOR = Color.fromARGB(255, 234, 237, 247);
  // static const Color SCAFFOLD_BG_COLOR = Colors.white;
  static Color TEXT_GREY = Color(0xff414752);
  // static Color TEXT_GREY = Colors.grey.shade700;
  static Color TEXT_DARK = Color(0xff222831);
  static Color TEXT_GREY_700 = Colors.blueGrey.shade700;
  static Color TEXT_GREY_100 = Colors.blueGrey.shade50;
  static Color GREY_EXTRA_LIGHT = Colors.grey.shade100;
  static Color GREY_LIGHT = Colors.grey.shade300;
  static Color GREY_MEDIUM = Colors.grey.shade500;
  static const Color ORANGE_PENDING = Colors.orange;
  // static const Color PRIMARY_COLOR = Color(0xffd7480e);
  
  // static const Color PRIMARY_COLOR = Color(0xff402964);
  // static const Color PRIMARY_COLOR = Color(0xff14a494);
  static const Color YELLOW_LIGHT = Color(0xffffedd9);
  // static const Color PRIMARY_COLOR_DARK = Color(0xff005954);
  static const Color PRIMARY_COLOR_LIGHT = Color(0xff4b6cb7);
  // static const Color PRIMARY_COLOR = Color(0xff016c1a);
  // static const Color PRIMARY_COLOR_LIGHT = Color(0xff009722);
  static const Color PRIMARY_COLOR_SUPPORTIVE = Colors.orange;
  // static const Color SECONDARY_COLOR = Color(0xff1D406E);

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  static Color status_color({String? status}) {
    if(status.toString().toLowerCase() == "placed" || status.toString().toLowerCase() == "Ongoing".toLowerCase() || status.toString().toLowerCase() == "Under Internal Review".toLowerCase() || status.toString().trim().toLowerCase() == "assigned" || status.toString().trim() == "NOMINATED" || status.toString().trim() == "Pending" || status.toString().trim().toLowerCase().contains("not")){
      return ORANGE_PENDING;
    }
    if(status.toString().trim().toLowerCase()== "lost" || status.toString().trim().toLowerCase()== "cancelled" || status.toString().trim().toLowerCase()== "unplanned" || status.toString().trim().toLowerCase() == "buy now".toLowerCase() || status.toString().trim().toLowerCase()== "UNFIT".toLowerCase() || status.toString().trim() == "Rejected" || status.toString().trim().toLowerCase() == "closed"){
      return RED;
    }
    if(status.toString().trim().toLowerCase()== "paid" || status.toString().trim().toLowerCase()== "converted" || status.toString().trim().toLowerCase()== "completed" || status.toString().trim().toLowerCase()== "delivered" || status.toString().trim().toLowerCase()== "planned" || status.toString().trim().toLowerCase()== "active".toLowerCase() || status.toString().trim().toLowerCase()== "balanced".toLowerCase() || status.toString().toLowerCase() == "PARTIAL".toLowerCase()  || status.toString().toLowerCase() == "fit".toLowerCase()  || status.toString().toLowerCase() == "Client Approved".toLowerCase() || status.toString().trim().toLowerCase() == "Resolved".toLowerCase() || status.toString().trim().toLowerCase() == "Approved".toLowerCase() || status.toString().toLowerCase().trim().contains("bookked") || status.toString().toLowerCase().trim().contains("booked")){
      return GREEN;
    }
    if(status.toString().trim().toLowerCase()== "new lead"){
      return Colors.blue;
    }
    return ORANGE_PENDING;
  }

  List<Color> colorList = [
    Colors.deepPurpleAccent,
    GREEN,
    ORANGE_PENDING,
    RED
  ];

  Color getColorByIndex(int index) {
    if (colorList.isEmpty) return Colors.grey;
    return colorList[index % colorList.length];
  }

}






// class AppColor{

//   static const Color YELLOW_BG = Color(0xffffacc45);
//   static const Color SCCAFOLD_BG = Color(0xfff2ede7);
//   static const Color RED = Colors.red;
//   static Color PINK = Colors.pink;
//   static const Color GREEN = Colors.green;
//   static const Color GREEN_MEDIUM = Color(0xff208376);
//   static const Color BLACK = Colors.black;
//   static const Color WHITE = Colors.white;
//   static const Color BLACK_87 = Colors.black87;
//   static const Color SCAFFOLD_BG_COLOR = Colors.white;
//   static Color TEXT_GREY = Color(0xff414752);
//   // static Color TEXT_GREY = Colors.grey.shade700;
//   static Color TEXT_DARK = Color(0xff222831);
//   static Color TEXT_GREY_700 = Colors.blueGrey.shade700;
//   static Color TEXT_GREY_100 = Colors.blueGrey.shade50;
//   static Color GREY_EXTRA_LIGHT = Colors.grey.shade100;
//   static Color GREY_LIGHT = Colors.grey.shade300;
//   static Color GREY_MEDIUM = Colors.grey.shade500;
//   static const Color ORANGE_PENDING = Colors.orange;
//   // static const Color PRIMARY_COLOR = Color(0xffd7480e);
//   static const Color PRIMARY_COLOR = Color(0xff2b461b);
//   static const Color SECONDARY_COLOR = Color(0xff69b4fc);
//   // static const Color PRIMARY_COLOR = Color(0xff402964);
//   // static const Color PRIMARY_COLOR = Color(0xff14a494);
//   static const Color YELLOW_LIGHT = Color(0xffffedd9);
//   static const Color PRIMARY_COLOR_DARK = Color(0xff005954);
//   static const Color PRIMARY_COLOR_LIGHT = Color(0xff4b6cb7);
//   // static const Color PRIMARY_COLOR = Color(0xff016c1a);
//   // static const Color PRIMARY_COLOR_LIGHT = Color(0xff009722);
//   static const Color PRIMARY_COLOR_SUPPORTIVE = Colors.orange;
//   // static const Color SECONDARY_COLOR = Color(0xff1D406E);

//   static Color fromHex(String hexString) {
//     final buffer = StringBuffer();
//     if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
//     buffer.write(hexString.replaceFirst('#', ''));
//     return Color(int.parse(buffer.toString(), radix: 16));
//   }

//   static Color status_color({String? status}) {
//     if(status.toString().trim() == "Pending" || status.toString().trim().toLowerCase().contains("not")){
//       return ORANGE_PENDING;
//     }
//     if(status.toString().trim() == "Rejected"){
//       return RED;
//     }
//     if(status.toString().trim() == "Approved" || status.toString().toLowerCase().trim().contains("bookked") || status.toString().toLowerCase().trim().contains("booked")){
//       return GREEN;
//     }
//     return PRIMARY_COLOR;
//   }

// }