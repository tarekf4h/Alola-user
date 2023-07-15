// import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:toast/toast.dart';
// import 'package:toast/toast.dart';
import 'package:another_flushbar/flushbar.dart';

import '../shared/cash_helper.dart';
import '../shared/components.dart';
import 'app_ui.dart';

class AppUtil {
  static String Lang = "en";
  static bool isLogin = false;
  static String name = "";
  static String address = "";
  static double responsiveHeight(context) => MediaQuery.of(context).size.height;
  static double responsiveWidth(context) => MediaQuery.of(context).size.width;
  static mainNavigator(context, screen) => Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => screen));
  static removeUntilNavigator(context, screen) =>
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => screen), (route) => false);
  static replacementNavigator(context, screen) => Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (context) => screen));

  static bool rtlDirection(context) {
    return EasyLocalization.of(context)!.currentLocale == const Locale('en')
        ? false
        : true;
  }

// Get current location
  static Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  // toast msg
  static successToast(context, msg) {
    ToastContext().init(context);
    Toast.show(
      msg,
      duration: 3,
      gravity: 1,
      textStyle: TextStyle(color: AppUI.whiteColor),
      backgroundColor: AppUI.activeColor,
    );
  }

  static errorToast1(context, msg) {
    ToastContext().init(context);
    Toast.show(msg,
        duration: 3,
        gravity: 1,
        textStyle: TextStyle(color: AppUI.whiteColor),
        backgroundColor: AppUI.errorColor);
  }

  static errorToast(context, msg) {
    // ToastContext().init(context);
    // Toast.show(msg,duration: 3,gravity: 1,textStyle: TextStyle(color: AppUI.whiteColor),backgroundColor: AppUI.errorColor);

    Flushbar(
      messageText: Row(
        children: [
          SizedBox(
              // width: AppUtil.responsiveWidth(context)*0.78,
              child: CustomText(
            text: msg,
            color: AppUI.whiteColor,
          )),
          const Spacer(),
          Icon(
            Icons.close,
            color: AppUI.whiteColor,
          )
        ],
      ),
      messageColor: AppUI.whiteColor,
      messageSize: 18,
      // titleColor: AppUI.mainColor,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      // maxWidth: double.infinity,
      isDismissible: true,
      duration: const Duration(seconds: 3),
      flushbarPosition: FlushbarPosition.TOP,
      barBlur: .1,
      backgroundColor: AppUI.errorColor,
      borderColor: AppUI.errorColor,
      margin: const EdgeInsets.all(8),
      borderRadius: BorderRadius.circular(10),
    ).show(context);
  }

//  static  checkLogin(context ) async {
//       String id = await CashHelper.getSavedString("id", "");
//      if(id != ""){
//       AuthCubit.get(context).loginStatus = true;
//       return true;
//       }else {
//         AuthCubit.get(context).loginStatus = false;
//         return  false ;
//       }

// }

  static dialog2(context, title, List<Widget> dialogBody,
      {barrierDismissible = true}) async {
    return await showDialog(
        context: context,
        barrierDismissible: barrierDismissible,
        builder: (context) {
          return AlertDialog(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            title: Center(
                child: CustomText(
              text: title,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.bold,
            )),
            content: SingleChildScrollView(
              child: ListBody(
                children: dialogBody,
              ),
            ),
          );
        });
  }

  static dialog(context, title, List<Widget> dialogBody,
      {barrierDismissible = true}) async {
    return await showDialog(
        context: context,
        barrierDismissible: barrierDismissible,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            title: CustomText(
              text: title,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.bold,
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: dialogBody,
              ),
            ),
          );
        });
  }

  static bottomDialog(context, title, List<Widget> dialogBody,
      {barrierDismissible = true, alignment, color}) async {
    return await showGeneralDialog(
        context: context,
        barrierDismissible: barrierDismissible,
        barrierLabel: "",
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return AlertDialog(
            alignment: alignment ?? Alignment.center,
            backgroundColor: color ?? AppUI.whiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
            title: CustomText(
              text: title,
              color: AppUI.blackColor,
            ),
            insetPadding: EdgeInsets.zero,
            titlePadding: const EdgeInsets.all(5),
            contentPadding: EdgeInsets.zero,
            content: Builder(builder: (context) {
              return SingleChildScrollView(
                child: ListBody(
                  children: dialogBody,
                ),
              );
            }),
          );
        });
  }

  static bottomSheet(context, Widget view) async {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        context: context,
        builder: (BuildContext context) {
          return view;
          //     return BottomSheet(
          //       shape: RoundedRectangleBorder(
          //    borderRadius: BorderRadius.only(topLeft: Radius.circular(20) , topRight: Radius.circular(20)),),
          //     onClosing: () {},
          //     builder: (BuildContext context) {

          // return StatefulBuilder(builder: (BuildContext context, StateSetter mystate) {
          // return view;
          // });});
        });
  }

  static Future<void> initNotification() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    messaging.requestPermission();

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  static Future<void> showPushNotification(context) async {
    // FirebaseMessaging.onMessage.listen((event) async {
    //   Flushbar(
    //     message: event.notification!.body ,
    //     title: event.notification!.title,
    //     messageColor: Colors.white,
    //     titleColor: Colors.white,
    //     textDirection: ui.TextDirection.rtl,
    //     padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 20),
    //     // maxWidth: double.infinity,
    //     isDismissible: true,
    //     duration: const Duration(seconds: 5),
    //     flushbarPosition: FlushbarPosition.TOP,
    //     barBlur: .1,
    //     backgroundColor: AppUI.mainColor,
    //     borderColor: Colors.white,
    //     margin: const EdgeInsets.all(8),
    //     borderRadius: BorderRadius.circular(8),
    //   ).show(context);
    // await HomeCubit.get(context).notification();
    // });
  }

  static getToken() async {
    String? fcm = await FirebaseMessaging.instance.getToken();
    print(fcm);
    return fcm;
  }
}
