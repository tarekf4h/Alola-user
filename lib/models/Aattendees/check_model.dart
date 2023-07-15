class CheckModel {
  bool? status;
  String? message;
  Data? data;

  CheckModel({this.status, this.message, this.data});

  CheckModel.fromJson(Map<String, dynamic> json) {
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
  UserCheckinInfo? userCheckinInfo;
  CompanyWorkInfo? companyWorkInfo;
  String? status;
  int? statusCode;

  Data(
      {this.userCheckinInfo,
      this.companyWorkInfo,
      this.status,
      this.statusCode});

  Data.fromJson(Map<String, dynamic> json) {
    userCheckinInfo = json['user_checkin_info'] != null
        ? new UserCheckinInfo.fromJson(json['user_checkin_info'])
        : null;
    companyWorkInfo = json['company_work_info'] != null
        ? new CompanyWorkInfo.fromJson(json['company_work_info'])
        : null;
    status = json['status'];
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userCheckinInfo != null) {
      data['user_checkin_info'] = this.userCheckinInfo!.toJson();
    }
    if (this.companyWorkInfo != null) {
      data['company_work_info'] = this.companyWorkInfo!.toJson();
    }
    data['status'] = this.status;
    data['status_code'] = this.statusCode;
    return data;
  }
}

class UserCheckinInfo {
  String? date;
  String? attendanceStatus;
  int? numOfHours;
  int? discount;
  String? checkinDatetime;
  String? checkoutDatetime;

  UserCheckinInfo(
      {this.date,
      this.attendanceStatus,
      this.numOfHours,
      this.discount,
      this.checkinDatetime,
      this.checkoutDatetime});

  UserCheckinInfo.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    attendanceStatus = json['attendance_status'];
    numOfHours = json['num_of_hours'];
    discount = json['discount'];
    checkinDatetime = json['checkin_datetime'];
    checkoutDatetime = json['checkout_datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['attendance_status'] = this.attendanceStatus;
    data['num_of_hours'] = this.numOfHours;
    data['discount'] = this.discount;
    data['checkin_datetime'] = this.checkinDatetime;
    data['checkout_datetime'] = this.checkoutDatetime;
    return data;
  }
}

class CompanyWorkInfo {
  int? id;
  String? fromDate;
  String? toDate;
  String? checkInTime;
  String? checkOutTime;
  int? numberOfHoursPerDay;
  String? workOffDays;
  int? discountPerHourInPercent;
  int? toleranceMinutes;
  int? remainingMinutes;

  CompanyWorkInfo(
      {this.id,
      this.fromDate,
      this.toDate,
      this.checkInTime,
      this.checkOutTime,
      this.numberOfHoursPerDay,
      this.workOffDays,
      this.discountPerHourInPercent,
      this.toleranceMinutes,
      this.remainingMinutes});

  CompanyWorkInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fromDate = json['from_date'];
    toDate = json['to_date'];
    checkInTime = json['check_in_time'];
    checkOutTime = json['check_out_time'];
    numberOfHoursPerDay = json['number_of_hours_per_day'];
    workOffDays = json['work_off_days'];
    discountPerHourInPercent = json['discount_per_hour_in_percent'];
    toleranceMinutes = json['tolerance_minutes'];
    remainingMinutes = json['remaining_minutes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['from_date'] = this.fromDate;
    data['to_date'] = this.toDate;
    data['check_in_time'] = this.checkInTime;
    data['check_out_time'] = this.checkOutTime;
    data['number_of_hours_per_day'] = this.numberOfHoursPerDay;
    data['work_off_days'] = this.workOffDays;
    data['discount_per_hour_in_percent'] = this.discountPerHourInPercent;
    data['tolerance_minutes'] = this.toleranceMinutes;
    data['remaining_minutes'] = this.remainingMinutes;
    return data;
  }
}
