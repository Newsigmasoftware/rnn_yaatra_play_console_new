// ignore_for_file: non_constant_identifier_names

import 'dart:io';
import 'package:rnn_yaatra/constants/constants.dart';
import 'package:rnn_yaatra/helpers/image_picker_helper.dart';
import 'package:rnn_yaatra/models/account_models/change_password_response_model.dart';
import 'package:rnn_yaatra/models/account_models/compose_message_response_model.dart';
import 'package:rnn_yaatra/models/account_models/get_deposit_request_list_response_model.dart';
import 'package:rnn_yaatra/models/account_models/get_fund_balance_response_model.dart';
import 'package:rnn_yaatra/models/account_models/get_kyc_detail_response_model.dart';
import 'package:rnn_yaatra/models/account_models/get_max_plan_response_model.dart';
import 'package:rnn_yaatra/models/account_models/get_profile_detail_response_model.dart';
import 'package:rnn_yaatra/models/account_models/get_topup_list_response_model.dart';
import 'package:rnn_yaatra/models/account_models/get_trans_password_response_model.dart';
import 'package:rnn_yaatra/models/account_models/get_transaction_detail_response_model.dart';
import 'package:rnn_yaatra/models/account_models/get_withdrawal_request_list_response_model.dart';
import 'package:rnn_yaatra/models/account_models/send_message_response_model.dart';
import 'package:rnn_yaatra/models/account_models/topup_user_with_wallet_response_model.dart';
import 'package:rnn_yaatra/models/aipi_income_model.dart';
import 'package:rnn_yaatra/models/get_down_line_model.dart';
import 'package:rnn_yaatra/models/get_team__model.dart';
import 'package:rnn_yaatra/models/rank_chart_model.dart';
import 'package:rnn_yaatra/models/reward_incentive_pool_model.dart';
import 'package:rnn_yaatra/services/api_client.dart';
import 'package:rnn_yaatra/utils/print_logs.dart';

import '../helpers/app_storage.dart';
import '../models/lipi_income_model.dart';

class AccountServices extends ApiClient {

  Future<GetProfileDetailResponseModel> get_profile_detail({String? userID}) async { 
    try {
      var currentUserId = (userID != null && userID.isNotEmpty) ? userID : await AppStorage.getUserID();
      var response = await api_get(url: APIURL.GET_PROFILE_DETAIL(
        userId: currentUserId
      ));

      if (response != null && response is Map<String, dynamic>) {
        return GetProfileDetailResponseModel.fromJson(response);
      }
      return GetProfileDetailResponseModel();

    } catch (e) {
      PrintLogs().print_console_error(message: "ACCOUNT SERVICES - GET PROFILE DETAIL",e: e.toString());
      return GetProfileDetailResponseModel();
    }
  }

  Future<GetProfileDetailResponseModel> getProfileDetail({String? userID}) =>
      get_profile_detail(userID: userID);

  Future get_kyc_detail({String? userID}) async { 
    try {
      var currentUserId = (userID != null && userID.isNotEmpty) ? userID : await AppStorage.getUserID();
      var response = await api_get(url: APIURL.GET_KYC_DETAIL(
        userId: currentUserId
      ));

      if (response != null && response is Map<String, dynamic>) {
        return GetKycDetailResponseModel.fromJson(response);
      }
      return GetKycDetailResponseModel();

    } catch (e) {
      PrintLogs().print_console_error(message: "ACCOUNT SERVICES - GET KYC DETAIL",e: e.toString());
      return GetKycDetailResponseModel();
    }
  } 

  Future getKycDetail({String? userID}) => get_kyc_detail(userID: userID);

  Future update_kyc({String? userId,String? panNo,String? bankId,String? accountNo,String? ifscCode,
  String? panImage,String? passbookImage}) async { 
    try {
      var currentUserId = (userId != null && userId.isNotEmpty) ? userId : await AppStorage.getUserID();
      Map<String,dynamic> body = {
        "Userid": currentUserId ?? "",
        "PanNo": panNo ?? "",
        "BankId": bankId ?? "",
        "AccountNo": accountNo ?? "",
        "IFSCCode": ifscCode ?? "",
        "PanImage": panImage ?? "",
        "PassBookImage": passbookImage ?? ""
      };



      var response = await api_post(body: body,url: APIURL.UPLOAD_KYC_DETAILS);

      return response;
      
    } catch (e) {
      PrintLogs().print_console_error(message: "ACCOUNT SERVICES - UPDATE KYC",e: e.toString());
      return null;
    }
  }

