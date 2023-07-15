

import '../../shared/cash_helper.dart';
import '../../shared/network_helper.dart';



class ProductRepository {

  //Home
  static Future  home() async {
    return await NetworkHelper.repo("get-home-page-data","get",formData: null,headerState: true);
  }
  // Category
  static Future  category() async {
    return await NetworkHelper.repo("get-main-categories-list","get",formData: null,headerState: true);
  }
   // subCategory
  static Future  subCategory(int id) async {
    return await NetworkHelper.repo("get-sub-main-categories-list?category_id=$id","get",formData: null,headerState: true);
  }
  // Products
  static Future  products(int page ,String barcode ,String categoryId,String subCategoryId ,String search) async {
    return await NetworkHelper.repo("get-products-list?limit=100&page_number=$page&barcode=$barcode&category_id=$categoryId&sub_category_id=$subCategoryId&search=$search","get",formData: null,headerState: true);
  }
  // CheckProduct
   static Future  getProductsDetails(String id) async {
    return await NetworkHelper.repo("get-products-details?product_id=$id","get",formData: null,headerState: true);
  }
   static Future  addFavorite(String id) async {
    return await NetworkHelper.repo("product/add-to-favorite","post",formData: {"product_id":id,},headerState: true);
  }
  static Future  removeFavorite(String id) async {
    return await NetworkHelper.repo("product/remove-from-favorite","post",formData: {"product_id":id,},headerState: true);
  }
  static Future  getFavorite() async {
    return await NetworkHelper.repo("product/get-favorites-list?limit=100&page_number=1","get",formData: null,headerState: true);
  }
  // addFavorite
  // removeFavorite
  // getFavorite
}