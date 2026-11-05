class GetBankListResponseModel {
  List<GetBankListResponseModelItem>? data;

  GetBankListResponseModel({this.data});

  GetBankListResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <GetBankListResponseModelItem>[];
      json['data'].forEach((v) {
        data!.add(GetBankListResponseModelItem.fromJson(v));
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

class GetBankListResponseModelItem {
  String? id;
  String? name;

  GetBankListResponseModelItem({this.id, this.name});

  GetBankListResponseModelItem.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['Name'];
  }

  static const String idKey = "Id";
  static const String nameKey = "Name";

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['Name'] = name;
    return data;
  }
}
