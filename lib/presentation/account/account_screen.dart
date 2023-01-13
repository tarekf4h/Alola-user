import 'package:adelco_user/presentation/account/language_screen.dart';
import 'package:adelco_user/presentation/account/support_screen.dart';
import 'package:adelco_user/presentation/account/usage_policy_screen.dart';
import 'package:adelco_user/shared/components.dart';
import 'package:adelco_user/utilities/app_util.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';

import '../../utilities/app_ui.dart';
import '../map/address_screen.dart';
import '../payment/all_card_screen.dart';
import 'account_info_screen.dart';
import 'favorite_screen.dart';

class AccountsScreen extends StatefulWidget {
  const AccountsScreen({Key? key}) : super(key: key);

  @override
  State<AccountsScreen> createState() => _AccountsScreenState();
}

class _AccountsScreenState extends State<AccountsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "My account".tr() , centerTitle: true ,  elevation: 0.5),
      body: 
      // Expanded(child:  ListView(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(child: 
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16,),
              InkWell(child: AarrowContainer(img:"user" ,title: "Account info".tr(),),onTap: () {
                AppUtil.mainNavigator(context, AccountInfoScreen());
              },),
             SizedBox(height: 16,),
            InkWell(child: AarrowContainer(img:"bookmark" ,title: "Favorite".tr(),),onTap: () {
              AppUtil.mainNavigator(context, FavoriteScreen());
                
              },),
             SizedBox(height: 16,),
             InkWell(child: AarrowContainer(img:"headphones" ,title: "Support".tr(),),onTap: () {
              AppUtil.mainNavigator(context, SupportScreen());
                
              },),
             SizedBox(height: 16,),
             InkWell(child: AarrowContainer(img:"world" ,title: "Language".tr(),),onTap: () {
                showModalBottomSheet(
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.only(topLeft: Radius.circular(20) , topRight: Radius.circular(20)),),
            context: context,
            builder: (BuildContext context) {
              return BottomSheet(
                shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.only(topLeft: Radius.circular(20) , topRight: Radius.circular(20)),),
              onClosing: () {},
              builder: (BuildContext context) {
              var type = 0 ;
          return StatefulBuilder(builder: (BuildContext context, StateSetter mystate) {
          return LanguageScreen();
          });});});
              },),
             SizedBox(height: 16,),
             InkWell(child: AarrowContainer(img:"markr" ,title: "Addressees".tr(),),onTap: () {
               AppUtil.mainNavigator(context, AddressScreen());
                
              },),
             SizedBox(height: 16,),
             InkWell(child: AarrowContainer(img:"card" ,title: "Payment Cards".tr(),),onTap: () {
              AppUtil.mainNavigator(context, AllCardScreen());
                
              },),
             SizedBox(height: 16,),
             InkWell(child: AarrowContainer(img:"shield-check" ,title: "Usage Policy".tr(),),onTap: () {
              AppUtil.mainNavigator(context, UsagePolicyScreen());
                
              },),
             SizedBox(height: 16,),
             InkWell(child: AarrowContainer(img:"login" ,title: "Logout".tr(),),onTap: () {
                
              },),
             SizedBox(height: 16,),
            ],
          ),),
        )
        
           

      // ],),
      
      
    );
  }
}



