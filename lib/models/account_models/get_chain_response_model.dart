class GetChainResponseModel {
  List<ChainData>? data;

  GetChainResponseModel({this.data});

  GetChainResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ChainData>[];
      json['data'].forEach((v) {
        data!.add(ChainData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataMap = <String, dynamic>{};
    if (data != null) {
      dataMap['data'] = data!.map((v) => v.toJson()).toList();
    }
    return dataMap;
  }
}

class ChainData {
  int? id;
  String? networkName;
  String? rPCUrl;
  String? chainId;
  String? symbol;
  String? blockExplorerUrl;
  int? decimalDigits;
  String? entryDate;
  String? publicKey;
  String? privateKey;
  String? value;
  String? icon;
  String? providerUrl;
  String? qRImage;
  dynamic file;

  ChainData({
    this.id,
    this.networkName,
    this.rPCUrl,
    this.chainId,
    this.symbol,
    this.blockExplorerUrl,
    this.decimalDigits,
    this.entryDate,
    this.publicKey,
    this.privateKey,
    this.value,
    this.icon,
    this.providerUrl,
    this.qRImage,
    this.file,
  });

  ChainData.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    networkName = json['NetworkName'];
    rPCUrl = json['RPCUrl'];
    chainId = json['ChainId'];
    symbol = json['Symbol'];
    blockExplorerUrl = json['BlockExplorerUrl'];
    decimalDigits = json['DecimalDigits'];
    entryDate = json['EntryDate'];
    publicKey = json['PublicKey'];
    privateKey = json['PrivateKey'];
    value = json['Value'];
    icon = json['Icon'];
    providerUrl = json['ProviderUrl'];
    qRImage = json['QRImage'];
    file = json['file'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['NetworkName'] = networkName;
    data['RPCUrl'] = rPCUrl;
    data['ChainId'] = chainId;
    data['Symbol'] = symbol;
    data['BlockExplorerUrl'] = blockExplorerUrl;
    data['DecimalDigits'] = decimalDigits;
    data['EntryDate'] = entryDate;
    data['PublicKey'] = publicKey;
    data['PrivateKey'] = privateKey;
    data['Value'] = value;
    data['Icon'] = icon;
    data['ProviderUrl'] = providerUrl;
    data['QRImage'] = qRImage;
    data['file'] = file;
    return data;
  }
}
