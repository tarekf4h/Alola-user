import 'package:adelco_user/shared/components.dart';
import 'package:adelco_user/utilities/app_ui.dart';
import 'package:date_field/date_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CompanyData extends StatefulWidget {
  const CompanyData({Key? key}) : super(key: key);

  @override
  State<CompanyData> createState() => _CompanyDataState();
}

class _CompanyDataState extends State<CompanyData> {
  var list = [
    {"name": "IT", "id": "12"},
    {"name": "HR", "id": "14"},
    {"name": "Engineering", "id": "17"},
  ];
  List<DropdownMenuItem<String>> dropdownItems = [];
  String selectedCurrency = 'IT';
  @override
  void initState() {
    super.initState();

    dropdownItems = List.generate(
      list.length,
      (index) => DropdownMenuItem(
        value: list[index]["id"],
        child: Text(
         "${list[index]["name"]}",
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {

  String dropdownvalue = 'Item 1'; 
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: ListView(
        children: [
          CustomText(text: "Company Data" , fontSize: 16, fontWeight: FontWeight.w700,color: AppUI.titleColor,),
          SizedBox(height: 10,),
          Container(width: 300,child: CustomInput(controller: TextEditingController(), textInputType: TextInputType.text , lable: "Company name".tr() ,)),
          SizedBox(height: 10,),
          Container(width: 300,child: CustomInput(controller: TextEditingController(), textInputType: TextInputType.text , lable: "Commercial activity".tr() ,)),
          SizedBox(height: 10,),
          Container(width: 300,child: CustomInput(controller: TextEditingController(), textInputType: TextInputType.phone , lable: "Commercial Registration No".tr(),)),
          SizedBox(height: 10,),
         CustomDateTimeFormField (label: "Select date" ,onDateSelected: (p0) {
           print(p0);
         },),
         SizedBox(height: 10,),
         CustomDropdownButtonFormField(items:dropdownItems ,label: "Request type",onChanged: (p0) {
          print(p0);
         },),
         
         SizedBox(height: 10,),
         CustomDropdownButtonFormField(items:dropdownItems ,label: "Activity",onChanged: (p0) {
          print(p0);
         },),
         SizedBox(height: 10,),
         Container(width: 300,child: CustomInput(controller: TextEditingController(), textInputType: TextInputType.phone , lable: "PO Box".tr(),)),
         SizedBox(height: 10,),
         Container(width: 300,child: CustomInput(controller: TextEditingController(), textInputType: TextInputType.text , lable: "City".tr(),)),
         SizedBox(height: 10,),
         Container(width: 300,child: CustomInput(controller: TextEditingController(), textInputType: TextInputType.phone , lable: "Postal code".tr(),)),
         SizedBox(height: 10,),
         Container(width: 300,child: CustomInput(controller: TextEditingController(), textInputType: TextInputType.phone , lable: "Phone".tr() ,)),
         SizedBox(height: 10,),
         Container(width: 300,child: CustomInput(controller: TextEditingController(), textInputType: TextInputType.phone , lable: "Fax".tr() ,)),
         SizedBox(height: 10,),
         Container(width: 300,child: CustomInput(controller: TextEditingController(), textInputType: TextInputType.emailAddress , lable: "Email".tr() ,)),
         SizedBox(height: 10,),
         Container(width: 300,child: CustomInput(controller: TextEditingController(), textInputType: TextInputType.text , lable: "Location".tr() ,)),
         SizedBox(height: 10,),
         CustomDropdownButtonFormField(items:dropdownItems ,label: "Customer activity",onChanged: (p0) {
          print(p0);
         },),
        ],

      ),
    );
    
  }
}

