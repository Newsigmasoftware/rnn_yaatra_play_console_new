class GetTransactionDetailResponseModel {
  List<TransactionDetailItem>? data;

  GetTransactionDetailResponseModel({this.data});

  GetTransactionDetailResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <TransactionDetailItem>[];
      json['data'].forEach((v) {
        data!.add(TransactionDetailItem.fromJson(v));
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

class TransactionDetailItem {
  String? id;
  String? userId;
  String? crAmount;
  String? drAmount;
  String? transactionType;
  String? remark;
  String? entryDate;
  String? preWallet;
  String? amount;
  String? afterWallet;
  String? displayAmount;

  TransactionDetailItem({
    this.id,
    this.userId,
    this.crAmount,
    this.drAmount,
    this.transactionType,
    this.remark,
    this.entryDate,
    this.preWallet,
    this.amount,
    this.afterWallet,
    this.displayAmount,
  });

  TransactionDetailItem.fromJson(Map<String, dynamic> json) {
    id = json['Id']?.toString();
    userId = json['UserId']?.toString();
    crAmount = json['CrAmount']?.toString();
    drAmount = json['DrAmount']?.toString();
    transactionType = json['TransactionType']?.toString();
    remark = json['Remark']?.toString();
    entryDate = json['EntryDate']?.toString();
    preWallet = json['PreWallet']?.toString();
    amount = json['Amount']?.toString();
    afterWallet = json['AfterWallet']?.toString();
    displayAmount = json['DisplayAmount']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['UserId'] = userId;
    data['CrAmount'] = crAmount;
    data['DrAmount'] = drAmount;
    data['TransactionType'] = transactionType;
    data['Remark'] = remark;
    data['EntryDate'] = entryDate;
    data['PreWallet'] = preWallet;
    data['Amount'] = amount;
    data['AfterWallet'] = afterWallet;
    data['DisplayAmount'] = displayAmount;
    return data;
  }
}