  Future updateKyc({String? userId, String? panNo, String? bankId, String? accountNo, String? ifscCode, String? panImage, String? passbookImage}) =>
      update_kyc(userId: userId, panNo: panNo, bankId: bankId, accountNo: accountNo, ifscCode: ifscCode, panImage: panImage, passbookImage: passbookImage);

  Future update_profile({String? name, String? email,String? phone,String? gender,String? aadharNo,
    String? panNo,String? address,String? photo,String? nomineeName,String? nomineeRelation,String? accountHolderName,
    String? bankName,String? bankBranch,String? accountNo,String? ifscCode,
  }) async {
    try {

      String base64Photo = "";
      if (photo != null && photo.isNotEmpty) {
        if (photo.startsWith("http://") || photo.startsWith("https://") || photo.startsWith("data:image")) {
          base64Photo = photo;
        } else {
          try {
            File f = File(photo);
            if (f.existsSync()) {
              String rawBase64 = ImagePickerHelper.encode_image_base_64(image_path: photo);
              if (rawBase64.isNotEmpty) {
                String ext = photo.split('.').last.toLowerCase();
                String mime = (ext == 'jpg' || ext == 'jpeg') ? 'jpeg' : 'png';
                base64Photo = "data:image/$mime;base64,$rawBase64";
              }
            } else {
              base64Photo = photo;
            }
          } catch (_) {
            base64Photo = photo;
          }
        }
      }

      Map<String,dynamic> body = {
        "userid": await AppStorage.getUserID() ?? "",
        "username": name ?? "",
        "mobile": phone ?? '',
        "email": email ?? "",
        "gender": gender ?? "",
        "Address": address ?? "",
        "AdharNo": aadharNo ?? "",
        "PanNo": panNo ?? "",
        "AccHolderName": accountHolderName ?? "",
        "BankName": bankName ?? '',
        "BranchName": bankBranch ?? '',
        "AccountNo": accountNo ?? '',
        "Ifsccode": ifscCode ?? "",
        "NomineeName": nomineeName ?? '',
        "NomineeRelation": nomineeRelation ?? "",
        "ProfileImage": base64Photo,
      };

      var response = await api_post(
        body: body,
        url: APIURL.UPDATE_PROFILE,
        is_encode_body: true,
      );
      return response;
    } catch (e) {
      PrintLogs().print_console(message: "ACCOUNT SERVICES - UPDATE PROFILE",e: e.toString());
      return null;
    }
  }

  Future updateProfile({String? name, String? email, String? phone, String? gender, String? aadharNo, String? panNo, String? address, String? photo, String? nomineeName, String? nomineeRelation, String? accountHolderName, String? bankName, String? bankBranch, String? accountNo, String? ifscCode}) =>
      update_profile(name: name, email: email, phone: phone, gender: gender, aadharNo: aadharNo, panNo: panNo, address: address, photo: photo, nomineeName: nomineeName, nomineeRelation: nomineeRelation, accountHolderName: accountHolderName, bankName: bankName, bankBranch: bankBranch, accountNo: accountNo, ifscCode: ifscCode);

  Future<GetTeamModel> get_direct_team({String? userID, String? from, String? to}) async {
    try {
      var currentUserId = (userID != null && userID.isNotEmpty) ? userID : await AppStorage.getUserID();
      var response = await api_get(url: APIURL.DIRECT_TEAM(
          userID: currentUserId,
          from: from,
          to: to
      ));

      if (response != null && response is Map<String, dynamic>) {
        return GetTeamModel.fromJson(response);
      }
      return GetTeamModel();

    } catch (e) {
      PrintLogs().print_console_error(message: "ACCOUNT SERVICES - GET DIRECT TEAM",e: e.toString());
      return GetTeamModel();
    }
  }

