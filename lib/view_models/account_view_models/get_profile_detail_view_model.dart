import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rnn_yaatra/helpers/app_storage.dart';
import 'package:rnn_yaatra/models/account_models/get_kyc_detail_response_model.dart';
import 'package:rnn_yaatra/models/account_models/get_profile_detail_response_model.dart';
import 'package:rnn_yaatra/notifiers_interfaces/account_interfaces/profile_interface.dart';
import 'package:rnn_yaatra/services/account_services.dart';
import 'package:rnn_yaatra/utils/print_logs.dart';

final getProfileViewModelNotifier = NotifierProvider<GetProfileDetailViewModelNotifier,ProfileInterface>(GetProfileDetailViewModelNotifier.new);


class GetProfileDetailViewModelNotifier extends Notifier<ProfileInterface> {

  final AccountServices accountServices = AccountServices();

  @override
  ProfileInterface build() {
    return ProfileInterface();
  }

  Future get_profile_detail({Function(GetProfileDetailResponseModel profileDetailRes)? callbackFn}) async { 
    try {
      
      state = state.copyWith(
        loadingProfile: true
      );
      var userId = await AppStorage.getUserID();

      GetProfileDetailResponseModel responseModel = await accountServices.get_profile_detail(
        userID: userId
      );

      if(responseModel.data != null){
        state = state.copyWith(
          loadingProfile: false,
          profileModel: responseModel
        );
        
        if(callbackFn != null){
          callbackFn(responseModel);
        }
      }else{
        state = state.copyWith(
          loadingProfile: false,
          profileModel: GetProfileDetailResponseModel()
        );
      }
      
    } catch (e) {
      state = state.copyWith(
        loadingProfile: false,
        profileModel: GetProfileDetailResponseModel()
      );
      PrintLogs().print_console_error(message: "GET PROFILE DETAIL VIEW MODEL - GET PROFILE DETAIL",e: e.toString());
    }
  }


  Future get_kyc_detail({Function(GetKycDetailResponseModel kycDetailRes)? callbackfn}) async { 
    try {
      
      state = state.copyWith(
        loadingKycDetail: true
      );

      var userId = await AppStorage.getUserID();
      GetKycDetailResponseModel responseModel = await accountServices.get_kyc_detail(
        userID: userId
      );

      if(responseModel.data != null){
        state = state.copyWith(
          loadingKycDetail: false,
          kycDetailModel: responseModel
        );
        if(callbackfn != null){
          callbackfn(responseModel);
        }
      }else{
        state = state.copyWith(
          loadingKycDetail: false,
          kycDetailModel: GetKycDetailResponseModel()
        );
      }

    } catch (e) {
      state = state.copyWith(
        loadingKycDetail: false,
        kycDetailModel: GetKycDetailResponseModel()
      );
      PrintLogs().print_console_error(message: "GET PROFILE DETAIL VIEW MODEL - GET KYC DETAIL",e: e.toString());
    }
  }

}