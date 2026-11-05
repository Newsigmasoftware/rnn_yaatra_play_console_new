class RankChartModel {
  bool? success;
  List<Data>? data;
  int? count;

  RankChartModel({this.success, this.data, this.count});

  RankChartModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
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

class Data {
  String? rankName;
  String? targetTeam;
  String? leftTeam;
  String? rightTeam;
  String? salaryAmount;
  String? entryDate;
  String? status;
  String? statusMobile;

  Data(
      {this.rankName,
        this.targetTeam,
        this.leftTeam,
        this.rightTeam,
        this.salaryAmount,
        this.entryDate,
        this.status,
        this.statusMobile});

  Data.fromJson(Map<String, dynamic> json) {
    rankName = json['RankName'];
    targetTeam = json['TargetTeam'];
    leftTeam = json['LeftTeam'];
    rightTeam = json['RightTeam'];
    salaryAmount = json['SalaryAmount'];
    entryDate = json['EntryDate'];
    status = json['Status'];
    statusMobile = json['StatusMobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['RankName'] = rankName;
    data['TargetTeam'] = targetTeam;
    data['LeftTeam'] = leftTeam;
    data['RightTeam'] = rightTeam;
    data['SalaryAmount'] = salaryAmount;
    data['EntryDate'] = entryDate;
    data['Status'] = status;
    data['StatusMobile'] = statusMobile;
    return data;
  }
}
