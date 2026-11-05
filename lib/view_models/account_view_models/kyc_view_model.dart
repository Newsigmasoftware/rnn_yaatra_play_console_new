// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rnn_yaatra/helpers/app_storage.dart';
import 'package:rnn_yaatra/helpers/image_picker_helper.dart';
import 'package:rnn_yaatra/helpers/navigation_helper.dart';
import 'package:rnn_yaatra/notifiers_interfaces/account_interfaces/kyc_interface.dart';
import 'package:rnn_yaatra/services/account_services.dart';
import 'package:rnn_yaatra/utils/print_logs.dart';
import 'package:rnn_yaatra/utils/strings_helper.dart';
import 'package:rnn_yaatra/widgets/snack_bar.dart';

class KycViewModel {

  final txt_pan_no = TextEditingController();
  final txt_bank_name = TextEditingController();
  final txt_bank_value = TextEditingController();
  final txt_account_no = TextEditingController();
  final txt_ifsc_code = TextEditingController();

  final AccountServices accountServices = AccountServices();
  final pageStateProvider = NotifierProvider<KycViewModelNotifier,KycInterface>(KycViewModelNotifier.new);

  Future updateKyc(WidgetRef ref, {BuildContext? context}) async { 
    try {
      
      if(StringsHelper.is_empty_or_null(txt_pan_no.text.trim())){
        AlertToast.show_message_dialog(
          title: "VALIDATION",
          message: "Please Enter Pan No."
        );
        return;
      }

      var pageState = ref.read(pageStateProvider);

      if(StringsHelper.is_empty_or_null(pageState.selectedPanImage ?? "")){
        AlertToast.show_message_dialog(
          title: "VALIDATION",
          message: "Please Upload Pan Image"
        );
        return;
      }

      if(StringsHelper.is_empty_or_null(txt_bank_name.text.trim())){
        AlertToast.show_message_dialog(
          title: "VALIDATION",
          message: "Please Enter Bank Name"
        );
        return;
      }

      if(StringsHelper.is_empty_or_null(txt_account_no.text.trim())){
        AlertToast.show_message_dialog(
          title: "VALIDATION",
          message: "Please Enter Account No."
        );
        return;
      }

      if(StringsHelper.is_empty_or_null(txt_ifsc_code.text.trim())){
        AlertToast.show_message_dialog(
          title: "VALIDATION",
          message: "Please Enter Ifsc Code."
        );
        return;
      }

      if(StringsHelper.is_empty_or_null(pageState.passbookImage ?? "")){
        AlertToast.show_message_dialog(
          title: "VALIDATION",
          message: "Please Upload Cheque/Passbook Image"
        );
        return;
      }

      // Start loader on button
      ref.read(pageStateProvider.notifier).setLoading(true);

      var userId = await AppStorage.getUserID();

      var response = await accountServices.update_kyc(
        panNo: txt_pan_no.text.trim(),
        accountNo: txt_account_no.text.trim(),
        bankId: txt_bank_value.text.trim(),
        ifscCode: txt_ifsc_code.text.trim(),
        panImage: ImagePickerHelper.encode_image_base_64(image_path: pageState.selectedPanImage ?? ""),
        passbookImage: ImagePickerHelper.encode_image_base_64(image_path: pageState.passbookImage ?? ""),
        userId: userId
      );

      // Stop loader
      ref.read(pageStateProvider.notifier).setLoading(false);

      if (response != null) {
        String msg = "KYC Details Updated Successfully!";
        if (response is Map<String, dynamic>) {
          if (response['message'] != null && response['message'].toString().trim().isNotEmpty) {
            msg = response['message'].toString();
          } else if (response['Message'] != null && response['Message'].toString().trim().isNotEmpty) {
            msg = response['Message'].toString();
          }
        }

        AlertToast.show_message_dialog(
          title: "SUCCESS",
          message: msg,
          onClose: () {
            AppNav.back(); // Close Dialog
            if (context != null && context.mounted && context.canPop()) {
              context.pop(); // Auto Navigate Back
            }
          },
        );
      } else {
        AlertToast.show_message_dialog(
          title: "FAILED",
          message: "Failed to update KYC details. Please try again.",
        );
      }

    } catch (e) {
      ref.read(pageStateProvider.notifier).setLoading(false);
      PrintLogs().print_console_error(message: "KYC VIEW MODEL - UPDATE KYC",e: e.toString());
      AlertToast.show_message_dialog(
        title: "ERROR",
        message: "Something went wrong. Please try again.",
      );
    }
  }
}


class KycViewModelNotifier extends Notifier<KycInterface>{

  @override
  KycInterface build() {
    return KycInterface();
  }

  setPanImage({String? image}) {
    state = state.copyWith(
      panImage: image
    );
  }

  setPassbookImage({String? passbookImage}) {
    state = state.copyWith(
      passbkImage: passbookImage
    );
  }

  setLoading(bool loading) {
    state = state.copyWith(
      isLoading: loading
    );
  }

}
