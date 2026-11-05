class GetFundBalanceResponseModel {
  List<FundBalanceData>? data;

  GetFundBalanceResponseModel({this.data});

  GetFundBalanceResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <FundBalanceData>[];
      json['data'].forEach((v) {
        data!.add(FundBalanceData.fromJson(v));
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

class FundBalanceData {
  String? balance;

  FundBalanceData({this.balance});

  FundBalanceData.fromJson(Map<String, dynamic> json) {
    balance = json['Balance']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Balance'] = balance;
    return data;
  }
}
