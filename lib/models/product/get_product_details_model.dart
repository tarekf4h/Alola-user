class GetProductDetailsModel {
  bool? status;
  String? message;
  Data? data;

  GetProductDetailsModel({this.status, this.message, this.data});

  GetProductDetailsModel.fromJson(Map<String, dynamic> json) {
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
  ProductData? productData;
  ProductDetails? productDetails;

  Data({this.productData, this.productDetails});

  Data.fromJson(Map<String, dynamic> json) {
    productData = json['product_data'] != null
        ? new ProductData.fromJson(json['product_data'])
        : null;
    productDetails = json['product_details'] != null
        ? new ProductDetails.fromJson(json['product_details'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.productData != null) {
      data['product_data'] = this.productData!.toJson();
    }
    if (this.productDetails != null) {
      data['product_details'] = this.productDetails!.toJson();
    }
    return data;
  }
}

class ProductData {
  int? id;
  String? productTitle;
  String? productBarcode;
  String? productCode;
  String? image;
  String? weight;
  String? capacitance;
  int? quantity;
  String? temperature;
  String? productUnit;

  ProductData(
      {this.id,
      this.productTitle,
      this.productBarcode,
      this.productCode,
      this.image,
      this.weight,
      this.capacitance,
      this.quantity,
      this.temperature,
      this.productUnit});

  ProductData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productTitle = json['product_title'];
    productBarcode = json['product_barcode'];
    productCode = json['product_code'];
    image = json['image'];
    weight = json['weight'];
    capacitance = json['capacitance'];
    quantity = json['quantity'];
    temperature = json['temperature'];
    productUnit = json['product_unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_title'] = this.productTitle;
    data['product_barcode'] = this.productBarcode;
    data['product_code'] = this.productCode;
    data['image'] = this.image;
    data['weight'] = this.weight;
    data['capacitance'] = this.capacitance;
    data['quantity'] = this.quantity;
    data['temperature'] = this.temperature;
    data['product_unit'] = this.productUnit;
    return data;
  }
}

class ProductDetails {
  List<Shipments>? shipments;
  List<Preparations>? preparations;
  List<Sites>? sites;

  ProductDetails({this.shipments, this.preparations, this.sites});

  ProductDetails.fromJson(Map<String, dynamic> json) {
    if (json['shipments'] != null) {
      shipments = <Shipments>[];
      json['shipments'].forEach((v) {
        shipments!.add(new Shipments.fromJson(v));
      });
    }
    if (json['preparations'] != null) {
      preparations = <Preparations>[];
      json['preparations'].forEach((v) {
        preparations!.add(new Preparations.fromJson(v));
      });
    }
    if (json['sites'] != null) {
      sites = <Sites>[];
      json['sites'].forEach((v) {
        sites!.add(new Sites.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.shipments != null) {
      data['shipments'] = this.shipments!.map((v) => v.toJson()).toList();
    }
    if (this.preparations != null) {
      data['preparations'] = this.preparations!.map((v) => v.toJson()).toList();
    }
    if (this.sites != null) {
      data['sites'] = this.sites!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Shipments {
  int? id;
  String? productTitle;
  String? productBarcode;
  int? quantity;
  String? productUnit;
  String? deliverDate;
  String? shippingNumber;
  String? productCode;
  String? supplierName;
  String? warehouseEmployeeName;
  String? invoiceNumber;
  String? expirationDate;

  Shipments(
      {this.id,
      this.productTitle,
      this.productBarcode,
      this.quantity,
      this.productUnit,
      this.deliverDate,
      this.shippingNumber,
      this.productCode,
      this.supplierName,
      this.warehouseEmployeeName,
      this.invoiceNumber,
      this.expirationDate});

  Shipments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productTitle = json['product_title'];
    productBarcode = json['product_barcode'];
    quantity = json['quantity'];
    productUnit = json['product_unit'];
    deliverDate = json['deliver_date'];
    shippingNumber = json['shipping_number'];
    productCode = json['product_code'];
    supplierName = json['supplier_name'];
    warehouseEmployeeName = json['warehouse_employee_name'];
    invoiceNumber = json['invoice_number'];
    expirationDate = json['expiration_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_title'] = this.productTitle;
    data['product_barcode'] = this.productBarcode;
    data['quantity'] = this.quantity;
    data['product_unit'] = this.productUnit;
    data['deliver_date'] = this.deliverDate;
    data['shipping_number'] = this.shippingNumber;
    data['product_code'] = this.productCode;
    data['supplier_name'] = this.supplierName;
    data['warehouse_employee_name'] = this.warehouseEmployeeName;
    data['invoice_number'] = this.invoiceNumber;
    data['expiration_date'] = this.expirationDate;
    return data;
  }
}

class Preparations {
  int? id;
  int? productId;
  String? productTitle;
  String? productBarcode;
  String? productCode;
  String? image;
  String? weight;
  String? capacitance;
  String? productUnit;
  int? quantity;
  String? location;
  String? shippingNumber;
  int? isPrepared;
  String? code;
  String? responsibleName;
  String? deliveryDate;

  Preparations(
      {this.id,
      this.productId,
      this.productTitle,
      this.productBarcode,
      this.productCode,
      this.image,
      this.weight,
      this.capacitance,
      this.productUnit,
      this.quantity,
      this.location,
      this.shippingNumber,
      this.isPrepared,
      this.code,
      this.responsibleName,
      this.deliveryDate});

  Preparations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    productTitle = json['product_title'];
    productBarcode = json['product_barcode'];
    productCode = json['product_code'];
    image = json['image'];
    weight = json['weight'];
    capacitance = json['capacitance'];
    productUnit = json['product_unit'];
    quantity = json['quantity'];
    location = json['location'];
    shippingNumber = json['shipping_number'];
    isPrepared = json['is_prepared'];
    code = json['code'];
    responsibleName = json['responsible_name'];
    deliveryDate = json['delivery_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['product_title'] = this.productTitle;
    data['product_barcode'] = this.productBarcode;
    data['product_code'] = this.productCode;
    data['image'] = this.image;
    data['weight'] = this.weight;
    data['capacitance'] = this.capacitance;
    data['product_unit'] = this.productUnit;
    data['quantity'] = this.quantity;
    data['location'] = this.location;
    data['shipping_number'] = this.shippingNumber;
    data['is_prepared'] = this.isPrepared;
    data['code'] = this.code;
    data['responsible_name'] = this.responsibleName;
    data['delivery_date'] = this.deliveryDate;
    return data;
  }
}

class Sites {
  int? id;
  int? quantity;
  String? siteName;
  int? productId;
  String? productTitle;
  String? productBarcode;
  String? productCode;
  String? shippingNumber;
  String? image;
  String? weight;
  String? capacitance;
  String? productUnit;
  String? deliveryDate;
  String? expirationDate;
  String? productStatus;

  Sites(
      {this.id,
      this.quantity,
      this.siteName,
      this.productId,
      this.productTitle,
      this.productBarcode,
      this.productCode,
      this.shippingNumber,
      this.image,
      this.weight,
      this.capacitance,
      this.productUnit,
      this.deliveryDate,
      this.expirationDate,
      this.productStatus});

  Sites.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    siteName = json['site_name'];
    productId = json['product_id'];
    productTitle = json['product_title'];
    productBarcode = json['product_barcode'];
    productCode = json['product_code'];
    shippingNumber = json['shipping_number'];
    image = json['image'];
    weight = json['weight'];
    capacitance = json['capacitance'];
    productUnit = json['product_unit'];
    deliveryDate = json['delivery_date'];
    expirationDate = json['expiration_date'];
    productStatus = json['product_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['quantity'] = this.quantity;
    data['site_name'] = this.siteName;
    data['product_id'] = this.productId;
    data['product_title'] = this.productTitle;
    data['product_barcode'] = this.productBarcode;
    data['product_code'] = this.productCode;
    data['shipping_number'] = this.shippingNumber;
    data['image'] = this.image;
    data['weight'] = this.weight;
    data['capacitance'] = this.capacitance;
    data['product_unit'] = this.productUnit;
    data['delivery_date'] = this.deliveryDate;
    data['expiration_date'] = this.expirationDate;
    data['product_status'] = this.productStatus;
    return data;
  }
}
