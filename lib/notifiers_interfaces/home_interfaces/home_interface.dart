import 'package:rnn_yaatra/models/home_models/get_dashboard_response_model.dart';


class HomeInterface {

  final bool isLoadingHome;
  final GetDashboardResponseModel? dashboardResponseModel;

  final List? earningOverViewList;

  final int? activeSliderIndex;
  HomeInterface({
    this.isLoadingHome = false,this.dashboardResponseModel,
    this.earningOverViewList,
    this.activeSliderIndex =0 
  });

  HomeInterface copyWith({
    bool? loadingHome,
    GetDashboardResponseModel? dashboardModel,
    List? earningOvrList,
    int? activeSliderIndex
  }) {
    return HomeInterface(
      isLoadingHome: loadingHome ?? isLoadingHome,
      dashboardResponseModel: dashboardModel ?? dashboardResponseModel,
      earningOverViewList: earningOvrList ?? earningOverViewList,
      activeSliderIndex: activeSliderIndex?? this.activeSliderIndex
    );
  }

}