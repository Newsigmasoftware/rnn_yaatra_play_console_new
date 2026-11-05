class ComposeMessageResponseModel {
  bool? status;
  String? message;

  ComposeMessageResponseModel({this.status, this.message});

  ComposeMessageResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'] ?? json['Status'];
    message = json['message'] ?? json['Message'] ?? json['msg'] ?? json['Msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}
