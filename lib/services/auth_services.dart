// ignore_for_file: non_constant_identifier_names

import 'package:rnn_yaatra/constants/constants.dart';
import 'package:rnn_yaatra/helpers/app_storage.dart';
import 'package:rnn_yaatra/models/auth_models/login_response_model.dart'; 
import 'package:rnn_yaatra/models/auth_models/verify_sponsor_response_model.dart';
import 'package:rnn_yaatra/services/api_client.dart';
import 'package:rnn_yaatra/utils/print_logs.dart';

class AuthServices extends ApiClient {

  Future login({String? userId,String? password}) async { 
    try {
      
      Map<String,dynamic> body = {
        "userid" : userId ?? "",
        "password" : password ?? ""
      };

      var response = await api_post(body: body,url: APIURL.LOGIN(
        userID: userId ?? "",
        password: password ?? "",
      ));
      
      LoginResponseModel responseModel = LoginResponseModel.fromJson(response);
      return responseModel;

    } catch (e) {
      PrintLogs().print_console_error(message: "AUTH SERVICES - LOGIN",e: e.toString());
    }
  }

  Future verifySponsor({String? userID}) async { 
    try {
      
    var response = await api_get(url: APIURL.VERIFY_SPONSOR(userID: userID));
    VerifySponsorResponseModel responseModel = VerifySponsorResponseModel.fromJson(response);
    return responseModel;

    } catch (e) {
      PrintLogs().print_console_error(message: "AUTH SERVICES - VERIFY SPONSOR",e: e.toString());
    }
  }


   

  Future changePassword({String? oldPassword,String? newPassword,String? confirmPassword}) async {
    try {
      final userId = await AppStorage.getUserID();
      var response = await api_post(
        body: {},
        url: APIURL.CHANGE_PASSWORD(
          userId: userId,
          oldPassword: oldPassword,
          newPassword: newPassword,
        ),
      );
      return response;
    } catch (e) {
      PrintLogs().print_console_error(message: "AUTH SERVICES - CHANGE PASSWORD",e: e.toString());
    }
  }


  Future change_transaction_password({String? oldPassword,String? newPassword,String? confirmPassword}) async { 
    try {
      final userId = await AppStorage.getUserID();
      var response = await api_post(
        body: {},
        url: APIURL.CHANGE_TRANS_PASSWORD(
          userId: userId,
          oldPassword: oldPassword,
          password: newPassword,
        ),
      );
      return response;
    } catch (e) {
      PrintLogs().print_console_error(message: "AUTH SERVICES - CHANGE TRANSACTION PASSWORD",e: e.toString());
    }
  }

}