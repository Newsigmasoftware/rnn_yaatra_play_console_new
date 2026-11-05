// ignore_for_file: non_constant_identifier_names

import 'package:rnn_yaatra/constants/constants.dart';
import 'package:rnn_yaatra/models/account_models/get_chain_response_model.dart';
import 'package:rnn_yaatra/services/api_client.dart';
import 'package:rnn_yaatra/utils/print_logs.dart';

class WalletServices extends ApiClient {

  Future<GetChainResponseModel> get_chain() async {
    try {
      var response = await api_get(url: APIURL.GET_CHAIN);
      if (response != null) {
        return GetChainResponseModel.fromJson(response);
      }
      return GetChainResponseModel();
    } catch (e) {
      PrintLogs().print_console_error(
        message: "WALLET SERVICES - GET CHAIN",
        e: e.toString(),
      );
      return GetChainResponseModel();
    }
  }

  Future deposit_request({
    String? userId,
    String? amount,
    String? paymentMode,
    String? depositDate,
    String? deposit,
    String? remark,
    String? receipt,
  }) async {
    try {
      Map<String, dynamic> body = {
        "UserId": userId ?? "",
        "amount": amount ?? "",
        "PaymentMode": paymentMode ?? "1",
        "DepositeDate": (depositDate != null && depositDate.isNotEmpty) ? depositDate : (deposit ?? ""),
        "remark": remark ?? "",
        "RecieptImg": receipt ?? "",
      };

      var response = await api_post(
        url: APIURL.DEPOSIT_REQUEST,
        body: body,
        is_encode_body: true,
      );

      return response;
    } catch (e) {
      PrintLogs().print_console_error(
        message: "WALLET SERVICES - DEPOSIT REQUEST",
        e: e.toString(),
      );
      return null;
    }
  }

}
