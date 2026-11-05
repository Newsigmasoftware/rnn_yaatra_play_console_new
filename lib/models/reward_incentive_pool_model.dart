class RewardIncentivePoolModel {
  bool? success;
  List<RewardIncentiveData>? data;
  int? count;

  RewardIncentivePoolModel({this.success, this.data, this.count});

  RewardIncentivePoolModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <RewardIncentiveData>[];
      json['data'].forEach((v) {
        data!.add(RewardIncentiveData.fromJson(v));
      });
    }
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['count'] = count;
    return data;
  }
}

class RewardIncentiveData {
  String? id;
  String? userId;
  String? userName;
  String? festivalIncentiveFund;
  String? fmcg;
  String? salaryAmount;
  String? levelNo;
  String? slabName;
  String? totalTeamSIP;
  String? entrydate;
  String? payMonthCount;

  RewardIncentiveData({
    this.id,
    this.userId,
    this.userName,
    this.festivalIncentiveFund,
    this.fmcg,
    this.salaryAmount,
    this.levelNo,
    this.slabName,
    this.totalTeamSIP,
    this.entrydate,
    this.payMonthCount,
  });

  RewardIncentiveData.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    userId = json['UserId'];
    userName = json['UserName'];
    festivalIncentiveFund = json['FestivalIncentiveFund'];
    fmcg = json['FMCG'];
    salaryAmount = json['SalaryAmount'];
    levelNo = json['LevelNo'];
    slabName = json['SlabName'];
    totalTeamSIP = json['TotalTeamSIP'];
    entrydate = json['Entrydate'];
    payMonthCount = json['PayMonthCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['UserId'] = userId;
    data['UserName'] = userName;
    data['FestivalIncentiveFund'] = festivalIncentiveFund;
    data['FMCG'] = fmcg;
    data['SalaryAmount'] = salaryAmount;
    data['LevelNo'] = levelNo;
    data['SlabName'] = slabName;
    data['TotalTeamSIP'] = totalTeamSIP;
    data['Entrydate'] = entrydate;
    data['PayMonthCount'] = payMonthCount;
    return data;
  }
}
