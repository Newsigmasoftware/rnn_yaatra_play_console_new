// ignore_for_file: non_constant_identifier_names

import 'package:rnn_yaatra/constants/constants.dart';
import 'package:rnn_yaatra/models/master_models/get_bank_list_response_model.dart';
import 'package:rnn_yaatra/models/master_models/get_country_list_respnse_model.dart';
import 'package:rnn_yaatra/services/api_client.dart';
import 'package:rnn_yaatra/utils/print_logs.dart';

class MasterServices extends ApiClient{

  Future get_country_list() async { 
    try {
      
      var response = await api_get(url: APIURL.GET_COUNTRY);
      GetCountryListResponseModel responseModel = GetCountryListResponseModel.fromJson(response);
      return responseModel;

    } catch (e) {
      PrintLogs().print_console_error(message: "MASTER SERVICES - GET COUNTRY LIST",e: e.toString());
    }
  }

  Future get_bank_list() async {
    try {
      
      var responesModel = await api_get(url: APIURL.GET_BANK);
      GetBankListResponseModel responseModel = GetBankListResponseModel.fromJson(responesModel);
      return responseModel;

    } catch (e) {
      PrintLogs().print_console_error(message: "MASTER SERVICES - GET BNK LIST",e: e.toString());
    }
  }

}