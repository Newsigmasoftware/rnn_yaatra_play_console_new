class GetWithdrawalRequestListResponseModel {
  List<WithdrawalRequestListData>? data;

  GetWithdrawalRequestListResponseModel({this.data});

  GetWithdrawalRequestListResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <WithdrawalRequestListData>[];
      json['data'].forEach((v) {
        data!.add(WithdrawalRequestListData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class WithdrawalRequestListData {
  String? userId;
  String? userName;
  String? totalIncome;
  String? tdsPer;
  String? tds;
  String? adminPer;
  String? adminCharge;
  String? paybleAmount;
  String? bankName;
  String? fromdate;
  String? todate;
  String? status;
  String? transactionID;
  String? generateDate;
  String? paymentDate;
  String? mobile;
  String? accountNo;
  String? ifscCode;
  String? accountHolderName;

  WithdrawalRequestListData({
    this.userId,
    this.userName,
    this.totalIncome,
    this.tdsPer,
    this.tds,
    this.adminPer,
    this.adminCharge,
    this.paybleAmount,
    this.bankName,
    this.fromdate,
    this.todate,
    this.status,
    this.transactionID,
    this.generateDate,
    this.paymentDate,
    this.mobile,
    this.accountNo,
    this.ifscCode,
    this.accountHolderName,
  });

  WithdrawalRequestListData.fromJson(Map<String, dynamic> json) {
    userId = json['UserId']?.toString();
    userName = json['UserName']?.toString();
    totalIncome = json['TotalIncome']?.toString();
    tdsPer = json['TdsPer']?.toString();
    tds = json['Tds']?.toString();
    adminPer = json['AdminPer']?.toString();
    adminCharge = json['AdminCharge']?.toString();
    paybleAmount = json['PaybleAmount']?.toString();
    bankName = json['BankName']?.toString();
    fromdate = json['Fromdate']?.toString().trim();
    todate = json['Todate']?.toString().trim();
    status = json['Status']?.toString();
    transactionID = json['TransactionID']?.toString();
    generateDate = json['GenerateDate']?.toString().trim();
    paymentDate = json['PaymentDate']?.toString().trim();
    mobile = json['Mobile']?.toString();
    accountNo = json['AccountNo']?.toString();
    ifscCode = json['IfscCode']?.toString();
    accountHolderName = json['AccountHolderName']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['UserId'] = userId;
    data['UserName'] = userName;
    data['TotalIncome'] = totalIncome;
    data['TdsPer'] = tdsPer;
    data['Tds'] = tds;
    data['AdminPer'] = adminPer;
    data['AdminCharge'] = adminCharge;
    data['PaybleAmount'] = paybleAmount;
    data['BankName'] = bankName;
    data['Fromdate'] = fromdate;
    data['Todate'] = todate;
    data['Status'] = status;
    data['TransactionID'] = transactionID;
    data['GenerateDate'] = generateDate;
    data['PaymentDate'] = paymentDate;
    data['Mobile'] = mobile;
    data['AccountNo'] = accountNo;
    data['IfscCode'] = ifscCode;
    data['AccountHolderName'] = accountHolderName;
    return data;
  }
}
