import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rnn_yaatra/notifiers_interfaces/auth_interfaces/change_password_interface.dart';
import 'package:rnn_yaatra/services/auth_services.dart';
import 'package:rnn_yaatra/utils/print_logs.dart';
import 'package:rnn_yaatra/utils/strings_helper.dart';
import 'package:rnn_yaatra/widgets/snack_bar.dart';

class ChangePasswordViewModel {

  final pageStateProvider = NotifierProvider<ChangePasswordViewModelNotifier,ChangePasswordInterface>(ChangePasswordViewModelNotifier.new);  

  final txt_old_password = TextEditingController();
  final txt_new_password = TextEditingController();
  final txt_confirm_password = TextEditingController();

  final AuthServices authServices = AuthServices();


  Future change_login_password() async { 
    try {
      
      if(StringsHelper.is_empty_or_null(txt_old_password.text.trim())){
        AlertToast.show_message_dialog(
          title: "VALIDATION",
          message: "Please Enter Old Password"
        );
        return;
      }

      if(StringsHelper.is_empty_or_null(txt_new_password.text.trim())){
        AlertToast.show_message_dialog(
          title: "VALIDATION",
          message: "Please Enter New Password"
        );
        return;
      }

      if(StringsHelper.is_empty_or_null(txt_confirm_password.text.trim())){
        AlertToast.show_message_dialog(
          title: "VALIDATION",
          message: "Please Enter Confirm Password"
        );
        return;
      }

      if(txt_new_password.text.trim() != txt_confirm_password.text.trim()){
        AlertToast.show_message_dialog(
          title: "VALIDATION",
          message: "New Password and Confirm Password do not match.",
        );
        return;
      }

      await authServices.changePassword(
        oldPassword: txt_old_password.text,
        newPassword: txt_new_password.text,
        confirmPassword: txt_confirm_password.text
      );

    } catch (e) {
      PrintLogs().print_console_error(message: "CHANGE PASSWORD VIEW MODEL - CHANGE LOGIN PASSWORD",e: e.toString());
    }
  }


}

class ChangePasswordViewModelNotifier extends Notifier<ChangePasswordInterface> {



  @override
  ChangePasswordInterface build() {
    return ChangePasswordInterface();
  }

  setOldPasswordVisible({bool? invisible}) {
    state = state.copyWith(
      invOldPass: invisible
    );
  }

  setNewPasswordVisible({bool? invisible}) {
    state = state.copyWith(
      invNewPass: invisible
    );
  }

  setConfirmPasswordVisible({bool? invisible}) {
    state = state.copyWith(
      invConfirmPass: invisible
    );
  }


}