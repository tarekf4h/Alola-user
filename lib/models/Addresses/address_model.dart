import '../product/favorites_model.dart';

class AddressModel {
  bool? status;
  String? message;
  List<Address>? address;
  Pagination? pagination;

  AddressModel({this.status, this.message, this.address, this.pagination});

  AddressModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      address = <Address>[];
      json['data'].forEach((v) {
        address!.add(new Address.fromJson(v));
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
    if (this.address != null) {
      data['data'] = this.address!.map((v) => v.toJson()).toList();
    }
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    return data;
  }
}

class Address {
  int? id;
  String? streetName;
  String? region;
  String? city;
  String? state;
  String? blockName;
  String? apartmentName;
  String? specialMarque;
  double? latitude;
  double? longitude;
  int? isDefault;

  Address(
      {this.id,
      this.streetName,
      this.region,
      this.city,
      this.state,
      this.blockName,
      this.apartmentName,
      this.specialMarque,
      this.latitude,
      this.longitude,
      this.isDefault});

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    streetName = json['street_name'];
    region = json['region'];
    city = json['city'];
    state = json['state'];
    blockName = json['block_name'];
    apartmentName = json['apartment_name'];
    specialMarque = json['special_marque'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    isDefault = json['is_default'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['street_name'] = this.streetName;
    data['region'] = this.region;
    data['city'] = this.city;
    data['state'] = this.state;
    data['block_name'] = this.blockName;
    data['apartment_name'] = this.apartmentName;
    data['special_marque'] = this.specialMarque;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['is_default'] = this.isDefault;
    return data;
  }
}


