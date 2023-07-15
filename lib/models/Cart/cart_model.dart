import '../product/home_model.dart';

class CartModel {
  bool? status;
  String? message;
  Data? data;

  CartModel({this.status, this.message, this.data});

  CartModel.fromJson(Map<String, dynamic> json) {
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
  CartInfo? cartInfo;
  List<CartDetails>? cartDetails;

  Data({this.cartInfo, this.cartDetails});

  Data.fromJson(Map<String, dynamic> json) {
    cartInfo = json['cart_info'] != null
        ? new CartInfo.fromJson(json['cart_info'])
        : null;
    if (json['cart_details'] != null) {
      cartDetails = <CartDetails>[];
      json['cart_details'].forEach((v) {
        cartDetails!.add(new CartDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cartInfo != null) {
      data['cart_info'] = this.cartInfo!.toJson();
    }
    if (this.cartDetails != null) {
      data['cart_details'] = this.cartDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CartInfo {
  int? id;
  String? total;
  String? subtotal;
  int? quantity;
  int? addressId;
  String? vat;
  String? discount;
  String? shippingPrice;

  CartInfo(
      {this.id,
      this.total,
      this.subtotal,
      this.quantity,
      this.addressId,
      this.vat,
      this.discount,
      this.shippingPrice});

  CartInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    total = json['total'];
    subtotal = json['subtotal'];
    quantity = json['quantity'];
    addressId = json['address_id'];
    vat = json['vat'];
    discount = json['discount'];
    shippingPrice = json['shipping_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['total'] = this.total;
    data['subtotal'] = this.subtotal;
    data['quantity'] = this.quantity;
    data['address_id'] = this.addressId;
    data['vat'] = this.vat;
    data['discount'] = this.discount;
    data['shipping_price'] = this.shippingPrice;
    return data;
  }
}

class CartDetails {
  int? id;
  int? cartId;
  Product? product;
  String? discountPrice;
  String? price;
  int? quantity;

  CartDetails(
      {this.id,
      this.cartId,
      this.product,
      this.discountPrice,
      this.price,
      this.quantity});

  CartDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cartId = json['cart_id'];
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
    discountPrice = json['discount_price'];
    price = json['price'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cart_id'] = this.cartId;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    data['discount_price'] = this.discountPrice;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    return data;
  }
}

