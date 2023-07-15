class GetAttendeesModel {
  bool? status;
  String? message;
  List<Attende>? attendees;
  Pagination? pagination;

  GetAttendeesModel({this.status, this.message, this.attendees, this.pagination});

  GetAttendeesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      attendees = <Attende>[];
      json['data'].forEach((v) {
        attendees!.add(new Attende.fromJson(v));
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
    if (this.attendees != null) {
      data['data'] = this.attendees!.map((v) => v.toJson()).toList();
    }
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    return data;
  }
}

class Attende {
  int? id;
  String? date;
  String? state;
  int? numOfHours;
  bool? isDiscount;
  String? stateCode;

  Attende({this.id, this.date, this.state, this.numOfHours, this.isDiscount , this.stateCode});

  Attende.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    state = json['state'];
    numOfHours = json['num_of_hours'];
    isDiscount = json['is_discount'];
    stateCode = json['state_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['state'] = this.state;
    data['num_of_hours'] = this.numOfHours;
    data['is_discount'] = this.isDiscount;
    data['state_code'] = this.stateCode;
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
