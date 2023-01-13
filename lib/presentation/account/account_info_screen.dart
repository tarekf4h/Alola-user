import 'package:adelco_user/shared/components.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AccountInfoScreen extends StatefulWidget {
  const AccountInfoScreen({Key? key}) : super(key: key);

  @override
  State<AccountInfoScreen> createState() => _AccountInfoScreenState();
}

class _AccountInfoScreenState extends State<AccountInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "Account info".tr() ,  centerTitle:  true ,elevation: 00.5,  actions:[ Center(child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: CustomText(text: "Update".tr() , fontWeight: FontWeight.bold,),
      ))]),
      body: Padding(padding: EdgeInsets.all(20),
      child: ListView(children: [
        SizedBox(height: 10,),
                     Container(child: CustomInput(controller: TextEditingController(), textInputType: TextInputType.text , lable: "Name".tr(),)),
                     SizedBox(height: 10,),
                     Container(child: CustomInput(controller: TextEditingController(), textInputType: TextInputType.text , lable: "Phone".tr(),)),
                     SizedBox(height: 10,),
                     Container(child: CustomInput(controller: TextEditingController(), textInputType: TextInputType.text , lable: "email".tr(),)),
                     SizedBox(height: 10,),
      ],),
      ),
    );
  }
}