  Future<GetTeamModel> getDirectTeam({String? userID, String? from, String? to}) =>
      get_direct_team(userID: userID, from: from, to: to);

  Future<GetDownLineModel> get_downline_team({String? userID, String? from, String? to, String? direction}) async {
    try {
      var currentUserId = (userID != null && userID.isNotEmpty) ? userID : await AppStorage.getUserID();
      var response = await api_get(url: APIURL.DOWNLINE_TEAM(
          userID: currentUserId,
          from: from,
          to: to,
          direction: direction
      ));

      if (response != null && response is Map<String, dynamic>) {
        return GetDownLineModel.fromJson(response);
      }
      return GetDownLineModel();

    } catch (e) {
      PrintLogs().print_console_error(message: "ACCOUNT SERVICES - GET DOWNLINE TEAM",e: e.toString());
      return GetDownLineModel();
    }
  }

  Future<GetDownLineModel> getDownLineTeam({String? userID, String? from, String? to, String? direction}) =>
      get_downline_team(userID: userID, from: from, to: to, direction: direction);

  Future<AIPIncomeModel> get_aipi_income({String? userID, String? from, String? to, String? direction}) async {
    try {
      var currentUserId = (userID != null && userID.isNotEmpty) ? userID : await AppStorage.getUserID();
      var response = await api_get(url: APIURL.AIPII_ENCOME(
          userID: currentUserId,
          from: from,
          to: to,
          direction: direction
      ));

      if (response != null && response is Map<String, dynamic>) {
        return AIPIncomeModel.fromJson(response);
      }
      return AIPIncomeModel();

    } catch (e) {
      PrintLogs().print_console_error(message: "ACCOUNT SERVICES - GET AIPI INCOME",e: e.toString());
      return AIPIncomeModel();
    }
  }

  Future<AIPIncomeModel> getAipiIncomeService({String? userID, String? from, String? to, String? direction}) =>
      get_aipi_income(userID: userID, from: from, to: to, direction: direction);

  Future<LIPIncomeModel> get_lipi_income({String? userID, String? from, String? to, String? direction}) async {
    try {
      var currentUserId = (userID != null && userID.isNotEmpty) ? userID : await AppStorage.getUserID();
      var response = await api_get(url: APIURL.LIPI_ENCOME(
          userID: currentUserId,
          from: from,
          to: to,
          direction: direction
      ));

      if (response != null && response is Map<String, dynamic>) {
        return LIPIncomeModel.fromJson(response);
      }
      return LIPIncomeModel();

    } catch (e) {
      PrintLogs().print_console_error(message: "ACCOUNT SERVICES - GET LIPI INCOME",e: e.toString());
      return LIPIncomeModel();
    }
  }

  Future<LIPIncomeModel> getLipiIncomeService({String? userID, String? from, String? to, String? direction}) =>
      get_lipi_income(userID: userID, from: from, to: to, direction: direction);

  Future<RankChartModel> get_rank_chart({String? userID, String? from, String? to, String? direction}) async {
    try {
      var currentUserId = (userID != null && userID.isNotEmpty) ? userID : await AppStorage.getUserID();
      var response = await api_get(url: APIURL.RANK_Chart(
          userID: currentUserId,
          from: from,
          to: to,
          direction: direction
      ));

      if (response != null && response is Map<String, dynamic>) {
        return RankChartModel.fromJson(response);
      }
      return RankChartModel();

    } catch (e) {
      PrintLogs().print_console_error(message: "ACCOUNT SERVICES - GET RANK CHART",e: e.toString());
      return RankChartModel();
    }
  }

  Future<RankChartModel> getRankChartService({String? userID, String? from, String? to, String? direction}) =>
      get_rank_chart(userID: userID, from: from, to: to, direction: direction);

