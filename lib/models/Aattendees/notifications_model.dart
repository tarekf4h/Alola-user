class NotificationsModel {
  bool? status;
  String? message;
  List<Notification>? notification;
  Pagination? pagination;

  NotificationsModel(
      {this.status, this.message, this.notification, this.pagination});

  NotificationsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      notification = <Notification>[];
      json['data'].forEach((v) {
        notification!.add(new Notification.fromJson(v));
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
    if (this.notification != null) {
      data['data'] = this.notification!.map((v) => v.toJson()).toList();
    }
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    return data;
  }
}

class Notification {
  String? modelType;
  int? modelId;
  String? title;
  String? body;
  String? image;
  String? datetime;
  String? readAt;
  Extra? extra;

  Notification(
      {this.modelType,
      this.modelId,
      this.title,
      this.body,
      this.image,
      this.datetime,
      this.readAt,
      this.extra});

  Notification.fromJson(Map<String, dynamic> json) {
    modelType = json['model_type'];
    modelId = json['model_id'];
    title = json['title'];
    body = json['body'];
    image = json['image'];
    datetime = json['datetime'];
    readAt = json['read_at'];
    extra = json['extra'] != null ? new Extra.fromJson(json['extra']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['model_type'] = this.modelType;
    data['model_id'] = this.modelId;
    data['title'] = this.title;
    data['body'] = this.body;
    data['image'] = this.image;
    data['datetime'] = this.datetime;
    data['read_at'] = this.readAt;
    if (this.extra != null) {
      data['extra'] = this.extra!.toJson();
    }
    return data;
  }
}

class Extra {
  int? id;
  String? date;
  String? state;
  String? stateCode;
  int? numOfHours;
  bool? isDiscount;

  Extra(
      {this.id,
      this.date,
      this.state,
      this.stateCode,
      this.numOfHours,
      this.isDiscount});

  Extra.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    state = json['state'];
    stateCode = json['state_code'];
    numOfHours = json['num_of_hours'];
    isDiscount = json['is_discount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['state'] = this.state;
    data['state_code'] = this.stateCode;
    data['num_of_hours'] = this.numOfHours;
    data['is_discount'] = this.isDiscount;
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
