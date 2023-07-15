class DefaultModel {
  String? message;
  bool? status;
  // String? data; 
  DefaultModel({this.message, this.status });

  DefaultModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    // data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    // data['data'] = this.data;
    return data;
  }
}

class PrivacyPolicyModel {
  String? message;
  bool? status;
  String? data; 
  PrivacyPolicyModel({this.message, this.status , this.data});

  PrivacyPolicyModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    data['data'] = this.data;
    return data;
  }
}
