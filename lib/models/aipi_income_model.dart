class AIPIncomeModel {
  bool? success;
  List<Data>? data;
  int? count;

  AIPIncomeModel({this.success, this.data, this.count});

  AIPIncomeModel.fromJson(Map<String, dynamic> json) {
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
  String? levelNo;
  String? leftSIP;
  String? rightSIP;
  String? matchingSIP;
  String? sIPRate;
  String? income;
  String? entrydate;

  Data(
      {this.id,
        this.userId,
        this.userName,
        this.levelNo,
        this.leftSIP,
        this.rightSIP,
        this.matchingSIP,
        this.sIPRate,
        this.income,
        this.entrydate});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    userId = json['UserId'];
    userName = json['UserName'];
    levelNo = json['LevelNo'];
    leftSIP = json['LeftSIP'];
    rightSIP = json['RightSIP'];
    matchingSIP = json['MatchingSIP'];
    sIPRate = json['SIPRate'];
    income = json['Income'];
    entrydate = json['Entrydate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['UserId'] = userId;
    data['UserName'] = userName;
    data['LevelNo'] = levelNo;
    data['LeftSIP'] = leftSIP;
    data['RightSIP'] = rightSIP;
    data['MatchingSIP'] = matchingSIP;
    data['SIPRate'] = sIPRate;
    data['Income'] = income;
    data['Entrydate'] = entrydate;
    return data;
  }
}
