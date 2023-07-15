class CouponModel {
  bool? status;
  String? message;
  Data? data;

  CouponModel({this.status, this.message, this.data});

  CouponModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? code;
  String? validityDateTime;
  num? value;

  Data({this.id, this.name, this.code, this.validityDateTime, this.value});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    validityDateTime = json['validity_date_time'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['code'] = this.code;
    data['validity_date_time'] = this.validityDateTime;
    data['value'] = this.value;
    return data;
  }
}
