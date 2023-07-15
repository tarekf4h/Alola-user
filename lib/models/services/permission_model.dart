class PermissionModel {
  bool? status;
  String? message;
  List<Permission>? permission;
  Pagination? pagination;

  PermissionModel(
      {this.status, this.message, this.permission, this.pagination});

  PermissionModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      permission = <Permission>[];
      json['data'].forEach((v) {
        permission!.add(new Permission.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.permission != null) {
      data['data'] = this.permission!.map((v) => v.toJson()).toList();
    }
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    return data;
  }
}

class Permission {
  int? id;
  String? code;
  String? applyDate;
  String? excuseDate;
  int? numOfHours;
  String? isAccepted;
  String? isAcceptedCode;
  String? reasons;
  String? acceptRefuseDate;

  Permission(
      {this.id,
      this.code,
      this.applyDate,
      this.excuseDate,
      this.numOfHours,
      this.isAccepted,
      this.isAcceptedCode,
      this.reasons,
      this.acceptRefuseDate});

  Permission.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    applyDate = json['apply_date'];
    excuseDate = json['excuse_date'];
    numOfHours = json['num_of_hours'];
    isAccepted = json['is_accepted'];
    isAcceptedCode = json['is_accepted_code'];
    reasons = json['reasons'];
    acceptRefuseDate = json['accept_refuse_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['apply_date'] = this.applyDate;
    data['excuse_date'] = this.excuseDate;
    data['num_of_hours'] = this.numOfHours;
    data['is_accepted'] = this.isAccepted;
    data['is_accepted_code'] = this.isAcceptedCode;
    data['reasons'] = this.reasons;
    data['accept_refuse_date'] = this.acceptRefuseDate;
    return data;
  }
}

class Pagination {
  int? total;
  int? count;
  int? perPage;
  int? currentPage;
  int? totalPages;

  Pagination(
      {this.total,
      this.count,
      this.perPage,
      this.currentPage,
      this.totalPages});

  Pagination.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    count = json['count'];
    perPage = json['per_page'];
    currentPage = json['current_page'];
    totalPages = json['total_pages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['count'] = this.count;
    data['per_page'] = this.perPage;
    data['current_page'] = this.currentPage;
    data['total_pages'] = this.totalPages;
    return data;
  }
}
