import 'dart:convert';

import 'package:adelco_user/shared/cash_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class NetworkHelper {
  static Future<Uri> setApi(String endPoint) async {
    // String lang = await CashHelper.getSavedString("lang", "");
    return Uri.parse("http://neworder.demo.f4h.com.sa/api/$endPoint");
  }

  static String url = "http://neworder.demo.f4h.com.sa/api/";


  static Future<Map<String, dynamic>> repo(String endPoint, String type,
      {Map<String, dynamic>? formData, bool headerState = true}) async {
    String jwt = await CashHelper.getSavedString("id", "");

    String lang = await CashHelper.getSavedString("lang", "");
    Map<String, String> headers = {
      "Accept": "application/json",
      "Authorization": "Bearer $jwt",
      "jwt": jwt,
      "lang": lang==""?"ar":lang
    };
    if (kDebugMode) {
      print(headers);
      print(formData);
      print(endPoint);
      print(await setApi(endPoint));
    }

    http.Response response = type == "post"
        ? await http.post(await setApi(endPoint),
        headers: headerState ? headers : null, body: formData)
        : await http.get(
        await setApi(endPoint), headers: headerState ? headers : null);
    if (kDebugMode) {
      print(response.body);
    }
    Map<String, dynamic> mapResponse = jsonDecode(response.body);
    return mapResponse;
  }
}
