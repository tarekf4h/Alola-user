import '../../shared/network_helper.dart';


class CheckoutRepository{
  static Future  placementOrder(Map<String, String> formData) async {
    return await NetworkHelper.repo("checkout/placement-order","post",formData:formData,headerState: true);
  }
  static Future  validateCouponCode(String code) async {
    return await NetworkHelper.repo("checkout/validate-coupon-code","post",formData: {"code":code,},headerState: true);
  }

}