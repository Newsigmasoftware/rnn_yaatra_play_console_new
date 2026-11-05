class SendMessageResponseModel {
  bool? status;
  String? message;
  List<SendMessageData>? data;

  SendMessageResponseModel({this.status, this.message, this.data});

  SendMessageResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <SendMessageData>[];
      json['data'].forEach((v) {
        data!.add(SendMessageData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SendMessageData {
  String? id;
  String? msgType;
  String? toUserId;
  String? toUserName;
  String? msgSubject;
  String? message;
  String? createdBy;

  SendMessageData({
    this.id,
    this.msgType,
    this.toUserId,
    this.toUserName,
    this.msgSubject,
    this.message,
    this.createdBy,
  });

  SendMessageData.fromJson(Map<String, dynamic> json) {
    id = json['Id']?.toString();
    msgType = json['Msg_Type']?.toString();
    toUserId = json['ToUser_Id']?.toString();
    toUserName = json['ToUserName']?.toString();
    msgSubject = json['Msg_Subject']?.toString();
    message = json['Message']?.toString();
    createdBy = json['CreatedBy']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['Msg_Type'] = msgType;
    data['ToUser_Id'] = toUserId;
    data['ToUserName'] = toUserName;
    data['Msg_Subject'] = msgSubject;
    data['Message'] = message;
    data['CreatedBy'] = createdBy;
    return data;
  }
}
