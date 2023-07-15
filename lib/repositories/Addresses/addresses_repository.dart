

import '../../shared/network_helper.dart';

class AddressesRepository{

  static Future  addAddress(Map<String, String> formData) async {
    return await NetworkHelper.repo("addresses/add","post",formData:formData,headerState: true);
  }
  static Future  removeAddress(String id) async {
    return await NetworkHelper.repo("addresses/remove","post",formData: {"id":id,},headerState: true);
  }
  static Future  updateAddress(Map<String, String> formData) async {
    return await NetworkHelper.repo("addresses/update","post",formData: formData,headerState: true);
  }
  static Future  getAddress() async {
    return await NetworkHelper.repo("addresses/get-addresses-list?limit=100","get",formData: null,headerState: true);
  }

    static Future  defaultAddress(String id) async {
    return await NetworkHelper.repo("addresses/update-is-default-address","post",formData: {"id":id,},headerState: true);
  }
}