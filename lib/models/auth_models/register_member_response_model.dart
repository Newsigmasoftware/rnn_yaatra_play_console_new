class RegisterMemberResponesModel {
  bool? success;
  String? message;
  RegisterMemberResponesModelItem? data;

  RegisterMemberResponesModel({this.success, this.message, this.data});

  RegisterMemberResponesModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? RegisterMemberResponesModelItem.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class RegisterMemberResponesModelItem {
  String? id;
  String? userid;
  String? username;
  String? regtype;
  String? pass;
  String? transPass;

  RegisterMemberResponesModelItem(
      {this.id,
      this.userid,
      this.username,
      this.regtype,
      this.pass,
      this.transPass});

  RegisterMemberResponesModelItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userid = json['userid'];
    username = json['username'];
    regtype = json['regtype'];
    pass = json['Pass'];
    transPass = json['TransPass'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userid'] = userid;
    data['username'] = username;
    data['regtype'] = regtype;
    data['Pass'] = pass;
    data['TransPass'] = transPass;
    return data;
  }
}
