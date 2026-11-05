class GetDashboardResponseModel {
  List<Dt3>? dt3;
  List<Dt4>? dt4;
  List<Dt5>? dt5;
  List<Dt5>? dt6;
  List<Dt5>? dt7;

  GetDashboardResponseModel({this.dt3, this.dt4, this.dt5, this.dt6, this.dt7});

  GetDashboardResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['dt3'] != null) {
      dt3 = <Dt3>[];
      json['dt3'].forEach((v) {
        dt3!.add(Dt3.fromJson(v));
      });
    }
    if (json['dt4'] != null) {
      dt4 = <Dt4>[];
      json['dt4'].forEach((v) {
        dt4!.add(Dt4.fromJson(v));
      });
    }
    if (json['dt5'] != null) {
      dt5 = <Dt5>[];
      json['dt5'].forEach((v) {
        dt5!.add(Dt5.fromJson(v));
      });
    }
    if (json['dt6'] != null) {
      dt6 = <Dt5>[];
      json['dt6'].forEach((v) {
        dt6!.add(Dt5.fromJson(v));
      });
    }
    if (json['dt7'] != null) {
      dt7 = <Dt5>[];
      json['dt7'].forEach((v) {
        dt7!.add(Dt5.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (dt3 != null) {
      data['dt3'] = dt3!.map((v) => v.toJson()).toList();
    }
    if (dt4 != null) {
      data['dt4'] = dt4!.map((v) => v.toJson()).toList();
    }
    if (dt5 != null) {
      data['dt5'] = dt5!.map((v) => v.toJson()).toList();
    }
    if (dt6 != null) {
      data['dt6'] = dt6!.map((v) => v.toJson()).toList();
    }
    if (dt7 != null) {
      data['dt7'] = dt7!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Dt3 {
  int? id;
  String? userId;
  String? sponsorId;
  dynamic sponsorName;
  String? userName;
  String? mobile;
  dynamic email;
  String? gender;
  String? parentUserId;
  dynamic parentName;
  int? standingPosition;
  int? status;
  dynamic userRank;
  String? activationDate;
  String? regDate;
  String? joiningAmount;
  dynamic chainId;
  dynamic networkName;
  dynamic fromAccount;
  dynamic toAccount;
  String? transactionId;
  String? password;
  String? photo;
  String? address;
  dynamic adharNo;
  dynamic panNo;
  String? transPassword;
  dynamic accountHolderName;
  dynamic accountNo;
  dynamic bankName;
  dynamic bankBranch;
  dynamic iFSC;
  String? nomineeName;
  String? nomineeRelation;
  bool? isKyc;
  int? isBlock;
  String? rankName;
  dynamic countryname;
  dynamic statename;
  dynamic cityname;
  dynamic dob;
  dynamic planName;
  dynamic userjoiningamount;
  String? joiningAmount1;
  String? pakageName;

  Dt3(
      {this.id,
      this.userId,
      this.sponsorId,
      this.sponsorName,
      this.userName,
      this.mobile,
      this.email,
      this.gender,
      this.parentUserId,
      this.parentName,
      this.standingPosition,
      this.status,
      this.userRank,
      this.activationDate,
      this.regDate,
      this.joiningAmount,
      this.chainId,
      this.networkName,
      this.fromAccount,
      this.toAccount,
      this.transactionId,
      this.password,
      this.photo,
      this.address,
      this.adharNo,
      this.panNo,
      this.transPassword,
      this.accountHolderName,
      this.accountNo,
      this.bankName,
      this.bankBranch,
      this.iFSC,
      this.nomineeName,
      this.nomineeRelation,
      this.isKyc,
      this.isBlock,
      this.rankName,
      this.countryname,
      this.statename,
      this.cityname,
      this.dob,
      this.planName,
      this.userjoiningamount,
      this.joiningAmount1,
      this.pakageName});

  Dt3.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    userId = json['UserId'];
    sponsorId = json['SponsorId'];
    sponsorName = json['SponsorName'];
    userName = json['UserName'];
    mobile = json['Mobile'];
    email = json['Email'];
    gender = json['Gender'];
    parentUserId = json['ParentUserId'];
    parentName = json['ParentName'];
    standingPosition = json['StandingPosition'];
    status = json['Status'];
    userRank = json['UserRank'];
    activationDate = json['ActivationDate'];
    regDate = json['RegDate'];
    joiningAmount = json['JoiningAmount'];
    chainId = json['ChainId'];
    networkName = json['NetworkName'];
    fromAccount = json['FromAccount'];
    toAccount = json['ToAccount'];
    transactionId = json['TransactionId'];
    password = json['Password'];
    photo = json['Photo'];
    address = json['Address'];
    adharNo = json['AdharNo'];
    panNo = json['PanNo'];
    transPassword = json['TransPassword'];
    accountHolderName = json['AccountHolderName'];
    accountNo = json['AccountNo'];
    bankName = json['BankName'];
    bankBranch = json['BankBranch'];
    iFSC = json['IFSC'];
    nomineeName = json['NomineeName'];
    nomineeRelation = json['NomineeRelation'];
    isKyc = json['IsKyc'];
    isBlock = json['IsBlock'];
    rankName = json['RankName'];
    countryname = json['countryname'];
    statename = json['statename'];
    cityname = json['cityname'];
    dob = json['dob'];
    planName = json['PlanName'];
    userjoiningamount = json['userjoiningamount'];
    joiningAmount1 = json['JoiningAmount1'];
    pakageName = json['PakageName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['UserId'] = userId;
    data['SponsorId'] = sponsorId;
    data['SponsorName'] = sponsorName;
    data['UserName'] = userName;
    data['Mobile'] = mobile;
    data['Email'] = email;
    data['Gender'] = gender;
    data['ParentUserId'] = parentUserId;
    data['ParentName'] = parentName;
    data['StandingPosition'] = standingPosition;
    data['Status'] = status;
    data['UserRank'] = userRank;
    data['ActivationDate'] = activationDate;
    data['RegDate'] = regDate;
    data['JoiningAmount'] = joiningAmount;
    data['ChainId'] = chainId;
    data['NetworkName'] = networkName;
    data['FromAccount'] = fromAccount;
    data['ToAccount'] = toAccount;
    data['TransactionId'] = transactionId;
    data['Password'] = password;
    data['Photo'] = photo;
    data['Address'] = address;
    data['AdharNo'] = adharNo;
    data['PanNo'] = panNo;
    data['TransPassword'] = transPassword;
    data['AccountHolderName'] = accountHolderName;
    data['AccountNo'] = accountNo;
    data['BankName'] = bankName;
    data['BankBranch'] = bankBranch;
    data['IFSC'] = iFSC;
    data['NomineeName'] = nomineeName;
    data['NomineeRelation'] = nomineeRelation;
    data['IsKyc'] = isKyc;
    data['IsBlock'] = isBlock;
    data['RankName'] = rankName;
    data['countryname'] = countryname;
    data['statename'] = statename;
    data['cityname'] = cityname;
    data['dob'] = dob;
    data['PlanName'] = planName;
    data['userjoiningamount'] = userjoiningamount;
    data['JoiningAmount1'] = joiningAmount1;
    data['PakageName'] = pakageName;
    return data;
  }
}

class Dt4 {
  String? userid;
  String? username;
  int? status;
  dynamic joiningamount;

  Dt4({this.userid, this.username, this.status, this.joiningamount});

  Dt4.fromJson(Map<String, dynamic> json) {
    userid = json['userid'];
    username = json['username'];
    status = json['status'];
    joiningamount = json['joiningamount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userid'] = userid;
    data['username'] = username;
    data['status'] = status;
    data['joiningamount'] = joiningamount;
    return data;
  }
}

class Dt5 {
  int? id;
  String? icon;
  String? name;
  String? value;
  String? url;

  Dt5({this.id, this.icon, this.name, this.value, this.url});

  Dt5.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    icon = json['Icon'];
    name = json['name'];
    value = json['value'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['Icon'] = icon;
    data['name'] = name;
    data['value'] = value;
    data['url'] = url;
    return data;
  }
}
