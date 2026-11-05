// ignore_for_file: non_constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:talker/talker.dart';

class PrintLogs{
  final talker = Talker();
  print_console({message,e}){
    if(kDebugMode){
      talker.error("====> $message ${ e.toString().isNotEmpty && e.toString() != "null"  ? "=====> ${e.toString()}" : ""}");
      // printInfo(
      //     info: "====> ${message} ${ e.toString().isNotEmpty && e.toString() != "null"  ? "=====> ${e.toString()}" : ""}"
      // );
    }
  }

  print_console_warning({message,e}){
    if(kDebugMode){
      talker.warning("====> $message ${ e.toString().isNotEmpty && e.toString() != "null"  ? "=====> ${e.toString()}" : ""}");
    }
  }

  print_console_white({message,e}){
    if(kDebugMode){
      talker.log("====> $message ${ e.toString().isNotEmpty && e.toString() != "null"  ? "=====> ${e.toString()}" : ""}");
      
    }
  }

  print_console_error({message,e}){
    if(kDebugMode){
      talker.error("====> $message ${ e.toString().isNotEmpty && e.toString() != "null"  ? "=====> ${e.toString()}" : ""}");
    }
  }

  print_console_success({message,e}){
    if(kDebugMode){
      talker.log("====> $message ${ e.toString().isNotEmpty && e.toString() != "null"  ? "=====> ${e.toString()}" : ""}",logLevel: LogLevel.info,);
      // printInfo(
      //     info: "====> ${message} ${ e.toString().isNotEmpty && e.toString() != "null"  ? "=====> ${e.toString()}" : ""}"
      // );
    }
  }

}