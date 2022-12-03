// import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:toast/toast.dart';
// import 'package:toast/toast.dart';

import '../shared/cash_helper.dart';
import '../shared/components.dart';
import 'app_ui.dart';

class AppUtil{

  static double responsiveHeight (context)=> MediaQuery.of(context).size.height;
  static double responsiveWidth (context)=> MediaQuery.of(context).size.width;
  static mainNavigator (context,screen)=> Navigator.of(context).push(MaterialPageRoute(builder: (context) => screen));
  static removeUntilNavigator (context,screen)=> Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => screen), (route) => false);
  static replacementNavigator (context,screen)=> Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => screen));

  static bool rtlDirection(context){
    return EasyLocalization.of(context)!.currentLocale==const Locale('en')?false:true;
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
static successToast(context,msg){
  ToastContext().init(context);
  Toast.show(msg,duration: 3,gravity: 1,textStyle: TextStyle(color: AppUI.whiteColor),backgroundColor: AppUI.activeColor,);
}

static errorToast(context,msg){
  ToastContext().init(context);
  Toast.show(msg,duration: 3,gravity: 1,textStyle: TextStyle(color: AppUI.whiteColor),backgroundColor: AppUI.errorColor);
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


  static dialog(context,title,List<Widget> dialogBody,{barrierDismissible=true})async{
    return await showDialog(context: context,barrierDismissible: barrierDismissible, builder: (context){
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        title: CustomText(text: title,textAlign: TextAlign.center,fontWeight: FontWeight.bold,),
        content: SingleChildScrollView(
          child: ListBody(
            children: dialogBody,
          ),
        ),
      );
    });
  }

  static bottomDialog(context,title,List<Widget> dialogBody,{barrierDismissible=true,alignment,color})async{
    return await showGeneralDialog(context: context,barrierDismissible: barrierDismissible,barrierLabel: "", pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
      return AlertDialog(
        alignment: alignment??Alignment.center,
        backgroundColor: color??AppUI.whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        title: CustomText(text: title,color: AppUI.blackColor,),
        insetPadding: EdgeInsets.zero,
        titlePadding: const EdgeInsets.all(5),
        contentPadding: EdgeInsets.zero,

        content: Builder(
            builder: (context) {
              return SingleChildScrollView(
                child: ListBody(
                  children: dialogBody,
                ),
              );
            }
        ),
      ); });
  }
}