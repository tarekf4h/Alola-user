class ListModel {
  bool? status;
  String? message;
  List<Item>? item;

  ListModel({this.status, this.message, this.item});

  ListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      item = <Item>[];
      json['data'].forEach((v) {
        item!.add(new Item.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.item != null) {
      data['data'] = this.item!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Item {
  int? id;
  String? title;
  String? code;

  Item({this.id, this.title, this.code});

  Item.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['code'] = this.code;
    return data;
  }
}
