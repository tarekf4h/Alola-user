import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../../shared/cash_helper.dart';
import '../../shared/network_helper.dart';
import 'package:http/http.dart' as http;

class AuthRepositories{
  static Future login(Map<String, String> formData) async {
    return await NetworkHelper.repo("login","post",formData: formData,headerState: true);
  }

 static Future register(Map<String, String> formData) async {
    return await NetworkHelper.repo("register","post",formData: formData,headerState: true);
  }

  // static Future  checkVerificationCode(Map<String, String> formData) async {
  //   return await NetworkHelper.repo("check_code","post",formData: formData,headerState: true);
  // }
  static Future  sendOtp(String phone , String type , String mail) async {
       Map<String,String> formData = {
      "mobile": "0$phone",
      "type": type,
      "email":mail 
    };
    return await NetworkHelper.repo("send-otp","post",formData: formData,headerState: true);
  }
 static Future  verifyOtp(String phone , String code ) async {
       Map<String,String> formData = {
      "mobile": "0$phone",
      "code": code
    };
    return await NetworkHelper.repo("verify-otp","post",formData: formData,headerState: true);
  }
 static Future profile() async {
    return await NetworkHelper.repo("get-user-info","get",formData: null,headerState: true);
  }
  static Future updateProfile(Map<String, String> formData) async {
    return await NetworkHelper.repo("update-profile","post",formData: formData,headerState: true);
  }

  static Future forgotPassword(Map<String, dynamic> formData) async {
    return await NetworkHelper.repo("change-password","post",formData: formData,headerState: true);
  }
   static Future resetPassword(Map<String, dynamic> formData) async {
    return await NetworkHelper.repo("reset-password","post",formData: formData,headerState: true);
  }

  static Future changePhone(Map<String, dynamic> formData) async {
    return await NetworkHelper.repo("change_phone","post",formData: formData,headerState: true);
  }

  static Future logout() async {
    return await NetworkHelper.repo("logout","post",formData: null,headerState: true);
  }
  static Future notifications(int page) async {
    return await NetworkHelper.repo("get-notifications?limit=100&page_number=$page","get",formData: null,headerState: true);
  }
  static Future contact(Map<String, dynamic> formData) async {
    return await NetworkHelper.repo("contact-support-feedback","post",formData: formData,headerState: true);
  }
  static Future jobInfo() async {
    return await NetworkHelper.repo("get-job-info","get",formData: null,headerState: true);
  }
  
  static Future privacyPolicy() async {
    return await NetworkHelper.repo("privacy-policy","get",formData: null,headerState: true);
  }
  static Future createBusinessAccount(formData,String procurement ,String commercialRegistration ,String bankStatementFor6Months ,String taxCertificate ,String identityOfTheOwnerOrOwnersImage ,String nationalAddress , ) async {
    String lang = await CashHelper.getSavedString("lang", "");
    if (kDebugMode) {
      print(formData);
      print("create-business-account");
      print(lang);
    }
    Map<String, String> headers = {
      "Accept": "application/json",
      "x-localization": lang
    };

    var request = http.MultipartRequest(
        "post", NetworkHelper.setApiNew("create-business-account"));
    request.headers.addAll(headers);

      request.files.add(await http.MultipartFile.fromPath(
          "procurement", procurement));
      request.files.add(await http.MultipartFile.fromPath(
          "commercial_registration", commercialRegistration));
      request.files.add(await http.MultipartFile.fromPath(
          "bank_statement_for_6_months", bankStatementFor6Months));
      request.files.add(await http.MultipartFile.fromPath(
          "tax_certificate", taxCertificate));
      request.files.add(await http.MultipartFile.fromPath(
          "identity_of_the_owner_or_owners_image", identityOfTheOwnerOrOwnersImage));
      request.files.add(await http.MultipartFile.fromPath(
          "national_address", nationalAddress));

    if (formData != null) {
      request.fields.addAll(formData);
    }
    var response = await request.send();
    final respStr = await response.stream.bytesToString();
    if (kDebugMode) {
      print("res$respStr");
    }
    Map<String, dynamic> mapResponse = await json.decode(respStr);
    return mapResponse;
  }
  
  static Future getCommercialActivitiesList() async {
    return await NetworkHelper.repo("get-commercial-activities-list","get",formData: null,headerState: true);
  }
  static Future  getCompaniesOrderTypesList() async {
    return await NetworkHelper.repo("get-companies-order-types-list","get",formData: null,headerState: true);
  }
    static Future  getClientCategoriesList() async {
    return await NetworkHelper.repo("get-client-categories-list","get",formData: null,headerState: true);
  }

      static Future  getSocialMedia() async {
    return await NetworkHelper.repo("get-social-media-links","get",formData: null,headerState: true);
  }
}