class GetDownLineModel {
  bool? success;
  List<DownLineData>? data;
  int? count;

  GetDownLineModel({this.success, this.data, this.count});

  GetDownLineModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <DownLineData>[];
      json['data'].forEach((v) {
        data!.add(DownLineData.fromJson(v));
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

class DownLineData {
  int? id;
  String? userId;
  String? userName;
  String? sponsorId;
  String? sponsorName;
  String? direction;
  String? parentUserId;
  String? parentName;
  String? topupAmount;
  String? email;
  String? mobile;
  String? photo;
  String? activationDate;
  String? regDate;
  String? totalActiveDirect;
  String? totalActiveTeam;
  String? totalDeactiveDirect;
  String? totalDeactiveTeam;
  String? status;

  DownLineData(
      {this.id,
      this.userId,
      this.userName,
      this.sponsorId,
      this.sponsorName,
      this.direction,
      this.parentUserId,
      this.parentName,
      this.topupAmount,
      this.email,
      this.mobile,
      this.photo,
      this.activationDate,
      this.regDate,
      this.totalActiveDirect,
      this.totalActiveTeam,
      this.totalDeactiveDirect,
      this.totalDeactiveTeam,
      this.status});

  DownLineData.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    userId = json['UserId'];
    userName = json['UserName'];
    sponsorId = json['SponsorId'];
    sponsorName = json['SponsorName'];
    direction = json['Direction'];
    parentUserId = json['ParentUserId'];
    parentName = json['ParentName'];
    topupAmount = json['TopupAmount'];
    email = json['Email'];
    mobile = json['Mobile'];
    photo = json['Photo'];
    activationDate = json['ActivationDate'];
    regDate = json['RegDate'];
    totalActiveDirect = json['TotalActiveDirect'];
    totalActiveTeam = json['TotalActiveTeam'];
    totalDeactiveDirect = json['TotalDeactiveDirect'];
    totalDeactiveTeam = json['TotalDeactiveTeam'];
    status = json['Status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['UserId'] = userId;
    data['UserName'] = userName;
    data['SponsorId'] = sponsorId;
    data['SponsorName'] = sponsorName;
    data['Direction'] = direction;
    data['ParentUserId'] = parentUserId;
    data['ParentName'] = parentName;
    data['TopupAmount'] = topupAmount;
    data['Email'] = email;
    data['Mobile'] = mobile;
    data['Photo'] = photo;
    data['ActivationDate'] = activationDate;
    data['RegDate'] = regDate;
    data['TotalActiveDirect'] = totalActiveDirect;
    data['TotalActiveTeam'] = totalActiveTeam;
    data['TotalDeactiveDirect'] = totalDeactiveDirect;
    data['TotalDeactiveTeam'] = totalDeactiveTeam;
    data['Status'] = status;
    return data;
  }
}