  Future<RewardIncentivePoolModel> get_reward_incentive_pool({String? userID, String? from, String? to}) async {
    try {
      var currentUserId = (userID != null && userID.isNotEmpty) ? userID : await AppStorage.getUserID();
      var response = await api_get(url: APIURL.REWARD_INCENTIVE_POOL_LIST(
          userID: currentUserId,
          from: from,
          to: to
      ));

      if (response != null && response is Map<String, dynamic>) {
        return RewardIncentivePoolModel.fromJson(response);
      }
      return RewardIncentivePoolModel();

    } catch (e) {
      PrintLogs().print_console_error(message: "ACCOUNT SERVICES - GET REWARD INCENTIVE POOL",e: e.toString());
      return RewardIncentivePoolModel();
    }
  }

  Future<RewardIncentivePoolModel> getRewardIncentivePoolService({String? userID, String? from, String? to}) =>
      get_reward_incentive_pool(userID: userID, from: from, to: to);

  Future<GetFundBalanceResponseModel> get_fund_balance({String? userId}) async {
    try {
      var currentUserId = (userId != null && userId.isNotEmpty) ? userId : await AppStorage.getUserID();
      var response = await api_get(url: APIURL.GET_FUND_BALANCE(
          userId: currentUserId
      ));

      if (response != null && response is Map<String, dynamic>) {
        return GetFundBalanceResponseModel.fromJson(response);
      }
      return GetFundBalanceResponseModel();

    } catch (e) {
      PrintLogs().print_console_error(message: "ACCOUNT SERVICES - GET FUND BALANCE",e: e.toString());
      return GetFundBalanceResponseModel();
    }
  }

  Future<GetFundBalanceResponseModel> getFundBalance({String? userId}) =>
      get_fund_balance(userId: userId);

  Future<GetMaxPlanResponseModel> get_max_plan({String? userId}) async {
    try {
      var currentUserId = (userId != null && userId.isNotEmpty) ? userId : await AppStorage.getUserID();
      var response = await api_get(url: APIURL.GET_MAX_PLAN(
          userId: currentUserId
      ));

      if (response != null && response is Map<String, dynamic>) {
        return GetMaxPlanResponseModel.fromJson(response);
      }
      return GetMaxPlanResponseModel();

    } catch (e) {
      PrintLogs().print_console_error(message: "ACCOUNT SERVICES - GET MAX PLAN",e: e.toString());
      return GetMaxPlanResponseModel();
    }
  }

  Future<GetMaxPlanResponseModel> getMaxPlan({String? userId}) =>
      get_max_plan(userId: userId);

  Future<GetTopupListResponseModel> get_topup_list({String? userId, String? from, String? to}) async {
    try {
      var currentUserId = (userId != null && userId.isNotEmpty) ? userId : await AppStorage.getUserID();
      var response = await api_get(url: APIURL.GET_TOPUP_LIST(
          userId: currentUserId,
          from: from,
          to: to
      ));

      if (response != null && response is Map<String, dynamic>) {
        return GetTopupListResponseModel.fromJson(response);
      }
      return GetTopupListResponseModel();

    } catch (e) {
      PrintLogs().print_console_error(message: "ACCOUNT SERVICES - GET TOPUP LIST",e: e.toString());
      return GetTopupListResponseModel();
    }
  }

  Future<GetTopupListResponseModel> getTopupList({String? userId, String? from, String? to}) =>
      get_topup_list(userId: userId, from: from, to: to);

  Future<GetTransactionDetailResponseModel> get_transaction_detail({String? userId, String? from, String? to, String? type}) async {
    try {
      var currentUserId = (userId != null && userId.isNotEmpty) ? userId : await AppStorage.getUserID();
      var response = await api_get(url: APIURL.GET_TRANSACTION_DETAIL(
          userId: currentUserId,
          from: from,
          to: to,
          type: type
      ));

      if (response != null && response is Map<String, dynamic>) {
        return GetTransactionDetailResponseModel.fromJson(response);
      }
      return GetTransactionDetailResponseModel();

    } catch (e) {
      PrintLogs().print_console_error(message: "ACCOUNT SERVICES - GET TRANSACTION DETAIL",e: e.toString());
      return GetTransactionDetailResponseModel();
    }
  }

