class ChangePasswordResponseModel {
  bool? status;
  String? message;

  ChangePasswordResponseModel({this.status, this.message});

  ChangePasswordResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'] ?? json['Status'] ?? json['success'] ?? json['Success'];
    message = json['message'] ?? json['Message'] ?? json['msg'] ?? json['Msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}
