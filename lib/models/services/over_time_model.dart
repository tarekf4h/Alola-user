class OverTimeModel {
  bool? status;
  String? message;
  List<OverTime>? overTime;
  Pagination? pagination;

  OverTimeModel({this.status, this.message, this.overTime, this.pagination});

  OverTimeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      overTime = <OverTime>[];
      json['data'].forEach((v) {
        overTime!.add(new OverTime.fromJson(v));
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
    if (this.overTime != null) {
      data['data'] = this.overTime!.map((v) => v.toJson()).toList();
    }
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    return data;
  }
}

class OverTime {
  int? id;
  String? date;
  int? numOfHours;
  String? jobType;
  int? hourPrice;
  int? total;

  OverTime(
      {this.id,
      this.date,
      this.numOfHours,
      this.jobType,
      this.hourPrice,
      this.total});

  OverTime.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    numOfHours = json['num_of_hours'];
    jobType = json['job_type'];
    hourPrice = json['hour_price'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['num_of_hours'] = this.numOfHours;
    data['job_type'] = this.jobType;
    data['hour_price'] = this.hourPrice;
    data['total'] = this.total;
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
