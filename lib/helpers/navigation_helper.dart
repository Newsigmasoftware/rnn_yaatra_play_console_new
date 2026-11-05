import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rnn_yaatra/models/argument_models/prop_request_argument_model.dart';
import 'package:rnn_yaatra/utils/print_logs.dart';

class AppNav {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static BuildContext get context => navigatorKey.currentContext!;

  /// Get.to(Page()) Replacer
  static Future<T?> to<T>(Widget page,{BuildContext? buildContext}) {
    return Navigator.push(
      buildContext ?? context,
      MaterialPageRoute(builder: (_) => page),
    );
  }

  /// Get.off(Page()) Replacer
  static Future<T?> off<T>(Widget page) {
    return Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => page),
    );
  }

  /// Get.offAll(Page()) Replacer
  static Future<T?> offAll<T>(Widget page,{BuildContext? buildContext}) {
    return Navigator.pushAndRemoveUntil(
      buildContext ?? context,
      MaterialPageRoute(builder: (_) => page),
      (route) => false,
    );
  }

  /// Get.back() Replacer
  static void back([dynamic result]) {
    try {
      if (navigatorKey.currentState != null && navigatorKey.currentState!.canPop()) {
        navigatorKey.currentState!.pop(result);
        return;
      }
      if (navigatorKey.currentContext != null && navigatorKey.currentContext!.canPop()) {
        navigatorKey.currentContext!.pop(result);
        return;
      }
    } catch (_) {}
  }


  static push({required BuildContext context,String? path,Object? extra}) {
    if(extra is PropRequestArgumentModel){
      PrintLogs().print_console_warning(message: "GO TO PAGE With Extra ${extra.toJson()}",e: path);  
    }else{
      PrintLogs().print_console_warning(message: "GO TO PAGE With Extra ${extra ?? ""}",e: path);
    }
    context.push(path ?? "",extra: extra);
  }

  static go({required BuildContext context,String? path,Object? extra}) {
    if(extra is PropRequestArgumentModel){
      PrintLogs().print_console_warning(message: "GO TO PAGE With Extra ${extra.toJson()}",e: path);  
    }else{
      PrintLogs().print_console_warning(message: "GO TO PAGE With Extra ${extra ?? ""}",e: path);
    }
    context.go(path ?? "",extra: extra);
  }

  static get_prop({required BuildContext context}) {
    if(GoRouterState.of(context).extra != null){
      var args = GoRouterState.of(context).extra as Map<String,dynamic>;
      return args;
    }else{
      return <String,dynamic>{};
    }
  }
  
  static PropRequestArgumentModel get_prop_request({required BuildContext context}) {
    if(GoRouterState.of(context).extra != null){
      var args = GoRouterState.of(context).extra as PropRequestArgumentModel;
      return args;
    }else{
      return PropRequestArgumentModel();
    }
  }

}
