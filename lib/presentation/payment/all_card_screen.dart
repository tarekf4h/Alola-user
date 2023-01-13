import 'package:adelco_user/presentation/payment/add_card_screen.dart';
import 'package:adelco_user/shared/components.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utilities/app_ui.dart';
import '../../utilities/app_util.dart';

class AllCardScreen extends StatefulWidget {
  final int? typeView;
  const AllCardScreen({Key? key , this.typeView}) : super(key: key);

  @override
  State<AllCardScreen> createState() => _AllCardScreenState();
}

class _AllCardScreenState extends State<AllCardScreen> {
  String? pay;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title:  "Payment".tr() , elevation: 0.5 , centerTitle: true),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

        Container(height: 80,child: Center(child: CustomText(text: "500",fontSize: 32,fontWeight: FontWeight.w600,),),),
        SizedBox(height: 10,),
        Expanded(
          child: 
        ListView.separated(
                    separatorBuilder: (context, index) {
                      return  Divider(
                        color: AppUI.shimmerColor.withOpacity(0),
                        thickness: 0,
                      );
                    },
                    scrollDirection: Axis.vertical,
                    itemCount: 2,
                    itemBuilder: (context, count) {
                      final item = count;
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                  height: 45,
                decoration: BoxDecoration(
                 color: AppUI.whiteColor,
                 border: Border.all(color: AppUI.shimmerColor),
                 borderRadius: BorderRadius.circular(8),),
                  padding: EdgeInsets.all(8),
          child: Row(
          children: [
                Radio(
                  activeColor: AppUI.mainColor,
                    value: "$item", 
                    groupValue: pay, 
                    onChanged: (value){
                      setState(() {
                          pay = value.toString();
                      });
                    },
                ),
          SvgPicture.asset("${AppUI.iconPath}visa.svg"),
          SizedBox(width: 5,),
          
          CustomText(text: "122342535534" , color: AppUI.blackColor, fontSize: 12,),
         ],),);
        })),
        // Expanded(
        //   flex: 2,
          // child: 
        InkWell(child:  Container(height: 50,width: AppUtil.responsiveWidth(context),
       decoration: BoxDecoration(
                 border: Border.all(color: AppUI.shimmerColor ,width: 0.5),
                 ),
      child:  Row(
          children: [
           SizedBox(width: 10,),
          SvgPicture.asset("${AppUI.iconPath}card.svg"),
          SizedBox(width: 5,),
          
          CustomText(text: "Add a new payment card".tr() , color: AppUI.blackColor,fontWeight: FontWeight.w700, fontSize: 12,),
         ],),),
         onTap: () {
           AppUtil.mainNavigator(context, AddCardScreen());
         }, 
        )
      // ),
      // Expanded(flex: 0,child: Container()),
         
        


      ],),
      bottomNavigationBar:  Container(
        decoration: BoxDecoration( border:Border.all(color: AppUI.shimmerColor ,width: 0.5) ),
        height:  70,
        width: AppUtil.responsiveWidth(context),
        child: Padding(padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Center(child: CustomButton(text: "Payment confirmation".tr() , radius: 15,),)
        )
        ) ,


    );
    
  }
}