import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';

import '../../shared/cash_helper.dart';
import '../../utilities/app_ui.dart';
import '../../utilities/app_util.dart';
import '../auth/login_screen.dart';
import '../bottom_nav/bottom_nav_tabs_screen.dart';
import '../onboarding/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 6),() async {
    AppUtil.Lang = await CashHelper.getSavedString("lang", "") == "" ? "ar":AppUtil.Lang ;
    AppUtil.address =  await CashHelper.getSavedString("address", "");
    print("${AppUtil.Lang} splashhhhhhh" );
    // AppUtil.replacementNavigator(context, const LoginScreen());
        String id = await CashHelper.getSavedString("id", "");
       if(id != ""){ 
      AppUtil.isLogin = true;
      AppUtil.replacementNavigator(context,  BottomNavTabsScreen());
     }else{
      AppUtil.replacementNavigator(context,  OnboardingScreen());
     }

    });
  }

  @override
  Widget build(BuildContext context) {
  return 
  Image.asset(
  '${AppUI.imgPath}logo.gif',
  fit: BoxFit.fill,
);
  }
}