import 'package:adelco_user/presentation/account/send_us_screen.dart';
import 'package:adelco_user/presentation/account/social_screen.dart';
import 'package:adelco_user/utilities/app_ui.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../shared/components.dart';
import '../../utilities/app_util.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({Key? key}) : super(key: key);

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "Support".tr() , centerTitle: true , elevation: 0.5),
      body: Padding(padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            SizedBox(height: 20,),
            InkWell(child: AarrowContainer(padding: 16,img:"envelope" ,title: "Send us".tr(), border: true,arrowColor: AppUI.mainColor,),onTap: () {
              AppUtil.mainNavigator(context, SendUsScreen());
                
              },),
              SizedBox(height: 16,),
              InkWell(child: AarrowContainer( padding: 16,img:"megaphone" ,title: "Social media accounts".tr(), border: true,arrowColor: AppUI.mainColor),onTap: () {
              AppUtil.mainNavigator(context, SocialScreen());
                
              },),
      ],)
      ),
    );
  }
}