class GetTeamModel {
  bool? success;
  List<Data>? data;
  int? count;

  GetTeamModel({this.success, this.data, this.count});

  GetTeamModel.fromJson(Map<String, dynamic> json) {
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
  int? id;
  String? userId;
  String? userName;
  String? sponsorId;
  String? sponsorName;
  String? topupAmount;
  String? photo;
  String? mobile;
  String? email;
  String? status;
  String? activationDate;
  String? regDate;
  String? totalActiveDirect;
  String? totalDeactiveDirect;
  String? totalActiveTeam;
  String? totalDeactiveTeam;
  String? active;
  String? deactive;
  String? direction;
  String? level;
  String? placementUserId;

  Data(
      {this.id,
        this.userId,
        this.userName,
        this.sponsorId,
        this.sponsorName,
        this.direction,
        this.topupAmount,
        this.photo,
        this.mobile,
        this.email,
        this.status,
        this.activationDate,
        this.regDate,
        this.totalActiveDirect,
        this.totalDeactiveDirect,
        this.totalActiveTeam,
        this.totalDeactiveTeam,
        this.active,
        this.deactive,
        this.level,
        this.placementUserId});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    userId = json['UserId'];
    userName = json['UserName'];
    sponsorId = json['SponsorId'];
    sponsorName = json['SponsorName'];
    direction = json['Direction'];
    topupAmount = json['TopupAmount'];
    photo = json['Photo'];
    mobile = json['Mobile'];
    email = json['Email'];
    status = json['Status'];
    activationDate = json['ActivationDate'];
    regDate = json['RegDate'];
    totalActiveDirect = json['TotalActiveDirect'];
    totalDeactiveDirect = json['TotalDeactiveDirect'];
    totalActiveTeam = json['TotalActiveTeam'];
    totalDeactiveTeam = json['TotalDeactiveTeam'];
    active = json['active'];
    deactive = json['deactive'];
    direction = json['direction'];
    level = json['level'];
    placementUserId = json['PlacementUserId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['UserId'] = userId;
    data['UserName'] = userName;
    data['SponsorId'] = sponsorId;
    data['SponsorName'] = sponsorName;
    data['Direction'] = direction;
    data['TopupAmount'] = topupAmount;
    data['Photo'] = photo;
    data['Mobile'] = mobile;
    data['Email'] = email;
    data['Status'] = status;
    data['ActivationDate'] = activationDate;
    data['RegDate'] = regDate;
    data['TotalActiveDirect'] = totalActiveDirect;
    data['TotalDeactiveDirect'] = totalDeactiveDirect;
    data['TotalActiveTeam'] = totalActiveTeam;
    data['TotalDeactiveTeam'] = totalDeactiveTeam;
    data['active'] = active;
    data['deactive'] = deactive;
    data['direction'] = direction;
    data['level'] = level;
    data['PlacementUserId'] = placementUserId;
    return data;
  }
}
