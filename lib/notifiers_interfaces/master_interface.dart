import 'package:rnn_yaatra/models/master_models/get_bank_list_response_model.dart';
import 'package:rnn_yaatra/models/master_models/get_country_list_respnse_model.dart';

class MasterInterface {

  final bool isLoadingCountry;
  final GetCountryListResponseModel? countryListResponseModel;

  final bool isLoadingBankList;
  final GetBankListResponseModel? bankListResponseModel;
  MasterInterface({
    this.isLoadingCountry = false,this.countryListResponseModel,
    this.isLoadingBankList = false,this.bankListResponseModel
  });

  MasterInterface copyWith({
    bool? loadingCountry,
    GetCountryListResponseModel? countryListModel,
    
    bool? loadingBankList,
    GetBankListResponseModel? bankListModel
  }) {
    return MasterInterface(
      isLoadingCountry: loadingCountry ?? isLoadingCountry,
      countryListResponseModel: countryListModel ?? countryListResponseModel,
      
      isLoadingBankList: loadingBankList ?? isLoadingBankList,
      bankListResponseModel: bankListModel ?? bankListResponseModel 
    );
  }
}