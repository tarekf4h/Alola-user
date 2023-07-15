import 'home_model.dart';

class ProductsModel {
  bool? status;
  String? message;
  List<Product>? product;
  Pagination? pagination;

  ProductsModel({this.status, this.message, this.product, this.pagination});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      product = <Product>[];
      json['data'].forEach((v) {
        product!.add(new Product.fromJson(v));
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
    if (this.product != null) {
      data['data'] = this.product!.map((v) => v.toJson()).toList();
    }
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    return data;
  }
}

// class Product {
//   int? id;
//   String? productTitle;
//   String? productBarcode;
//   String? productCode;
//   String? image;
//   String? weight;
//   String? capacitance;
//   int? quantity;
//   String? temperature;
//   String? productUnit;

//   Product(
//       {this.id,
//       this.productTitle,
//       this.productBarcode,
//       this.productCode,
//       this.image,
//       this.weight,
//       this.capacitance,
//       this.quantity,
//       this.temperature,
//       this.productUnit});

//   Product.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     productTitle = json['product_title'];
//     productBarcode = json['product_barcode'];
//     productCode = json['product_code'];
//     image = json['image'];
//     weight = json['weight'];
//     capacitance = json['capacitance'];
//     quantity = json['quantity'];
//     temperature = json['temperature'];
//     productUnit = json['product_unit'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['product_title'] = this.productTitle;
//     data['product_barcode'] = this.productBarcode;
//     data['product_code'] = this.productCode;
//     data['image'] = this.image;
//     data['weight'] = this.weight;
//     data['capacitance'] = this.capacitance;
//     data['quantity'] = this.quantity;
//     data['temperature'] = this.temperature;
//     data['product_unit'] = this.productUnit;
//     return data;
//   }
// }

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
