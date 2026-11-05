import 'package:rnn_yaatra/constants/constants.dart';
import 'package:rnn_yaatra/models/home_models/get_dashboard_response_model.dart';
import 'package:rnn_yaatra/services/api_client.dart';
import 'package:rnn_yaatra/utils/print_logs.dart';

class HomeServiecs extends ApiClient {

  Future<GetDashboardResponseModel> get_dashboard({String? userId}) async { 
    try {
      
      var response = await api_get(url: APIURL.GET_DASHBOARD(
        userID: userId
      ));

      GetDashboardResponseModel responseModel = GetDashboardResponseModel.fromJson(response);
      return responseModel;

    } catch (e) {
      PrintLogs().print_console_error(message: "HOME SERVICES - GET DASHBOARD",e: e.toString());
      return GetDashboardResponseModel();
    }
  }

}