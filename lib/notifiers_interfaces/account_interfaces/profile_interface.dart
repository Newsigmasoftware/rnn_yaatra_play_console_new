import 'package:rnn_yaatra/models/account_models/get_kyc_detail_response_model.dart';
import 'package:rnn_yaatra/models/account_models/get_profile_detail_response_model.dart';

class ProfileInterface {

  final bool isLoadingProfile;
  final GetProfileDetailResponseModel? getProfileDetailResponseModel;

  final bool isLoadingKycDetail;
  final GetKycDetailResponseModel? kycDetailResponseModel;
  ProfileInterface({
    this.isLoadingProfile = false,this.getProfileDetailResponseModel,
    this.isLoadingKycDetail = false,this.kycDetailResponseModel
  });

  ProfileInterface copyWith({
    bool? loadingProfile,
    GetProfileDetailResponseModel? profileModel,

    bool? loadingKycDetail,
    GetKycDetailResponseModel? kycDetailModel
  }) {
    return ProfileInterface(
      isLoadingProfile: loadingProfile ?? isLoadingProfile,
      getProfileDetailResponseModel: profileModel ?? getProfileDetailResponseModel,
      isLoadingKycDetail: loadingKycDetail ?? isLoadingKycDetail,
      kycDetailResponseModel: kycDetailModel ?? kycDetailResponseModel
    );
  }
}