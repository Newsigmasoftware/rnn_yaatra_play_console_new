import 'package:rnn_yaatra/models/aipi_income_model.dart';
import 'package:rnn_yaatra/models/get_down_line_model.dart';
import 'package:rnn_yaatra/models/get_team__model.dart';
import 'package:rnn_yaatra/models/reward_incentive_pool_model.dart';

import '../models/lipi_income_model.dart';
import '../models/rank_chart_model.dart';

class TeamInterface {
  final bool isLoadingDirectTeam;
  final GetTeamModel? directTeamModel;
  final bool isLoadingDownlineTeam;
  final GetDownLineModel? downlineTeamModel;
  final bool isLoadingAipiIncome;
  final AIPIncomeModel? aipIncomeModel;
  final bool isLoadingLiPiIncome;
  final LIPIncomeModel? lipIncomeModel;
  final bool isLoadingRankChart;
  final RankChartModel? rankChartModel;
  final bool isLoadingRewardIncome;
  final RewardIncentivePoolModel? rewardIncentivePoolModel;

  TeamInterface({
    this.isLoadingDirectTeam = false,
    this.directTeamModel,
    this.aipIncomeModel,
    this.isLoadingAipiIncome = false,
    this.isLoadingDownlineTeam = false,
    this.downlineTeamModel,
    this.isLoadingLiPiIncome = false,
    this.lipIncomeModel,
    this.isLoadingRankChart = false,
    this.rankChartModel,
    this.isLoadingRewardIncome = false,
    this.rewardIncentivePoolModel,
  });

  TeamInterface copyWith({
    bool? loadingDirectTeam,
    GetTeamModel? directTeamModel,
    bool? loadingDownlineTeam,
    GetDownLineModel? downlineTeamModel,
    bool? isLoadingAipiIncome,
    AIPIncomeModel? aipIncomeModel,
    bool? isLoadingLiPiIncome,
    LIPIncomeModel? lipIncomeModel,
    bool? isLoadingRankChart,
    RankChartModel? rankChartModel,
    bool? isLoadingRewardIncome,
    RewardIncentivePoolModel? rewardIncentivePoolModel,
  }) {
    return TeamInterface(
      isLoadingDirectTeam: loadingDirectTeam ?? isLoadingDirectTeam,
      directTeamModel: directTeamModel ?? this.directTeamModel,
      isLoadingDownlineTeam: loadingDownlineTeam ?? isLoadingDownlineTeam,
      downlineTeamModel: downlineTeamModel ?? this.downlineTeamModel,
      isLoadingAipiIncome: isLoadingAipiIncome ?? this.isLoadingAipiIncome,
      aipIncomeModel: aipIncomeModel ?? this.aipIncomeModel,
      isLoadingLiPiIncome: isLoadingLiPiIncome ?? this.isLoadingLiPiIncome,
      lipIncomeModel: lipIncomeModel ?? this.lipIncomeModel,
      isLoadingRankChart: isLoadingRankChart ?? this.isLoadingRankChart,
      rankChartModel: rankChartModel ?? this.rankChartModel,
      isLoadingRewardIncome: isLoadingRewardIncome ?? this.isLoadingRewardIncome,
      rewardIncentivePoolModel: rewardIncentivePoolModel ?? this.rewardIncentivePoolModel,
    );
  }
}
