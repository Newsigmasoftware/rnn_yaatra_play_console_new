// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rnn_yaatra/constants/constants.dart';
import 'package:rnn_yaatra/helpers/app_storage.dart';
import 'package:rnn_yaatra/helpers/image_picker_helper.dart';
import 'package:rnn_yaatra/models/account_models/get_chain_response_model.dart';
import 'package:rnn_yaatra/notifiers_interfaces/fund_management_interfaces/deposit_request_interface.dart';
import 'package:rnn_yaatra/services/wallet_services.dart';
import 'package:rnn_yaatra/utils/double_helper.dart';
import 'package:rnn_yaatra/utils/print_logs.dart';
import 'package:rnn_yaatra/utils/strings_helper.dart';
import 'package:rnn_yaatra/widgets/dilougs.dart';
import 'package:rnn_yaatra/widgets/snack_bar.dart';

class DepositRequestViewModel {

  final pageStateProvider = NotifierProvider<DepositRequestViewModelNotifier, DepositRequestInterface>(DepositRequestViewModelNotifier.new);
  final txt_amount = TextEditingController(); 
  final txt_deposit_date = TextEditingController(); 
  final txt_remark = TextEditingController(); 
  final WalletServices walletServices = WalletServices();

  String _getBase64Receipt(String path) {
    if (path.isEmpty) return "";
    if (path.startsWith("data:image")) return path;
    String rawBase64 = ImagePickerHelper.encode_image_base_64(image_path: path);
    if (rawBase64.isEmpty) return "";
    String ext = path.split('.').last.toLowerCase();
    String mime = (ext == 'jpg' || ext == 'jpeg') ? 'jpeg' : 'png';
    return "data:image/$mime;base64,$rawBase64";
  }

  Future getChain(WidgetRef ref) async {
    try {
      ref.read(pageStateProvider.notifier).setLoadingChains(true);
      var response = await walletServices.get_chain();
      ref.read(pageStateProvider.notifier).setLoadingChains(false);

      if (response.data != null && response.data!.isNotEmpty) {
        ref.read(pageStateProvider.notifier).setChainData(
          chainList: response.data,
          selectedChain: response.data!.first,
          paymentMode: response.data!.first.id?.toString() ?? "1",
        );
      }
    } catch (e) {
      ref.read(pageStateProvider.notifier).setLoadingChains(false);
      PrintLogs().print_console_error(
        message: "DEPOSIT REQUEST VIEW MODEL - GET CHAIN",
        e: e.toString(),
      );
    }
  }

  Future deposit_request(BuildContext context, WidgetRef ref) async {
    try {
      var pageState = ref.read(pageStateProvider);

      if (DoubleHelper.convert_string_to_double(string: txt_amount.text) <= 0) {
        AlertToast.show_message_dialog(
          context: context,
          title: "VALIDATION",
          message: "Please enter an amount greater than ${AppConstants.CURRENCY_SYMBOL}0."
        );
        return;
      }

      if (StringsHelper.is_empty_or_null(txt_deposit_date.text.trim())) {
        AlertToast.show_message_dialog(
          context: context,
          title: "VALIDATION",
          message: "Please Select Deposit Date"
        );
        return;
      }

      if (StringsHelper.is_empty_or_null(pageState.selectedReceipt ?? "")) {
        AlertToast.show_message_dialog(
          context: context,
          title: "VALIDATION",
          message: "Please Upload Receipt Image"
        );
        return;
      }

      ProgressDialog().show(context, ref);

      var userID = await AppStorage.getUserID();
      String receiptData = _getBase64Receipt(pageState.selectedReceipt ?? "");

      var response = await walletServices.deposit_request(
        userId: userID,
        amount: txt_amount.text.trim(),
        paymentMode: pageState.paymentMode,
        depositDate: txt_deposit_date.text.trim(),
        remark: txt_remark.text.trim(),
        receipt: receiptData,
      );

      if (context.mounted) {
        ProgressDialog().hide(context, ref);
      }

      if (response != null) {
        bool isSuccess = response['status'] == true ||
            response['status'] == "true" ||
            response['status'] == 1 ||
            response['status'] == "1" ||
            response['status'] == "success" ||
            (response['message'] != null &&
                response['message'].toString().toLowerCase().contains("success"));

        String msg = response['message'] ?? response['msg'] ?? "Deposit Request Submitted Successfully";

        if (isSuccess) {
          txt_amount.clear();
          txt_deposit_date.clear();
          txt_remark.clear();
          ref.read(pageStateProvider.notifier).resetState();

          if (context.mounted) {
            await AlertToast.show_message_dialog(
              context: context,
              title: "SUCCESS",
              message: msg,
              onClose: () {
                if (context.mounted) {
                  context.pop(); // Close Success Dialog
                }
                if (context.mounted) {
                  context.pop(); // Navigate Back to Previous Screen
                }
              },
            );
          }
        } else {
          if (context.mounted) {
            AlertToast.show_message_dialog(
              context: context,
              title: "Response",
              message: msg,
            );
          }
        }
      } else {
        if (context.mounted) {
          AlertToast.show_message_dialog(
            context: context,
            title: "ERROR",
            message: "Failed to submit deposit request. Please try again.",
          );
        }
      }
    } catch (e) {
      if (context.mounted) {
        ProgressDialog().hide(context, ref);
      }
      PrintLogs().print_console_error(
        message: "DEPOSIT REQUEST VIEW MODEL - DEPOSIT REQUEST",
        e: e.toString(),
      );
    }
  }
}

class DepositRequestViewModelNotifier extends Notifier<DepositRequestInterface> {

  @override
  DepositRequestInterface build() {
    return DepositRequestInterface();
  }

  setReceiptImage({String? receiptImage}) {
    state = state.copyWith(receiptImage: receiptImage);
  }

  setTabIndex({int? tabIndex}) {
    state = state.copyWith(tabIndex: tabIndex);
  }

  setPaymentMode({String? paymentMode}) {
    state = state.copyWith(paymentMode: paymentMode);
  }

  setLoadingChains(bool isLoading) {
    state = state.copyWith(isLoadingChains: isLoading);
  }

  setChainData({
    List<ChainData>? chainList,
    ChainData? selectedChain,
    String? paymentMode,
  }) {
    state = state.copyWith(
      chainList: chainList,
      selectedChain: selectedChain,
      paymentMode: paymentMode,
    );
  }

  setSelectedChain(ChainData? chain) {
    state = state.copyWith(
      selectedChain: chain,
      paymentMode: chain?.id?.toString() ?? state.paymentMode,
    );
  }

  resetState() {
    state = DepositRequestInterface();
  }

}
