class LIPIncomeModel {
  bool? success;
  List<Data>? data;
  int? count;

  LIPIncomeModel({this.success, this.data, this.count});

  LIPIncomeModel.fromJson(Map<String, dynamic> json) {
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
  String? id;
  String? userId;
  String? userName;
  String? turnOver;
  String? percentage;
  String? totalIncome;
  String? totalUserSIPAmount;
  String? sIPRate;
  String? teamSIP;
  String? income;
  String? entrydate;

  Data(
      {this.id,
        this.userId,
        this.userName,
        this.turnOver,
        this.percentage,
        this.totalIncome,
        this.totalUserSIPAmount,
        this.sIPRate,
        this.teamSIP,
        this.income,
        this.entrydate});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    userId = json['UserId'];
    userName = json['UserName'];
    turnOver = json['TurnOver'];
    percentage = json['Percentage'];
    totalIncome = json['TotalIncome'];
    totalUserSIPAmount = json['TotalUserSIPAmount'];
    sIPRate = json['SIPRate'];
    teamSIP = json['TeamSIP'];
    income = json['Income'];
    entrydate = json['Entrydate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['UserId'] = userId;
    data['UserName'] = userName;
    data['TurnOver'] = turnOver;
    data['Percentage'] = percentage;
    data['TotalIncome'] = totalIncome;
    data['TotalUserSIPAmount'] = totalUserSIPAmount;
    data['SIPRate'] = sIPRate;
    data['TeamSIP'] = teamSIP;
    data['Income'] = income;
    data['Entrydate'] = entrydate;
    return data;
  }
}
