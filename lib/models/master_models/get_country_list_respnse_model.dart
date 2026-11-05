class GetCountryListResponseModel {
  List<GetCountryListResponseModelItem>? data;

  GetCountryListResponseModel({this.data});

  GetCountryListResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <GetCountryListResponseModelItem>[];
      json['data'].forEach((v) {
        data!.add(GetCountryListResponseModelItem.fromJson(v));
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

class GetCountryListResponseModelItem {
  String? id;
  String? name;

  GetCountryListResponseModelItem({this.id, this.name});

  GetCountryListResponseModelItem.fromJson(Map<String, dynamic> json) {
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