import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../shared/components.dart';
import '../../../utilities/app_ui.dart';

class CompanyData3 extends StatefulWidget {
  const CompanyData3({Key? key}) : super(key: key);

  @override
  State<CompanyData3> createState() => _CompanyData3State();
}

class _CompanyData3State extends State<CompanyData3> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: ListView(
        children: [
         SizedBox(height: 15,),
         CustomText(text: "The main attachments to accept the applicationt" , fontSize: 16, fontWeight: FontWeight.w700,color: AppUI.titleColor,),
         SizedBox(height: 15,),
         InkWell(onTap: () {
           
         },
          child: CustomeCompanyData(mainTitel: "Procurement form with company stamp",),),
         SizedBox(height: 10,),
         InkWell(onTap: () {
           
         },
          child: CustomeCompanyData(mainTitel: "Photocopy Commercial registration",),),
          SizedBox(height: 10,),
          InkWell(onTap: () {
           
         },
          child: CustomeCompanyData(mainTitel: "Bank statement for 6 months",),),
          SizedBox(height: 10,),
          InkWell(onTap: () {
           
         },
          child: CustomeCompanyData(mainTitel: "Photocopy of tax certificate",),),
          SizedBox(height: 10,),
          InkWell(onTap: () {
           
         },
          child: CustomeCompanyData(mainTitel: "Photocopy of the identity of the owner or the owners",),),
          SizedBox(height: 10,),
          InkWell(onTap: () {
           
         },
          child: CustomeCompanyData(mainTitel: "Photocopy of the national address",),),
          SizedBox(height: 15,),
          CustomText(text: "Company location".tr() , fontSize: 16, fontWeight: FontWeight.w700,color: AppUI.titleColor,),
          SizedBox(height: 15,),
          SelectLocationContainer(),
          SizedBox(height: 10,),
         Container(width: 300,child: CustomInput(controller: TextEditingController(), textInputType: TextInputType.text , lable: "Street name".tr() ,)),
         SizedBox(height: 10,),
         Row(children: [
          Expanded(child: CustomInput(controller: TextEditingController(), textInputType: TextInputType.number , lable: "Block number".tr() ,),),
          SizedBox(width: 10,),
          Expanded(child: CustomInput(controller: TextEditingController(), textInputType: TextInputType.number , lable: "Flat number".tr() ,),),
          ],),
         SizedBox(height: 10,),
         Container(width: 300,child: CustomInput(controller: TextEditingController(), textInputType: TextInputType.text , lable: "Special marque".tr(),)),
         SizedBox(height: 15,),
        ],

      ),
    );
  }
}