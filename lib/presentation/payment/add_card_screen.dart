import 'package:adelco_user/utilities/app_util.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';

import '../../shared/components.dart';
import '../../utilities/app_ui.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({Key? key}) : super(key: key);

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  bool v = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "Payment".tr() , elevation: 0.5 , centerTitle: true),
      body: Padding(padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: ListView(
        children: [
          SizedBox(height: 10,),
          Row( 
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             Image.asset("${AppUI.imgPath}hsbc.png", width: AppUtil.responsiveWidth(context)*0.15),
             SizedBox(width: 5,),
             Image.asset("${AppUI.imgPath}american-express.png", width: AppUtil.responsiveWidth(context)*0.15),
             SizedBox(width: 5,),
             Image.asset("${AppUI.imgPath}paypal.png", width: AppUtil.responsiveWidth(context)*0.15),
             SizedBox(width: 5,),
             SvgPicture.asset("${AppUI.iconPath}visa.svg", width: AppUtil.responsiveWidth(context)*0.15),
          ],),
          SizedBox(height: 30,),
           Container(child: CustomInput(controller: TextEditingController(), textInputType: TextInputType.text , lable: "Card holder name".tr() ,)),
          SizedBox(height: 10,),
           Container(child: CustomInput(controller: TextEditingController(), textInputType: TextInputType.name , lable: "Card number".tr() ,)),
          SizedBox(height: 10,),
          Row(children: [
          Expanded(child: CustomInput(controller: TextEditingController(), textInputType: TextInputType.number , lable: "Expiry".tr() ,),),
          SizedBox(width: 10,),
          Expanded(child: CustomInput(controller: TextEditingController(), textInputType: TextInputType.number , lable: "CVV".tr() ,),),
          ],),
          SizedBox(height: 10,),
          Row(children: [
            Checkbox(
              activeColor: AppUI.mainColor,
              value: v, 
              onChanged: ((value) {
            this.v = !v;
            setState(() {
              
            });
          })),
          CustomText(text: "The card will be saved for future use".tr() , fontSize: 12, color: AppUI.blackColor)
          ],),
          SizedBox(height: 10,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            SvgPicture.asset("${AppUI.iconPath}verifiedUser.svg",),
            SizedBox(width: 10,),
            Expanded(child: 
            CustomText(text: "We may send a confirmation message to your registered mobile number and your card will be credited once authenticated. Or your card will be verified by putting a small amount on hold, and that amount will be released automatically. All your card details are kept safe and secure.".tr() , fontSize: 12, color: AppUI.blackColor))
          ],),
          SizedBox(height: 30,),
          CustomButton(text: "Add".tr(), radius: 15,)
      ],),),


    );
    
  }
}