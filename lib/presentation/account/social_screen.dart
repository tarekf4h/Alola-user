import 'package:adelco_user/utilities/app_ui.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../shared/components.dart';

class SocialScreen extends StatefulWidget {
  const SocialScreen({Key? key}) : super(key: key);

  @override
  State<SocialScreen> createState() => _SocialScreenState();
}

class _SocialScreenState extends State<SocialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: customAppBar(title: "Social media accounts".tr() , centerTitle: true , elevation: 0.5),
    body: Padding(padding: EdgeInsets.symmetric(horizontal: 20 , vertical: 20),
    child: Column(children: [
      CustomText(text: "You can contact us through:You can contact us through:".tr() ,color: AppUI.blackColor,fontSize: 18,),
      SizedBox(height: 30,),
      Center(child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
                     '${AppUI.imgPath}facebook.png',
                     width: 50,
                     height: 50,),
                     SizedBox(width: 20,),
                     Image.asset(
                     '${AppUI.imgPath}twitter.png',
                     width: 50,
                     height: 50,),
                     SizedBox(width: 20,),
                     Image.asset(
                     '${AppUI.imgPath}whatsapp.png',
                     width: 50,
                     height: 50,),
                     
        ],
      ),)

    ],)
    ,),
    );
  }
}