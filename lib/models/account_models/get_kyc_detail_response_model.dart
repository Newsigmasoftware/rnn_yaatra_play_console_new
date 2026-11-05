class GetKycDetailResponseModel {
  GetKycDetailResponseModelItemKyc? data;

  GetKycDetailResponseModel({this.data});

  GetKycDetailResponseModel.fromJson(Map<String, dynamic> json) {
    if(json['data'] != null){
      if(json['data']['kyc'] != null){
        data = GetKycDetailResponseModelItemKyc.fromJson(json['data']['kyc']);
      }else{
        data = null;
      }
    }else{
      data = null;
    }
    // data = json['data'] != null ? GetKycDetailResponseModelItem.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class GetKycDetailResponseModelItem {
  GetKycDetailResponseModelItemKyc? kyc;

  GetKycDetailResponseModelItem({this.kyc});

  GetKycDetailResponseModelItem.fromJson(Map<String, dynamic> json) {
    kyc = json['kyc'] != null ? GetKycDetailResponseModelItemKyc.fromJson(json['kyc']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (kyc != null) {
      data['kyc'] = kyc!.toJson();
    }
    return data;
  }
}

class GetKycDetailResponseModelItemKyc {
  dynamic userid;
  String? username;
  dynamic userPhoto;
  dynamic userPan;
  dynamic userAadhar;
  dynamic userAadharBack;
  dynamic userChequeBook;
  String? userPhotoName;
  String? userPanName;
  String? adharNo;
  String? userAadharName;
  String? userAadharBackName;
  String? userChequeBookName;
  String? astatus;
  String? phstatus;
  String? cstatus;
  String? pstatus;
  String? aBstatus;
  String? areject;
  String? phreject;
  String? creject;
  String? preject;
  String? aBreject;
  String? panno;
  dynamic aadharno;
  dynamic districtname;
  String? bankName;
  String? accountNo;
  String? accHolderName;
  String? ifsccode;
  String? dob;
  dynamic upiType;
  String? upiNo;
  String? qR;
  dynamic qrImage;
  String? branchName;
  dynamic upiId;
  String? joiningDate;

  GetKycDetailResponseModelItemKyc(
      {this.userid,
      this.username,
      this.userPhoto,
      this.userPan,
      this.userAadhar,
      this.userAadharBack,
      this.userChequeBook,
      this.userPhotoName,
      this.userPanName,
      this.adharNo,
      this.userAadharName,
      this.userAadharBackName,
      this.userChequeBookName,
      this.astatus,
      this.phstatus,
      this.cstatus,
      this.pstatus,
      this.aBstatus,
      this.areject,
      this.phreject,
      this.creject,
      this.preject,
      this.aBreject,
      this.panno,
      this.aadharno,
      this.districtname,
      this.bankName,
      this.accountNo,
      this.accHolderName,
      this.ifsccode,
      this.dob,
      this.upiType,
      this.upiNo,
      this.qR,
      this.qrImage,
      this.branchName,
      this.upiId,
      this.joiningDate});

  GetKycDetailResponseModelItemKyc.fromJson(Map<String, dynamic> json) {
    userid = json['userid'];
    username = json['username'];
    userPhoto = json['User_Photo'];
    userPan = json['User_Pan'];
    userAadhar = json['User_Aadhar'];
    userAadharBack = json['User_AadharBack'];
    userChequeBook = json['User_ChequeBook'];
    userPhotoName = json['User_PhotoName'];
    userPanName = json['User_PanName'];
    adharNo = json['AdharNo'];
    userAadharName = json['User_AadharName'];
    userAadharBackName = json['User_AadharBackName'];
    userChequeBookName = json['User_ChequeBookName'];
    astatus = json['Astatus'];
    phstatus = json['Phstatus'];
    cstatus = json['Cstatus'];
    pstatus = json['Pstatus'];
    aBstatus = json['ABstatus'];
    areject = json['Areject'];
    phreject = json['Phreject'];
    creject = json['Creject'];
    preject = json['Preject'];
    aBreject = json['ABreject'];
    panno = json['panno'];
    aadharno = json['aadharno'];
    districtname = json['districtname'];
    bankName = json['BankName'];
    accountNo = json['AccountNo'];
    accHolderName = json['AccHolderName'];
    ifsccode = json['Ifsccode'];
    dob = json['dob'];
    upiType = json['UpiType'];
    upiNo = json['upiNo'];
    qR = json['QR'];
    qrImage = json['QrImage'];
    branchName = json['BranchName'];
    upiId = json['Upi_Id'];
    joiningDate = json['JoiningDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userid'] = userid;
    data['username'] = username;
    data['User_Photo'] = userPhoto;
    data['User_Pan'] = userPan;
    data['User_Aadhar'] = userAadhar;
    data['User_AadharBack'] = userAadharBack;
    data['User_ChequeBook'] = userChequeBook;
    data['User_PhotoName'] = userPhotoName;
    data['User_PanName'] = userPanName;
    data['AdharNo'] = adharNo;
    data['User_AadharName'] = userAadharName;
    data['User_AadharBackName'] = userAadharBackName;
    data['User_ChequeBookName'] = userChequeBookName;
    data['Astatus'] = astatus;
    data['Phstatus'] = phstatus;
    data['Cstatus'] = cstatus;
    data['Pstatus'] = pstatus;
    data['ABstatus'] = aBstatus;
    data['Areject'] = areject;
    data['Phreject'] = phreject;
    data['Creject'] = creject;
    data['Preject'] = preject;
    data['ABreject'] = aBreject;
    data['panno'] = panno;
    data['aadharno'] = aadharno;
    data['districtname'] = districtname;
    data['BankName'] = bankName;
    data['AccountNo'] = accountNo;
    data['AccHolderName'] = accHolderName;
    data['Ifsccode'] = ifsccode;
    data['dob'] = dob;
    data['UpiType'] = upiType;
    data['upiNo'] = upiNo;
    data['QR'] = qR;
    data['QrImage'] = qrImage;
    data['BranchName'] = branchName;
    data['Upi_Id'] = upiId;
    data['JoiningDate'] = joiningDate;
    return data;
  }
}
