import 'package:adelco_user/shared/components.dart';
import 'package:adelco_user/utilities/app_util.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../utilities/app_ui.dart';
import 'locations_screen.dart';


class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({Key? key}) : super(key: key);

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "Add a new delivery location".tr(),centerTitle: true , elevation: 0.5),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: ListView(
          children: [
          SizedBox(height: 15,),
          CustomText(text: "Select your location".tr() , fontSize: 16, fontWeight: FontWeight.w700,color: AppUI.titleColor,),
          SizedBox(height: 15,),
          InkWell(child: SelectLocationContainer(), onTap: () {
            AppUtil.mainNavigator(context, LocationsScreen(),);
          },),
          
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
      ),
      );
    
  }
}