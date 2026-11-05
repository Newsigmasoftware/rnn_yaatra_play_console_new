class GetTopupListResponseModel {
  bool? success;
  List<TopupListData>? data;

  GetTopupListResponseModel({this.success, this.data});

  GetTopupListResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <TopupListData>[];
      json['data'].forEach((v) {
        data!.add(TopupListData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TopupListData {
  String? id;
  String? userId;
  String? userName;
  String? topupUserId;
  String? topupUserName;
  String? topupAmount;
  String? entryDate;
  String? planName;
  String? topupType;

  TopupListData({
    this.id,
    this.userId,
    this.userName,
    this.topupUserId,
    this.topupUserName,
    this.topupAmount,
    this.entryDate,
    this.planName,
    this.topupType,
  });

  TopupListData.fromJson(Map<String, dynamic> json) {
    id = json['Id']?.toString();
    userId = json['UserId']?.toString();
    userName = json['UserName']?.toString();
    topupUserId = json['TopupUserId']?.toString();
    topupUserName = json['TopupUserName']?.toString();
    topupAmount = json['TopupAmount']?.toString();
    entryDate = json['EntryDate']?.toString();
    planName = json['PlanName']?.toString();
    topupType = json['TopupType']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['UserId'] = userId;
    data['UserName'] = userName;
    data['TopupUserId'] = topupUserId;
    data['TopupUserName'] = topupUserName;
    data['TopupAmount'] = topupAmount;
    data['EntryDate'] = entryDate;
    data['PlanName'] = planName;
    data['TopupType'] = topupType;
    return data;
  }
}