  Future<GetTransactionDetailResponseModel> getTransactionDetail({String? userId, String? from, String? to, String? type}) =>
      get_transaction_detail(userId: userId, from: from, to: to, type: type);

  Future<GetDepositRequestListResponseModel> get_deposit_request_list({String? userId, String? from, String? to, String? status}) async {
    try {
      var currentUserId = (userId != null && userId.isNotEmpty) ? userId : await AppStorage.getUserID();
      var response = await api_get(url: APIURL.GET_DEPOSIT_REQUEST_LIST(
          userId: currentUserId,
          from: from,
          to: to,
          status: status
      ));

      if (response != null && response is Map<String, dynamic>) {
        return GetDepositRequestListResponseModel.fromJson(response);
      }
      return GetDepositRequestListResponseModel();

    } catch (e) {
      PrintLogs().print_console_error(message: "ACCOUNT SERVICES - GET DEPOSIT REQUEST LIST",e: e.toString());
      return GetDepositRequestListResponseModel();
    }
  }

  Future<GetDepositRequestListResponseModel> getDepositRequestList({String? userId, String? from, String? to, String? status}) =>
      get_deposit_request_list(userId: userId, from: from, to: to, status: status);

  Future<GetWithdrawalRequestListResponseModel> get_withdrawal_request_list({String? userId, String? from, String? to, String? status}) async {
    try {
      var currentUserId = (userId != null && userId.isNotEmpty) ? userId : await AppStorage.getUserID();
      var response = await api_get(url: APIURL.GET_WITHDRAWAL_REQUEST_LIST(
          userId: currentUserId,
          from: from,
          to: to,
          status: status
      ));

      if (response != null && response is Map<String, dynamic>) {
        return GetWithdrawalRequestListResponseModel.fromJson(response);
      }
      return GetWithdrawalRequestListResponseModel();

    } catch (e) {
      PrintLogs().print_console_error(message: "ACCOUNT SERVICES - GET Payment Report LIST",e: e.toString());
      return GetWithdrawalRequestListResponseModel();
    }
  }

  Future<GetWithdrawalRequestListResponseModel> getWithdrawalRequestList({String? userId, String? from, String? to, String? status}) =>
      get_withdrawal_request_list(userId: userId, from: from, to: to, status: status);

  Future<TopupUserWithWalletResponseModel> topup_user_with_wallet({String? planId, String? userId, String? topupUserId}) async {
    try {
      var currentUserId = (userId != null && userId.isNotEmpty) ? userId : await AppStorage.getUserID();
      var response = await api_post(
          body: {},
          url: APIURL.TOPUP_USER_WITH_WALLET(
              planId: planId,
              userId: currentUserId,
              topupUserId: topupUserId
          )
      );

      if (response != null && response is Map<String, dynamic>) {
        return TopupUserWithWalletResponseModel.fromJson(response);
      }
      return TopupUserWithWalletResponseModel();

    } catch (e) {
      PrintLogs().print_console_error(message: "ACCOUNT SERVICES - TOPUP USER WITH WALLET",e: e.toString());
      return TopupUserWithWalletResponseModel();
    }
  }

  Future<TopupUserWithWalletResponseModel> topupUserWithWallet({String? planId, String? userId, String? topupUserId}) =>
      topup_user_with_wallet(planId: planId, userId: userId, topupUserId: topupUserId);

  Future<SendMessageResponseModel> send_message({String? userId}) async {
    try {
      var currentUserId = (userId != null && userId.isNotEmpty) ? userId : await AppStorage.getUserID();
      Map<String,dynamic> body = {
        "UserId" : currentUserId
      };
      var response = await api_post(body: body,url: APIURL.SEND_MESSAGE(
          userId: currentUserId
      ));
      // var response = await api_get(url: APIURL.SEND_MESSAGE(
      //     userId: currentUserId
      // ));

      if (response != null && response is Map<String, dynamic>) {
        return SendMessageResponseModel.fromJson(response);
      }
      return SendMessageResponseModel();

    } catch (e) {
      PrintLogs().print_console_error(message: "ACCOUNT SERVICES - SEND MESSAGE",e: e.toString());
      return SendMessageResponseModel();
    }
  }

