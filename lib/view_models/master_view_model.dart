import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rnn_yaatra/models/master_models/get_bank_list_response_model.dart';
import 'package:rnn_yaatra/models/master_models/get_country_list_respnse_model.dart';
import 'package:rnn_yaatra/notifiers_interfaces/master_interface.dart';
import 'package:rnn_yaatra/services/master_services.dart';
import 'package:rnn_yaatra/utils/print_logs.dart';


final getMasterViewModelGlobalNotifier = NotifierProvider<MasterViewModelNotifier,MasterInterface>(MasterViewModelNotifier.new);

class MasterViewModelNotifier extends Notifier<MasterInterface> {

  final MasterServices masterServices = MasterServices();

  @override
  MasterInterface build() {
    return MasterInterface();
  }


  Future get_country_list() async { 
    try {
      
      state = state.copyWith(
        loadingCountry: true
      );

      GetCountryListResponseModel responseModel = await masterServices.get_country_list();

      if(responseModel.data != null){
        state = state.copyWith(
          loadingCountry: false,
          countryListModel: responseModel
        );
      }else{
        state = state.copyWith(
          loadingCountry: false,
          countryListModel: GetCountryListResponseModel()
        );
      }

    } catch (e) {
      state = state.copyWith(
        loadingCountry: false,
        countryListModel: GetCountryListResponseModel()
      );
      PrintLogs().print_console_error(message: "MASTER VIEW MODEL - GET COUNTRY LIST",e: e.toString());
    }
  }

  Future get_bank_list() async { 
    try {
      state = state.copyWith(
        loadingBankList: true
      );
      GetBankListResponseModel responseModel = await masterServices.get_bank_list();
      if(responseModel.data != null){
        state = state.copyWith(
          loadingBankList: false,
          bankListModel: responseModel
        );
      }else{
        state = state.copyWith(
          loadingBankList: false,
          bankListModel: GetBankListResponseModel()
        );
      }

    } catch (e) {
      state = state.copyWith(
        loadingBankList: false,
        bankListModel: GetBankListResponseModel()
      );
      PrintLogs().print_console_error(message: "MASTER VIEW MODEL - GET BANK LIST",e: e.toString());
    }
  }

}