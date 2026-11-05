class TopupUserWithWalletResponseModel {
  String? id;
  String? msg;

  TopupUserWithWalletResponseModel({this.id, this.msg});

  TopupUserWithWalletResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString() ?? json['Id']?.toString();
    msg = json['msg']?.toString() ?? json['message']?.toString() ?? json['Msg']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['msg'] = msg;
    return data;
  }
}
