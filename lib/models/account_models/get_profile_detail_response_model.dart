class GetProfileDetailResponseModel {
  GetProfileDetailResponseModelItem? data;

  GetProfileDetailResponseModel({this.data});

  GetProfileDetailResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null && json['data'] is Map<String, dynamic>) {
      data = GetProfileDetailResponseModelItem.fromJson(json['data']);
    } else {
      data = null;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class GetProfileDetailResponseModelItem {
  int? id;
  String? userid;
  String? nomineeName;
  String? nomineeRelation;
  String? sponsorid;
  String? sponsorname;
  String? password;
  dynamic confirmPassword;
  dynamic oldpassword;
  dynamic newpassword;
  dynamic role;
  String? username;
  String? gender;
  String? mobile;
  String? email;
  dynamic transPass;
  String? adharNo;
  String? panNo;
  String? parentuserid;
  String? parentname;
  int? standingposition;
  dynamic countryId;
  int? status;
  String? activationdate;
  String? userRank;
  String? entrydate;
  String? chainid;
  String? networkname;
  String? joiningamount;
  dynamic joiningbnb;
  dynamic price;
  String? fromaddress;
  String? toaddress;
  String? transactionId;
  dynamic error;
  String? address;
  dynamic otp;
  dynamic clientip;
  dynamic serverip;
  dynamic otpid;
  dynamic regtype;
  dynamic publickey;
  dynamic privatekey;
  // dynamic json;
  dynamic keystorepassword;
  dynamic read;
  dynamic pid;
  dynamic msg;
  dynamic file;
  String? photo;
  dynamic dt;
  dynamic dt1;
  dynamic dt2;
  dynamic dt3;
  dynamic chainList;
  dynamic spList;
  dynamic selectListItems;
  String? accHolderName;
  String? bankName;
  String? branchName;
  String? accountNo;
  String? ifsccode;
  dynamic upiId;
  dynamic qRImage;
  dynamic qR;
  dynamic countryNameId;
  dynamic stateId;
  dynamic cityId;
  dynamic confirmtransPass;
  dynamic dt4;
  dynamic dt5;
  dynamic dt6;
  dynamic dt7;
  dynamic dt8;
  dynamic dt9;

  GetProfileDetailResponseModelItem(
      {this.id,
      this.userid,
      this.nomineeName,
      this.nomineeRelation,
      this.sponsorid,
      this.sponsorname,
      this.password,
      this.confirmPassword,
      this.oldpassword,
      this.newpassword,
      this.role,
      this.username,
      this.gender,
      this.mobile,
      this.email,
      this.transPass,
      this.adharNo,
      this.panNo,
      this.parentuserid,
      this.parentname,
      this.standingposition,
      this.countryId,
      this.status,
      this.activationdate,
      this.userRank,
      this.entrydate,
      this.chainid,
      this.networkname,
      this.joiningamount,
      this.joiningbnb,
      this.price,
      this.fromaddress,
      this.toaddress,
      this.transactionId,
      this.error,
      this.address,
      this.otp,
      this.clientip,
      this.serverip,
      this.otpid,
      this.regtype,
      this.publickey,
      this.privatekey,
      // this.json,
      this.keystorepassword,
      this.read,
      this.pid,
      this.msg,
      this.file,
      this.photo,
      this.dt,
      this.dt1,
      this.dt2,
      this.dt3,
      this.chainList,
      this.spList,
      this.selectListItems,
      this.accHolderName,
      this.bankName,
      this.branchName,
      this.accountNo,
      this.ifsccode,
      this.upiId,
      this.qRImage,
      this.qR,
      this.countryNameId,
      this.stateId,
      this.cityId,
      this.confirmtransPass,
      this.dt4,
      this.dt5,
      this.dt6,
      this.dt7,
      this.dt8,
      this.dt9});

  GetProfileDetailResponseModelItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userid = json['userid'];
    nomineeName = json['NomineeName'];
    nomineeRelation = json['NomineeRelation'];
    sponsorid = json['sponsorid'];
    sponsorname = json['sponsorname'];
    password = json['password'];
    confirmPassword = json['confirm_password'];
    oldpassword = json['oldpassword'];
    newpassword = json['newpassword'];
    role = json['role'];
    username = json['username'];
    gender = json['gender'];
    mobile = json['mobile'];
    email = json['email'];
    transPass = json['transPass'];
    adharNo = json['AdharNo'];
    panNo = json['PanNo'];
    parentuserid = json['parentuserid'];
    parentname = json['parentname'];
    standingposition = json['standingposition'];
    countryId = json['CountryId'];
    status = json['status'];
    activationdate = json['activationdate'];
    userRank = json['UserRank'];
    entrydate = json['entrydate'];
    chainid = json['chainid'];
    networkname = json['networkname'];
    joiningamount = json['joiningamount'];
    joiningbnb = json['joiningbnb'];
    price = json['price'];
    fromaddress = json['fromaddress'];
    toaddress = json['toaddress'];
    transactionId = json['transactionId'];
    error = json['error'];
    address = json['Address'];
    otp = json['otp'];
    clientip = json['clientip'];
    serverip = json['serverip'];
    otpid = json['otpid'];
    regtype = json['regtype'];
    publickey = json['publickey'];
    privatekey = json['privatekey'];
    // json = json['json'];
    keystorepassword = json['keystorepassword'];
    read = json['read'];
    pid = json['pid'];
    msg = json['msg'];
    file = json['file'];
    photo = json['photo'];
    dt = json['dt'];
    dt1 = json['dt1'];
    dt2 = json['dt2'];
    dt3 = json['dt3'];
    chainList = json['chainList'];
    spList = json['spList'];
    selectListItems = json['selectListItems'];
    accHolderName = json['AccHolderName'];
    bankName = json['BankName'];
    branchName = json['BranchName'];
    accountNo = json['AccountNo'];
    ifsccode = json['Ifsccode'];
    upiId = json['Upi_Id'];
    qRImage = json['QR_Image'];
    qR = json['QR'];
    countryNameId = json['CountryNameId'];
    stateId = json['StateId'];
    cityId = json['CityId'];
    confirmtransPass = json['confirmtransPass'];
    dt4 = json['dt4'];
    dt5 = json['dt5'];
    dt6 = json['dt6'];
    dt7 = json['dt7'];
    dt8 = json['dt8'];
    dt9 = json['dt9'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userid'] = userid;
    data['NomineeName'] = nomineeName;
    data['NomineeRelation'] = nomineeRelation;
    data['sponsorid'] = sponsorid;
    data['sponsorname'] = sponsorname;
    data['password'] = password;
    data['confirm_password'] = confirmPassword;
    data['oldpassword'] = oldpassword;
    data['newpassword'] = newpassword;
    data['role'] = role;
    data['username'] = username;
    data['gender'] = gender;
    data['mobile'] = mobile;
    data['email'] = email;
    data['transPass'] = transPass;
    data['AdharNo'] = adharNo;
    data['PanNo'] = panNo;
    data['parentuserid'] = parentuserid;
    data['parentname'] = parentname;
    data['standingposition'] = standingposition;
    data['CountryId'] = countryId;
    data['status'] = status;
    data['activationdate'] = activationdate;
    data['UserRank'] = userRank;
    data['entrydate'] = entrydate;
    data['chainid'] = chainid;
    data['networkname'] = networkname;
    data['joiningamount'] = joiningamount;
    data['joiningbnb'] = joiningbnb;
    data['price'] = price;
    data['fromaddress'] = fromaddress;
    data['toaddress'] = toaddress;
    data['transactionId'] = transactionId;

    data['error'] = error;
    data['Address'] = address;
    data['otp'] = otp;
    data['clientip'] = clientip;
    data['serverip'] = serverip;
    data['otpid'] = otpid;
    data['regtype'] = regtype;
    data['publickey'] = publickey;
    data['privatekey'] = privatekey;
    // data['json'] = json;
    data['keystorepassword'] = keystorepassword;
    data['read'] = read;
    data['pid'] = pid;
    data['msg'] = msg;
    data['file'] = file;
    data['photo'] = photo;
    data['dt'] = dt;
    data['dt1'] = dt1;
    data['dt2'] = dt2;
    data['dt3'] = dt3;
    data['chainList'] = chainList;
    data['spList'] = spList;
    data['selectListItems'] = selectListItems;
    data['AccHolderName'] = accHolderName;
    data['BankName'] = bankName;
    data['BranchName'] = branchName;
    data['AccountNo'] = accountNo;
    data['Ifsccode'] = ifsccode;
    data['Upi_Id'] = upiId;
    data['QR_Image'] = qRImage;
    data['QR'] = qR;
    data['CountryNameId'] = countryNameId;
    data['StateId'] = stateId;
    data['CityId'] = cityId;
    data['confirmtransPass'] = confirmtransPass;
    data['dt4'] = dt4;
    data['dt5'] = dt5;
    data['dt6'] = dt6;
    data['dt7'] = dt7;
    data['dt8'] = dt8;
    data['dt9'] = dt9;
    return data;
  }
}
