import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rnn_yaatra/helpers/app_storage.dart';
import 'package:rnn_yaatra/helpers/navigation_helper.dart';
import 'package:rnn_yaatra/main.dart';
import 'package:rnn_yaatra/models/auth_models/login_response_model.dart';
import 'package:rnn_yaatra/notifiers_interfaces/auth_interfaces/login_interface.dart';
import 'package:rnn_yaatra/routing/app_router.dart';
import 'package:rnn_yaatra/services/auth_services.dart';
import 'package:rnn_yaatra/utils/print_logs.dart';
import 'package:rnn_yaatra/utils/strings_helper.dart';
import 'package:rnn_yaatra/widgets/dialoug_getx.dart';
import 'package:rnn_yaatra/widgets/snack_bar.dart';

class LoginViewModel {

  final pageStateProvider = NotifierProvider<LoginViewModelNotifier,LoginInterface>(LoginViewModelNotifier.new); 

  final txt_userID = TextEditingController();
  final txt_password = TextEditingController();
  final AuthServices authServices = AuthServices();

  Future login() async { 
    try {
      
      if(StringsHelper.is_empty_or_null(txt_userID.text.trim())){
        AlertToast.show_message_dialog(
          title: "VALIDATION",
          message: "Please Enter User ID!"
        );
        return;
      }

      if(StringsHelper.is_empty_or_null(txt_password.text.trim())){
        AlertToast.show_message_dialog(
          title: "VALIDATION",
          message: "Please Enter Password!"
        );
        return;
      }

      ProgressDialougGetX().show();
      LoginResponseModel responseModel = await authServices.login(
        userId: txt_userID.text,
        password: txt_password.text
      );

      if(responseModel.res.toString() == "1"){
        ProgressDialougGetX().hide();

        if(!StringsHelper.is_empty_or_null("${responseModel.data?.userid}")){
          AppStorage.saveUserID(responseModel.data?.userid ?? "");
          AppStorage.saveUserRoleID(responseModel.data?.role ?? "");

          AppNav.go(context: navigatorKey.currentContext!,path: AppRouteString.Dashboard);
          
        }else{
          AlertToast.show_message_dialog(
            title: "Oops",
            message: responseModel.message ?? "Invalid Credentials"
          );  
        }

      }else if(responseModel.res.toString() == "0"){
        ProgressDialougGetX().hide();
        AlertToast.show_message_dialog(
          title: "Oops",
          message: responseModel.message ?? "Invalid Credentials"
        );
      }else{
        ProgressDialougGetX().hide();
      }

    } catch (e) {
      ProgressDialougGetX().hide();
      PrintLogs().print_console_error(message: "LOGIN VIEW MODEL - LOGIN",e: e.toString());
    }
  }

}

class LoginViewModelNotifier extends Notifier<LoginInterface> {

  @override
  LoginInterface build() {
    return LoginInterface();
  }

  setPassword({bool? invisiblePassword}) {
    state = state.copyWith(
      invPassword: invisiblePassword
    );
  }

}