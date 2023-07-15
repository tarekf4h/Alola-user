import 'package:adelco_user/models/product/category_model.dart';

class HomeModel {
  bool? status;
  String? message;
  Data? data;

  HomeModel({this.status, this.message, this.data});

  HomeModel.fromJson(Map<String, dynamic> json) {
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
  List<BannersList>? bannersList;
  List<Category>? bestSellingCategoryList;
  List<Product>? bestOffersList;
  List<Product>? mostPopularProductsList;

  Data(
      {this.bannersList,
      this.bestSellingCategoryList,
      this.bestOffersList,
      this.mostPopularProductsList});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['banners_list'] != null) {
      bannersList = <BannersList>[];
      json['banners_list'].forEach((v) {
        bannersList!.add(new BannersList.fromJson(v));
      });
    }
    if (json['best_selling_category_list'] != null) {
      bestSellingCategoryList = <Category>[];
      json['best_selling_category_list'].forEach((v) {
        bestSellingCategoryList!.add(new Category.fromJson(v));
      });
    }
    if (json['best_offers_list'] != null) {
      bestOffersList = <Product>[];
      json['best_offers_list'].forEach((v) {
        bestOffersList!.add(new Product.fromJson(v));
      });
    }
    if (json['most_popular_products_list'] != null) {
      mostPopularProductsList = <Product>[];
      json['most_popular_products_list'].forEach((v) {
        mostPopularProductsList!.add(new Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.bannersList != null) {
      data['banners_list'] = this.bannersList!.map((v) => v.toJson()).toList();
    }
    if (this.bestSellingCategoryList != null) {
      data['best_selling_category_list'] =
          this.bestSellingCategoryList!.map((v) => v.toJson()).toList();
    }
    if (this.bestOffersList != null) {
      data['best_offers_list'] =
          this.bestOffersList!.map((v) => v.toJson()).toList();
    }
    if (this.mostPopularProductsList != null) {
      data['most_popular_products_list'] =
          this.mostPopularProductsList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BannersList {
  int? id;
  String? image;

  BannersList({this.id, this.image});

  BannersList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    return data;
  }
}

class BestSellingCategoryList {
  int? id;
  String? name;
  String? image;
  int? orderDetailsCount;

  BestSellingCategoryList(
      {this.id, this.name, this.image, this.orderDetailsCount});

  BestSellingCategoryList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    orderDetailsCount = json['order_details_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['order_details_count'] = this.orderDetailsCount;
    return data;
  }
}

class Product {
  int? id;
  String? productTitle;
  String? validity;
  String? country;
  String? productDetails;
  String? productBarcode;
  String? productCode;
  String? image;
  String? weight;
  String? capacitance;
  int? quantity;
  String? temperature;
  String? productUnit;
  String? price;
  String? discountPrice;
  String? percentDiscount;
  int? cartQuantity;
  bool? favoriteStatus;

  Product(
      {this.id,
      this.productTitle,
      this.validity,
      this.country,
      this.productDetails,
      this.productBarcode,
      this.productCode,
      this.image,
      this.weight,
      this.capacitance,
      this.quantity,
      this.temperature,
      this.productUnit,
      this.price,
      this.discountPrice,
      this.percentDiscount,
      this.cartQuantity,
      this.favoriteStatus});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productTitle = json['product_title'];
    validity = json['validity'];
    country = json['country'];
    productDetails = json['product_details'];
    productBarcode = json['product_barcode'];
    productCode = json['product_code'];
    image = json['image'];
    weight = json['weight'];
    capacitance = json['capacitance'];
    quantity = json['quantity'];
    temperature = json['temperature'];
    productUnit = json['product_unit'];
    price = json['price'];
    discountPrice = json['discount_price'];
    percentDiscount = json['percent_discount'];
    cartQuantity = json['cart_quantity'];
    favoriteStatus = json['favorite_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_title'] = this.productTitle;
    data['validity'] = this.validity;
    data['country'] = this.country;
    data['product_details'] = this.productDetails;
    data['product_barcode'] = this.productBarcode;
    data['product_code'] = this.productCode;
    data['image'] = this.image;
    data['weight'] = this.weight;
    data['capacitance'] = this.capacitance;
    data['quantity'] = this.quantity;
    data['temperature'] = this.temperature;
    data['product_unit'] = this.productUnit;
    data['price'] = this.price;
    data['discount_price'] = this.discountPrice;
    data['percent_discount'] = this.percentDiscount;
    data['cart_quantity'] = this.cartQuantity;
    data['favorite_status'] = this.favoriteStatus;
    return data;
  }
}
