class VerifySponsorResponseModel {
  VerifySponsorResponseModelItem? data;

  VerifySponsorResponseModel({this.data});

  VerifySponsorResponseModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ?  VerifySponsorResponseModelItem.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class VerifySponsorResponseModelItem {
  String? userId;
  String? username;
  String? email;
  String? parentUserId;
  String? parentName;
  String? pid;
  String? message;
  String? transPassword;
  int? standingPosition;
  List<Plans>? plans;

  VerifySponsorResponseModelItem(
      {this.userId,
      this.username,
      this.email,
      this.parentUserId,
      this.parentName,
      this.pid,
      this.message,
      this.transPassword,
      this.standingPosition,
      this.plans});

  VerifySponsorResponseModelItem.fromJson(Map<String, dynamic> json) {
    userId = json['UserId'];
    username = json['Username'];
    email = json['Email'];
    parentUserId = json['ParentUserId'];
    parentName = json['ParentName'];
    pid = json['Pid'];
    message = json['Message'];
    transPassword = json['TransPassword'];
    standingPosition = json['StandingPosition'];
    if (json['Plans'] != null) {
      plans = <Plans>[];
      json['Plans'].forEach((v) {
        plans!.add(Plans.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['UserId'] = userId;
    data['Username'] = username;
    data['Email'] = email;
    data['ParentUserId'] = parentUserId;
    data['ParentName'] = parentName;
    data['Pid'] = pid;
    data['Message'] = message;
    data['TransPassword'] = transPassword;
    data['StandingPosition'] = standingPosition;
    if (plans != null) {
      data['Plans'] = plans!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Plans {
  int? id;
  String? name;
  dynamic amount;
  dynamic planName;
  dynamic entryDate;

  Plans({this.id, this.name, this.amount, this.planName, this.entryDate});

  Plans.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['Name'];
    amount = json['Amount'];
    planName = json['PlanName'];
    entryDate = json['EntryDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['Name'] = name;
    data['Amount'] = amount;
    data['PlanName'] = planName;
    data['EntryDate'] = entryDate;
    return data;
  }
}
