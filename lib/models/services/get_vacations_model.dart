class GetVacationsModel {
  bool? status;
  String? message;
  List<Vacation>? vacation;
  Pagination? pagination;

  GetVacationsModel(
      {this.status, this.message, this.vacation, this.pagination});

  GetVacationsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      vacation = <Vacation>[];
      json['data'].forEach((v) {
        vacation!.add(new Vacation.fromJson(v));
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
    if (this.vacation != null) {
      data['data'] = this.vacation!.map((v) => v.toJson()).toList();
    }
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    return data;
  }
}

class Vacation {
  int? id;
  String? startDate;
  String? endDate;
  String? type;
  String? typeCode;
  String? state;
  String? stateCode;
  String? stateDate;
  String? reasons;
  int? days;

  Vacation(
      {this.id,
      this.startDate,
      this.type,
      this.typeCode,
      this.state,
      this.stateCode,
      this.stateDate,
      this.reasons,
      this.endDate,
      this.days});

  Vacation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    startDate = json['start_date'];
    type = json['type'];
    typeCode = json['type_code'];
    state = json['state'];
    stateCode = json['state_code'];
    stateDate = json['state_date'];
    reasons = json['reasons'];
    days = json['days'];
    endDate = json['end_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['start_date'] = this.startDate;
    data['type'] = this.type;
    data['type_code'] = this.typeCode;
    data['state'] = this.state;
    data['state_code'] = this.stateCode;
    data['state_date'] = this.stateDate;
    data['reasons'] = this.reasons;
    data['days'] = this.days;
    data['end_date'] = this.endDate;
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
