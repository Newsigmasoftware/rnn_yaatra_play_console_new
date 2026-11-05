class GetMaxPlanResponseModel {
  bool? status;
  String? message;
  List<MaxPlanData>? data;

  GetMaxPlanResponseModel({this.status, this.message, this.data});

  GetMaxPlanResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <MaxPlanData>[];
      json['data'].forEach((v) {
        data!.add(MaxPlanData.fromJson(v));
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

class MaxPlanData {
  String? id;
  String? planName;
  String? amount;
  String? entryDate;

  MaxPlanData({this.id, this.planName, this.amount, this.entryDate});

  MaxPlanData.fromJson(Map<String, dynamic> json) {
    id = json['Id']?.toString();
    planName = json['PlanName']?.toString();
    amount = json['Amount']?.toString();
    entryDate = json['EntryDate']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['PlanName'] = planName;
    data['Amount'] = amount;
    data['EntryDate'] = entryDate;
    return data;
  }
}
