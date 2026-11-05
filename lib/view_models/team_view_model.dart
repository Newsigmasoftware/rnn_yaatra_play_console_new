import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rnn_yaatra/helpers/app_storage.dart';
import 'package:rnn_yaatra/models/aipi_income_model.dart';
import 'package:rnn_yaatra/models/get_down_line_model.dart';
import 'package:rnn_yaatra/models/get_team__model.dart';
import 'package:rnn_yaatra/models/rank_chart_model.dart';
import 'package:rnn_yaatra/models/reward_incentive_pool_model.dart';
import 'package:rnn_yaatra/notifiers_interfaces/team_interface.dart';
import 'package:rnn_yaatra/services/account_services.dart';
import 'package:rnn_yaatra/utils/print_logs.dart';

import '../models/lipi_income_model.dart';

final getTeamViewModelGlobalNotifier = NotifierProvider<TeamViewModelNotifier,TeamInterface>(TeamViewModelNotifier.new);

class TeamViewModelNotifier extends Notifier<TeamInterface> {

  final AccountServices accountServices = AccountServices();

  @override
  TeamInterface build() {
    return TeamInterface();
  }

  Future get_direct_team({ String? from, String? to}) async {
    try {
      state = state.copyWith(
          loadingDirectTeam: true
      );

      GetTeamModel responseModel = await accountServices.get_direct_team(
        userID: await AppStorage.getUserID(),
        from: from,
        to: to
      );

      if(responseModel.data != null){
        state = state.copyWith(
            loadingDirectTeam: false,
            directTeamModel: responseModel
        );
      }else{
        state = state.copyWith(
            loadingDirectTeam: false,
            directTeamModel: GetTeamModel()
        );
      }


    } catch (e) {
      state = state.copyWith(
          loadingDirectTeam: false,
          directTeamModel: GetTeamModel()
      );
      PrintLogs().print_console_error(message: "TEAM VIEW MODEL - GET DIRECT TEAM",e: e.toString());
    }
  }


  Future getDownLineTeam({String? from, String? to, String? direction}) async {
    try {
      state = state.copyWith(
          loadingDownlineTeam: true
      );
      GetDownLineModel responseModel = await accountServices.getDownLineTeam(
          from: from,
          to: to,
          direction: direction
      );

      if(responseModel.data != null){
        state = state.copyWith(
            loadingDownlineTeam: false,
            downlineTeamModel: responseModel
        );
      }else{
        state = state.copyWith(
            loadingDownlineTeam: false,
            downlineTeamModel: GetDownLineModel()
        );
      }

    } catch (e) {
      state = state.copyWith(
          loadingDownlineTeam: false,
          downlineTeamModel: GetDownLineModel()
      );
      PrintLogs().print_console_error(message: "TEAM VIEW MODEL - GET DOWNLINE TEAM",e: e.toString());
    }
  }

  Future aipiIncomeApi({String? from, String? to, String? direction}) async {
    try {
      state = state.copyWith(
          isLoadingAipiIncome: true
      );
      AIPIncomeModel responseModel = await accountServices.getAipiIncomeService(
          from: from,
          to: to,
          direction: direction
      );
      if(responseModel.data != null){
        state = state.copyWith(
            isLoadingAipiIncome: false,
            aipIncomeModel: responseModel
        );
      }else{
        state = state.copyWith(
            isLoadingAipiIncome: false,
            aipIncomeModel: AIPIncomeModel()
        );
      }

    } catch (e) {
      state = state.copyWith(
          isLoadingAipiIncome: false,
          aipIncomeModel: AIPIncomeModel()
      );
      PrintLogs().print_console_error(message: "TEAM VIEW MODEL - GET DOWNLINE TEAM",e: e.toString());
    }
  }

  Future lipiIncomeApi({String? from, String? to, String? direction}) async {
    try {
      state = state.copyWith(
          isLoadingLiPiIncome: true
      );
      LIPIncomeModel responseModel = await accountServices.getLipiIncomeService(
          from: from,
          to: to,
          direction: direction
      );
      if(responseModel.data != null){
        state = state.copyWith(
            isLoadingLiPiIncome: false,
            lipIncomeModel: responseModel
        );
      }else{
        state = state.copyWith(
            isLoadingLiPiIncome: false,
            lipIncomeModel: LIPIncomeModel()
        );
      }

    } catch (e) {
      state = state.copyWith(
          isLoadingLiPiIncome: false,
          lipIncomeModel: LIPIncomeModel()
      );
      PrintLogs().print_console_error(message: "TEAM VIEW MODEL - GET DOWNLINE TEAM",e: e.toString());
    }
  }

  Future rankChartApi({String? from, String? to, String? direction}) async {
    try {
      state = state.copyWith(
          isLoadingRankChart: true
      );
      RankChartModel responseModel = await accountServices.getRankChartService(
          from: from,
          to: to,
          direction: direction
      );
      if(responseModel.data != null){
        state = state.copyWith(
            isLoadingRankChart: false,
            rankChartModel: responseModel
        );
      }else{
        state = state.copyWith(
            isLoadingRankChart: false,
            rankChartModel: RankChartModel()
        );
      }

    } catch (e) {
      state = state.copyWith(
          isLoadingRankChart: false,
          rankChartModel: RankChartModel()
      );
      PrintLogs().print_console_error(message: "TEAM VIEW MODEL - GET DOWNLINE TEAM",e: e.toString());
    }
  }

  Future rewardIncentivePoolApi({String? from, String? to}) async {
    try {
      state = state.copyWith(
          isLoadingRewardIncome: true
      );
      RewardIncentivePoolModel responseModel = await accountServices.getRewardIncentivePoolService(
          from: from,
          to: to
      );
      if(responseModel.data != null){
        state = state.copyWith(
            isLoadingRewardIncome: false,
            rewardIncentivePoolModel: responseModel
        );
      }else{
        state = state.copyWith(
            isLoadingRewardIncome: false,
            rewardIncentivePoolModel: RewardIncentivePoolModel()
        );
      }

    } catch (e) {
      state = state.copyWith(
          isLoadingRewardIncome: false,
          rewardIncentivePoolModel: RewardIncentivePoolModel()
      );
      PrintLogs().print_console_error(message: "TEAM VIEW MODEL - GET REWARD INCENTIVE POOL",e: e.toString());
    }
  }

}

