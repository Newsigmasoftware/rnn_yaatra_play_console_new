class GetDepositRequestListResponseModel {
  List<DepositRequestListData>? data;

  GetDepositRequestListResponseModel({this.data});

  GetDepositRequestListResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <DepositRequestListData>[];
      json['data'].forEach((v) {
        data!.add(DepositRequestListData.fromJson(v));
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

class DepositRequestListData {
  String? id;
  String? userId;
  String? status;
  String? amount;
  String? entryDate;
  String? approveDate;
  String? transactionId;
  String? dollerPrice;
  String? chainId;
  String? networkName;
  String? coinPrice;
  String? fromAccount;
  String? toAccount;
  String? transferCoin;
  String? depositDate;
  String? reciept;

  DepositRequestListData({
    this.id,
    this.userId,
    this.status,
    this.amount,
    this.entryDate,
    this.approveDate,
    this.transactionId,
    this.dollerPrice,
    this.chainId,
    this.networkName,
    this.coinPrice,
    this.fromAccount,
    this.toAccount,
    this.transferCoin,
    this.depositDate,
    this.reciept,
  });

  DepositRequestListData.fromJson(Map<String, dynamic> json) {
    id = json['Id']?.toString();
    userId = json['UserId']?.toString();
    status = json['Status']?.toString();
    amount = json['Amount']?.toString();
    entryDate = json['EntryDate']?.toString();
    approveDate = json['ApproveDate']?.toString();
    transactionId = json['TransactionId']?.toString();
    dollerPrice = json['DollerPrice']?.toString();
    chainId = json['ChainId']?.toString();
    networkName = json['NetworkName']?.toString();
    coinPrice = json['CoinPrice']?.toString();
    fromAccount = json['FromAccount']?.toString();
    toAccount = json['ToAccount']?.toString();
    transferCoin = json['TransferCoin']?.toString();
    depositDate = json['DepositDate']?.toString();
    reciept = json['Reciept']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['UserId'] = userId;
    data['Status'] = status;
    data['Amount'] = amount;
    data['EntryDate'] = entryDate;
    data['ApproveDate'] = approveDate;
    data['TransactionId'] = transactionId;
    data['DollerPrice'] = dollerPrice;
    data['ChainId'] = chainId;
    data['NetworkName'] = networkName;
    data['CoinPrice'] = coinPrice;
    data['FromAccount'] = fromAccount;
    data['ToAccount'] = toAccount;
    data['TransferCoin'] = transferCoin;
    data['DepositDate'] = depositDate;
    data['Reciept'] = reciept;
    return data;
  }
}
