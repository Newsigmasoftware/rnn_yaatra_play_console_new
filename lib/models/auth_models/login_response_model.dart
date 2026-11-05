class LoginResponseModel {
  int? res;
  String? message;
  LoginResponseModelItem? data;

  LoginResponseModel({this.res, this.message, this.data});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    res = json['res'];
    message = json['message'];
    data = json['data'] != null ? LoginResponseModelItem.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['res'] = res;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class LoginResponseModelItem {
  String? userid;
  String? username;
  String? role;
  String? photo;
  String? token;
  int? expiresIn;

  LoginResponseModelItem(
      {this.userid,
      this.username,
      this.role,
      this.photo,
      this.token,
      this.expiresIn});

  LoginResponseModelItem.fromJson(Map<String, dynamic> json) {
    userid = json['userid'];
    username = json['username'];
    role = json['role'];
    photo = json['photo'];
    token = json['token'];
    expiresIn = json['expiresIn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userid'] = userid;
    data['username'] = username;
    data['role'] = role;
    data['photo'] = photo;
    data['token'] = token;
    data['expiresIn'] = expiresIn;
    return data;
  }
}
