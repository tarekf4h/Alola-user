class EmployeesModel {
  bool? status;
  String? message;
  List<Employee>? employee;

  EmployeesModel({this.status, this.message, this.employee});

  EmployeesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      employee = <Employee>[];
      json['data'].forEach((v) {
        employee!.add(new Employee.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.employee != null) {
      data['data'] = this.employee!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Employee {
  int? id;
  String? code;
  String? name;
  String? email;
  String? mobile;

  Employee({this.id, this.code, this.name, this.email, this.mobile});

  Employee.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    return data;
  }
}
