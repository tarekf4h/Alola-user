import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../shared/components.dart';

class SendUsScreen extends StatefulWidget {
  const SendUsScreen({Key? key}) : super(key: key);

  @override
  State<SendUsScreen> createState() => _SendUsScreenState();
}

class _SendUsScreenState extends State<SendUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "Send us".tr() , centerTitle: true , elevation: 0.5),
      body: Padding(padding: EdgeInsets.all(20),
      child: ListView(children: [
        SizedBox(height: 10,),
                     Container(child: CustomInput(controller: TextEditingController(), textInputType: TextInputType.text , lable: "email".tr(),)),
                     SizedBox(height: 10,),
                     Container(child: CustomInput(controller: TextEditingController(), textInputType: TextInputType.text , lable: "Message title".tr(),)),
                     SizedBox(height: 10,),
                     Container(child: CustomInput(controller: TextEditingController(), textInputType: TextInputType.text , lable: "Note".tr(), maxLines: 4,)),
                     SizedBox(height: 10,),
      ],),
      ),
      bottomNavigationBar: Container(height: 90,child: Padding(padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20) , child: CustomButton(text: "send".tr(),),)),

    );
  }
}