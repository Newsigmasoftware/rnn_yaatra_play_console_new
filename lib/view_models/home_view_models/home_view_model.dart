import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rnn_yaatra/helpers/app_storage.dart';
import 'package:rnn_yaatra/models/home_models/get_dashboard_response_model.dart';
import 'package:rnn_yaatra/notifiers_interfaces/home_interfaces/home_interface.dart';
import 'package:rnn_yaatra/services/home_serviecs.dart';
import 'package:rnn_yaatra/utils/print_logs.dart';

class HomeViewModel {

  final pageStateProvider = NotifierProvider<HomeViewModelNotifier,HomeInterface>(HomeViewModelNotifier.new); 

}

class HomeViewModelNotifier extends Notifier<HomeInterface> {

  final HomeServiecs homeServiecs = HomeServiecs();

  @override
  HomeInterface build() {
    return HomeInterface();
  }

  setSliderIndex({int? activeSliderIndex}) { 
    state = state.copyWith(
      activeSliderIndex: activeSliderIndex
    );
  }

  Future get_dashboard_data() async { 
    try {

      state = state.copyWith(
        loadingHome: true
      );
      var userID = await AppStorage.getUserID();
      GetDashboardResponseModel responseModel = await homeServiecs.get_dashboard(
        userId: userID
      );
      
      state = state.copyWith(
        loadingHome: false,
        dashboardModel: responseModel, 
      );
      
    } catch (e) {
      state = state.copyWith(
        loadingHome: false,
        dashboardModel: GetDashboardResponseModel(), 
      );
      PrintLogs().print_console_error(message: "HOME VIEW MODEL - GET DASHBOARD DATA",e: e.toString());
    }
  } 

}