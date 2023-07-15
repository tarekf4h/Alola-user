class TasksModel {
  bool? status;
  String? message;
  List<Task>? task;
  Pagination? pagination;

  TasksModel({this.status, this.message, this.task, this.pagination});

  TasksModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      task = <Task>[];
      json['data'].forEach((v) {
        task!.add(new Task.fromJson(v));
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
    if (this.task != null) {
      data['data'] = this.task!.map((v) => v.toJson()).toList();
    }
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    return data;
  }
}

class Task {
  int? id;
  String? title;
  String? code;
  String? taskNumber;
  String? duration;
  String? startDate;
  String? endDate;
  String? state;
  String? stateCode;
  String? details;
  String? receiverEmployee;

  Task(
      {this.id,
      this.title,
      this.code,
      this.taskNumber,
      this.duration,
      this.startDate,
      this.endDate,
      this.state,
      this.stateCode,
      this.receiverEmployee,
      this.details});

  Task.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    code = json['code'];
    taskNumber = json['task_number'];
    duration = json['duration'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    state = json['state'];
    stateCode = json['state_code'];
    details = json['details'];
    receiverEmployee = json['receiver_employee'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['code'] = this.code;
    data['task_number'] = this.taskNumber;
    data['duration'] = this.duration;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['state'] = this.state;
    data['state_code'] = this.stateCode;
    data['details'] = this.details;
    data['receiver_employee'] = this.receiverEmployee;
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
