import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../shared/components.dart';
import '../../../utilities/app_ui.dart';

class CompanyData4 extends StatefulWidget {
  const CompanyData4({Key? key}) : super(key: key);

  @override
  State<CompanyData4> createState() => _CompanyData4State();
}

class _CompanyData4State extends State<CompanyData4> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: ListView(
        children: [
          CustomText(text: "Account details" , fontSize: 16, fontWeight: FontWeight.w700,color: AppUI.titleColor,),
          SizedBox(height: 10,),
          Container(width: 300,child: CustomInput(controller: TextEditingController(), textInputType: TextInputType.phone , lable: "Phone".tr() ,)),
          SizedBox(height: 10,),
          Container(width: 300,child: CustomInput(controller: TextEditingController(), textInputType: TextInputType.text , lable: "Password".tr(),obscureText:true ,)),
          SizedBox(height: 10,),
          Container(width: 300,child: CustomInput(controller: TextEditingController(), textInputType: TextInputType.phone , lable: "Confirm password".tr(),obscureText:true)),
         
         
        ],

      ),
    );
  }
}