import '../Aattendees/get_attendees_model.dart';
import '../Addresses/address_model.dart';
import '../product/home_model.dart';

class OrdersModel {
  bool? status;
  String? message;
  List<Order>? orders;
  Pagination? pagination;

  OrdersModel({this.status, this.message, this.orders, this.pagination});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      orders = <Order>[];
      json['data'].forEach((v) {
        orders!.add(new Order.fromJson(v));
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
    if (this.orders != null) {
      data['data'] = this.orders!.map((v) => v.toJson()).toList();
    }
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    return data;
  }
}

class Order {
  OrderInfo? orderInfo;
  List<OrderDetails>? orderDetails;

  Order({this.orderInfo, this.orderDetails});

  Order.fromJson(Map<String, dynamic> json) {
    orderInfo = json['order_info'] != null
        ? new OrderInfo.fromJson(json['order_info'])
        : null;
    if (json['order_details'] != null) {
      orderDetails = <OrderDetails>[];
      json['order_details'].forEach((v) {
        orderDetails!.add(new OrderDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.orderInfo != null) {
      data['order_info'] = this.orderInfo!.toJson();
    }
    if (this.orderDetails != null) {
      data['order_details'] =
          this.orderDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderInfo {
  int? id;
  String? orderCode;
  String? total;
  String? subtotal;
  int? quantity;
  Address? address;
  String? vat;
  String? discount;
  String? shippingPrice;
  int? paymentMethodId;
  String? deliveryNotes;
  String? deliveryDuration;
  String? discountCode;
  String? date;
  String? expectedDeliveryDatetime;
  String? expectedDeliveryInMinutes;
  String? status;

  OrderInfo(
      {this.id,
      this.orderCode,
      this.total,
      this.subtotal,
      this.quantity,
      this.address,
      this.vat,
      this.discount,
      this.shippingPrice,
      this.paymentMethodId,
      this.deliveryNotes,
      this.deliveryDuration,
      this.discountCode,
      this.date,
      this.expectedDeliveryDatetime,
      this.expectedDeliveryInMinutes,
      this.status});

  OrderInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderCode = json['order_code'];
    total = json['total'];
    subtotal = json['subtotal'];
    quantity = json['quantity'];
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
    vat = json['vat'];
    discount = json['discount'];
    shippingPrice = json['shipping_price'];
    paymentMethodId = json['payment_method_id'];
    deliveryNotes = json['delivery_notes'];
    deliveryDuration = json['delivery_duration'];
    discountCode = json['discount_code'];
    date = json['date'];
    expectedDeliveryDatetime = json['expected_delivery_datetime'];
    expectedDeliveryInMinutes = json['expected_delivery_in_minutes'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_code'] = this.orderCode;
    data['total'] = this.total;
    data['subtotal'] = this.subtotal;
    data['quantity'] = this.quantity;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    data['vat'] = this.vat;
    data['discount'] = this.discount;
    data['shipping_price'] = this.shippingPrice;
    data['payment_method_id'] = this.paymentMethodId;
    data['delivery_notes'] = this.deliveryNotes;
    data['delivery_duration'] = this.deliveryDuration;
    data['discount_code'] = this.discountCode;
    data['date'] = this.date;
    data['expected_delivery_datetime'] = this.expectedDeliveryDatetime;
    data['expected_delivery_in_minutes'] = this.expectedDeliveryInMinutes;
    data['status'] = this.status;
    return data;
  }
}



class OrderDetails {
  int? id;
  int? orderId;
  Product? product;
  String? discountPrice;
  String? price;
  int? quantity;

  OrderDetails(
      {this.id,
      this.orderId,
      this.product,
      this.discountPrice,
      this.price,
      this.quantity});

  OrderDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
    discountPrice = json['discount_price'];
    price = json['price'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_id'] = this.orderId;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    data['discount_price'] = this.discountPrice;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    return data;
  }
}




