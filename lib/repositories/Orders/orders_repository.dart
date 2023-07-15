

import '../../shared/network_helper.dart';

class OrdersRepository{
  static Future  reorder(Map<String, String> formData) async {
    return await NetworkHelper.repo("orders/reorder","post",formData:formData,headerState: true);
  }
  static Future  cancel(String id) async {
    return await NetworkHelper.repo("orders/cancel","post",formData: {"id":id,},headerState: true);
  }
  static Future  review(Map<String, String> formData) async {
    return await NetworkHelper.repo("orders/review","post",formData: formData,headerState: true);
  }
  static Future  getOrders() async {
    return await NetworkHelper.repo("orders/get-orders-list","get",formData: null,headerState: true);
  }
  static Future  getOrderDetails(String id) async {
    return await NetworkHelper.repo("orders/get-order-details?id=$id","get",formData: null,headerState: true);
  }
  static Future  getOrderStatus(String id) async {
    return await NetworkHelper.repo("orders/get-order-status_logs?id=$id","get",formData: null,headerState: true);
  }
}