  Future<SendMessageResponseModel> sendMessage({String? userId}) =>
      send_message(userId: userId);

  Future<SendMessageResponseModel> getSendMessageList({String? userId}) =>
      send_message(userId: userId);

  Future<GetTransPasswordResponseModel> get_trans_password({String? transPassword, String? userId}) async {
    try {
      var currentUserId = (userId != null && userId.isNotEmpty) ? userId : await AppStorage.getUserID();
      var response = await api_get(url: APIURL.GET_TRANS_PASSWORD(
          transPassword: transPassword,
          userId: currentUserId
      ));

      if (response != null && response is Map<String, dynamic>) {
        return GetTransPasswordResponseModel.fromJson(response);
      }
      return GetTransPasswordResponseModel();

    } catch (e) {
      PrintLogs().print_console_error(message: "ACCOUNT SERVICES - GET TRANS PASSWORD",e: e.toString());
      return GetTransPasswordResponseModel();
    }
  }

  Future<GetTransPasswordResponseModel> getTransPassword({String? transPassword, String? userId}) =>
      get_trans_password(transPassword: transPassword, userId: userId);

  Future<ComposeMessageResponseModel> compose_message({String? userId, String? subject, String? message}) async {
    try {
      var currentUserId = (userId != null && userId.isNotEmpty) ? userId : await AppStorage.getUserID();
      var response = await api_post(
          body: {},
          url: APIURL.COMPOSE_MESSAGE(
              userId: currentUserId,
              subject: subject,
              message: message
          )
      );

      if (response != null && response is Map<String, dynamic>) {
        return ComposeMessageResponseModel.fromJson(response);
      }
      return ComposeMessageResponseModel();

    } catch (e) {
      PrintLogs().print_console_error(message: "ACCOUNT SERVICES - COMPOSE MESSAGE",e: e.toString());
      return ComposeMessageResponseModel();
    }
  }

  Future<ComposeMessageResponseModel> composeMessage({String? userId, String? subject, String? message}) =>
      compose_message(userId: userId, subject: subject, message: message);

  Future<ChangePasswordResponseModel> change_password({String? userId, String? oldPassword, String? newPassword}) async {
    try {
      var currentUserId = (userId != null && userId.isNotEmpty) ? userId : await AppStorage.getUserID();
      var response = await api_post(
          body: {},
          url: APIURL.CHANGE_PASSWORD(
              userId: currentUserId,
              oldPassword: oldPassword,
              newPassword: newPassword
          )
      );

      if (response != null && response is Map<String, dynamic>) {
        return ChangePasswordResponseModel.fromJson(response);
      }
      return ChangePasswordResponseModel();

    } catch (e) {
      PrintLogs().print_console_error(message: "ACCOUNT SERVICES - CHANGE PASSWORD",e: e.toString());
      return ChangePasswordResponseModel();
    }
  }

  Future<ChangePasswordResponseModel> changePassword({String? userId, String? oldPassword, String? newPassword}) =>
      change_password(userId: userId, oldPassword: oldPassword, newPassword: newPassword);

  Future<ChangePasswordResponseModel> change_trans_password({String? userId, String? oldPassword, String? password}) async {
    try {
      var currentUserId = (userId != null && userId.isNotEmpty) ? userId : await AppStorage.getUserID();
      var response = await api_post(
          body: {},
          url: APIURL.CHANGE_TRANS_PASSWORD(
              userId: currentUserId,
              oldPassword: oldPassword,
              password: password
          )
      );

      if (response != null && response is Map<String, dynamic>) {
        return ChangePasswordResponseModel.fromJson(response);
      }
      return ChangePasswordResponseModel();

    } catch (e) {
      PrintLogs().print_console_error(message: "ACCOUNT SERVICES - CHANGE TRANS PASSWORD",e: e.toString());
      return ChangePasswordResponseModel();
    }
  }

  Future<ChangePasswordResponseModel> changeTransPassword({String? userId, String? oldPassword, String? password}) =>
      change_trans_password(userId: userId, oldPassword: oldPassword, password: password);

}
