class JobInfoModel {
  bool? status;
  String? message;
  Data? data;

  JobInfoModel({this.status, this.message, this.data});

  JobInfoModel.fromJson(Map<String, dynamic> json) {
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
  String? email;
  String? code;
  int? currentVacations;
  int? spentVacations;
  String? jobTitle;
  String? managementName;
  String? branch;
  String? deploymentType;
  String? vacationFrom;
  String? vacationTo;

  Data(
      {this.id,
      this.name,
      this.email,
      this.code,
      this.currentVacations,
      this.spentVacations,
      this.jobTitle,
      this.managementName,
      this.branch,
      this.deploymentType,
      this.vacationFrom,
      this.vacationTo});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    code = json['code'];
    currentVacations = json['current_vacations'];
    spentVacations = json['spent_vacations'];
    jobTitle = json['job_title'];
    managementName = json['management_name'];
    branch = json['branch'];
    deploymentType = json['deployment_type'];
    vacationFrom = json['vacation_from'];
    vacationTo = json['vacation_to'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['code'] = this.code;
    data['current_vacations'] = this.currentVacations;
    data['spent_vacations'] = this.spentVacations;
    data['job_title'] = this.jobTitle;
    data['management_name'] = this.managementName;
    data['branch'] = this.branch;
    data['deployment_type'] = this.deploymentType;
    data['vacation_from'] = this.vacationFrom;
    data['vacation_to'] = this.vacationTo;
    return data;
  }
}
