import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../shared/components.dart';
import '../../../utilities/app_ui.dart';

class CompanyData2 extends StatefulWidget {
  const CompanyData2({Key? key}) : super(key: key);

  @override
  State<CompanyData2> createState() => _CompanyData2State();
}

class _CompanyData2State extends State<CompanyData2> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: ListView(
        children: [
         SizedBox(height: 15,),
         CustomText(text: "Banks dealing with it".tr() , fontSize: 16, fontWeight: FontWeight.w700,color: AppUI.titleColor,),
         SizedBox(height: 15,),
         Container(width: 300,child: CustomInput(controller: TextEditingController(), textInputType: TextInputType.text , lable: "Bank name".tr() ,)),
         SizedBox(height: 10,),
         Container(width: 300,child: CustomInput(controller: TextEditingController(), textInputType: TextInputType.text , lable: "Branch".tr() ,)),
         SizedBox(height: 10,),
         Container(width: 300,child: CustomInput(controller: TextEditingController(), textInputType: TextInputType.phone , lable: "Account number".tr(),)),
         SizedBox(height: 15,),
         CustomText(text: "Commercial references or suppliers".tr() , fontSize: 16, fontWeight: FontWeight.w700,color: AppUI.titleColor,),
         SizedBox(height: 15,),
         Container(width: 300,child: CustomInput(controller: TextEditingController(), textInputType: TextInputType.text , lable: "Company".tr(),)),
         SizedBox(height: 10,),
         Container(width: 300,child: CustomInput(controller: TextEditingController(), textInputType: TextInputType.text , lable: "Responsible person".tr(),)),
         SizedBox(height: 10,),
         Container(width: 300,child: CustomInput(controller: TextEditingController(), textInputType: TextInputType.phone , lable: "Phone".tr(),)),
         SizedBox(height: 10,),
         Container(width: 300,child: CustomInput(controller: TextEditingController(), textInputType: TextInputType.phone , lable: "Tax Number".tr() ,)),
         SizedBox(height: 15,),
         CustomText(text: "The manager or directors".tr() , fontSize: 16, fontWeight: FontWeight.w700,color: AppUI.titleColor,),
         SizedBox(height: 15,),
         Container(width: 300,child: CustomInput(controller: TextEditingController(), textInputType: TextInputType.text , lable: "Name".tr() ,)),
         SizedBox(height: 10,),
         Container(width: 300,child: CustomInput(controller: TextEditingController(), textInputType: TextInputType.phone , lable: "Direct phone number".tr() ,)),
         SizedBox(height: 10,),
         Container(width: 300,child: CustomInput(controller: TextEditingController(), textInputType: TextInputType.phone , lable: "Phone".tr() ,)),
         SizedBox(height: 10,),
 
        ],

      ),
    );
    
  }
}