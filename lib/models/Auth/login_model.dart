class LoginModel {
  bool? status;
  String? message;
  Data? data;

  LoginModel({this.status, this.message, this.data});

  LoginModel.fromJson(Map<String, dynamic> json) {
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
  UserData? userData;
  String? accessToken;
  String? tokenType;
  String? warehouseCode;

  Data({this.userData, this.accessToken, this.tokenType , this.warehouseCode});

  Data.fromJson(Map<String, dynamic> json) {
    userData = json['user_data'] != null
        ? new UserData.fromJson(json['user_data'])
        : null;
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    warehouseCode = json['warehouse_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userData != null) {
      data['user_data'] = this.userData!.toJson();
    }
    data['access_token'] = this.accessToken;
    data['token_type'] = this.tokenType;
    data['warehouse_code'] = this.warehouseCode;
    return data;
  }
}

class UserData {
  int? id;
  String? name;
  String? email;
  String? mobile;
  String? code;

  UserData({this.id, this.name, this.email, this.mobile, this.code});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['code'] = this.code;
    return data;
  }
}
