import 'package:flutter/material.dart';

class AppUI{

  static MaterialColor mainColor = const MaterialColor(0xff006AD8,{
    50:Color.fromRGBO(4,131,184, .1),
    100:Color.fromRGBO(4,131,184, .2),
    200:Color.fromRGBO(4,131,184, .3),
    300:Color.fromRGBO(4,131,184, .4),
    400:Color.fromRGBO(4,131,184, .5),
    500:Color.fromRGBO(4,131,184, .6),
    600:Color.fromRGBO(4,131,184, .7),
    700:Color.fromRGBO(4,131,184, .8),
    800:Color.fromRGBO(4,131,184, .9),
    900:Color.fromRGBO(4,131,184, 1),
  });
static Color mainColor1 = const Color(0xff006AD8);
  static Color secondColor = const Color(0xffDEEBF9);
  static Color offerColor = const Color(0xffAA9612);
  static Color whiteColor = const Color(0xffffffff);
  static Color blackColor = const Color(0xff000000);
  static Color? iconColor = Colors.grey[500];
  static Color greyColor = Colors.grey;
  static Color titleColor = const Color(0xff091355);
  static Color backgroundColor = const Color(0xffFBFBFB);
  static Color activeColor = const Color(0xff60C42F); 
  static Color darkActiveColor = const Color(0xff0F5E09); 
  
  static Color shimmerColor = Colors.grey[350]!;
  static Color errorColor = Colors.red;
  static Color errorLiteColor = const Color(0xffFBE9E9);
  static Color backgroundNavColor = const Color(0xff0A1125);

  static String googleApiAndroid = "AIzaSyD38YQy10FmPig_gdVZAaFmbYh9znMoPds";
  static String googleApiIOS = "AIzaSyCT0kQS59FPeZtL9tRvshyGDz1iToySVo0";

  static String imgPath = "assets/images/";
  static String iconPath = "assets/icons/";
}