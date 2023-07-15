

import '../../shared/network_helper.dart';

class CartRepository{
  static Future  removeCart(String id) async {
    return await NetworkHelper.repo("cart/delete-cart-item","post",formData: {"product_id":id,},headerState: true);
  }
  static Future  updateCart(int id , int quantity) async {
    return await NetworkHelper.repo("cart/update-cart","post",formData: {"product_id":"$id","quantity":"$quantity"},headerState: true);
  }
  static Future  getCart() async {
    return await NetworkHelper.repo("cart/get-cart-details","get",formData: null,headerState: true);
  }
    static Future  removeAll() async {
    return await NetworkHelper.repo("cart/delete-cart-items","get",formData: null,headerState: true);
  }
}