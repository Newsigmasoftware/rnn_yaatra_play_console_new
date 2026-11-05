class GetTransPasswordResponseModel {
  bool? success;
  TransPasswordData? data;

  GetTransPasswordResponseModel({this.success, this.data});

  GetTransPasswordResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'] == true || json['success'] == 'true' || json['status'] == true || json['status'] == 'true';
    if (json['data'] != null && json['data'] is Map<String, dynamic>) {
      data = TransPasswordData.fromJson(json['data']);
    } else {
      data = null;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class TransPasswordData {
  String? transPass;
  String? message;

  TransPasswordData({this.transPass, this.message});

  TransPasswordData.fromJson(Map<String, dynamic> json) {
    transPass = json['transPass']?.toString();
    message = json['Message']?.toString() ?? json['message']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['transPass'] = transPass;
    data['Message'] = message;
    return data;
  }
}
