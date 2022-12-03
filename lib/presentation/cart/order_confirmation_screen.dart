// OrderConfirmationScreen

import 'package:adelco_user/shared/components.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';

import '../../utilities/app_ui.dart';
import '../../utilities/app_util.dart';
import '../map/select_address_bottom_sheet.dart';
import 'cart_bottom_sheet.dart';

class OrderConfirmationScreen extends StatefulWidget {
  const OrderConfirmationScreen({Key? key}) : super(key: key);

  @override
  State<OrderConfirmationScreen> createState() => _OrderConfirmationScreenState();
}

class _OrderConfirmationScreenState extends State<OrderConfirmationScreen> {
  String? gender;
  String? pay;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "Order details", centerTitle: true , elevation: 0.5),
      body: ListView(
        children: [
           Padding(
             padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
             child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: "Products" ,fontSize: 16,fontWeight: FontWeight.w700, color: AppUI.blackColor,),
                  InkWell(onTap: () {
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
          return CartBottomSheet();
          });});});
                 },
                 child: CustomText(text: "Show".tr() , fontSize: 14,color: AppUI.mainColor,fontWeight: FontWeight.w700,) ,
                 ),
              ],),
           ),
              Container(
                    height:180,
                child: GridView.builder(
                 shrinkWrap : false,
                    primary: false,
                    itemCount: 20,
                    scrollDirection:Axis.horizontal,
                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                 crossAxisCount: 1,
                 crossAxisSpacing : 5 ,
                 mainAxisSpacing: 10 ,
                 childAspectRatio  : 1/0.7,
                 
           ),
          itemBuilder: (BuildContext context, int index) { 
            return  Container(
                      width: 90,
                      height: 170,
                      decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppUI.whiteColor,
                                   border:Border.all(color: AppUI.shimmerColor)
                                  ),
                      child: Column(
                        children: [
                          SizedBox(height: 10,),
                          Image.asset("${AppUI.imgPath}milk.png",height: 80,width: 80),
                          SizedBox(height: 10,),
                          Container(
                            margin: EdgeInsets.all(5.0),
                            child: Center(child: CustomText(text: "1",color: AppUI.whiteColor,)),
                            decoration: BoxDecoration(
                            color: AppUI.mainColor,
                             shape: BoxShape.circle
                           )
                          ),
                         CustomText(text: "Text",color: AppUI.blackColor,)

                        ],

                      ),
                      );
            },
            ),
            ),
            Padding(padding: EdgeInsets.fromLTRB(10, 20, 10, 20),child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(text: "Delivery location",fontSize: 16,fontWeight: FontWeight.w400,color: AppUI.blackColor,),
                SizedBox(height: 10,),
                InkWell(child:  SelectLocationContainer(), onTap: (){
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
          return  SelectAddressBottomSheet();
          });});});

                },),
                SizedBox(height: 10,),
                CustomText(text: "Delivery time",fontSize: 16,fontWeight: FontWeight.w400,color: AppUI.blackColor,),
                SizedBox(height: 10,),
                Container(
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
                    value: "male", 
                    groupValue: gender, 
                    onChanged: (value){
                      setState(() {
                          gender = value.toString();
                      });
                    },
                ),
          SvgPicture.asset("${AppUI.iconPath}sun.svg"),
          SizedBox(width: 5,),
          
          CustomText(text: "Morning time".tr() , color: AppUI.blackColor, fontSize: 12,),
         ],),),
         SizedBox(height: 10,),
          Container(
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
                    value: "l", 
                    groupValue: gender, 
                    onChanged: (value){
                      setState(() {
                          gender = value.toString();
                      });
                    },
                ),
          SvgPicture.asset("${AppUI.iconPath}moon.svg"),
          SizedBox(width: 5,),
          
          CustomText(text: "Evening time".tr() , color: AppUI.blackColor, fontSize: 12,),
         ],),),
         SizedBox(height: 10,),
         CustomText(text: "Promo code",fontSize: 16,fontWeight: FontWeight.w400,color: AppUI.blackColor,),
         SizedBox(height: 10,),
         CustomInput(controller: TextEditingController(), textInputType: TextInputType.text ,lable: "Promo code", prefixIcon: Container(padding: EdgeInsets.all(13),child: SvgPicture.asset("${AppUI.iconPath}ticket.svg")) ,),
         SizedBox(height: 10,),
                CustomText(text: "Payment type",fontSize: 16,fontWeight: FontWeight.w400,color: AppUI.blackColor,),
                SizedBox(height: 10,),
                Container(
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
                    value: "male", 
                    groupValue: pay, 
                    onChanged: (value){
                      setState(() {
                          pay = value.toString();
                      });
                    },
                ),
          SvgPicture.asset("${AppUI.iconPath}money.svg"),
          SizedBox(width: 5,),
          
          CustomText(text: "Payment on delivery".tr() , color: AppUI.blackColor, fontSize: 12,),
         ],),),
         SizedBox(height: 10,),
          Container(
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
                    value: "l", 
                    groupValue: pay, 
                    onChanged: (value){
                      setState(() {
                          pay = value.toString();
                      });
                    },
                ),
          SvgPicture.asset("${AppUI.iconPath}card.svg"),
          SizedBox(width: 5,),
          
          CustomText(text: "Online payment".tr() , color: AppUI.blackColor, fontSize: 12,),
         ],),),
          SizedBox(height: 10,),
          CustomText(text: "Note for delivery",fontSize: 16,fontWeight: FontWeight.w400,color: AppUI.blackColor,),
          SizedBox(height: 10,),
          CustomInput(controller: TextEditingController(), textInputType: TextInputType.text ,lable: "Note" ,maxLines: 5,),
          SizedBox(height: 10,), 
          CustomText(text: "Bill Summary".tr() , color: AppUI.blackColor, fontSize: 16,fontWeight: FontWeight.w400,),
                      SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: "text" , color: AppUI.blackColor,),
                CustomText(text: "text" , color: AppUI.blackColor),
              ],
            ),
            SizedBox(height: 10,),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: "Delivery" , color: AppUI.blackColor,),
                CustomText(text: "text" , color: AppUI.blackColor),
              ],
            ),
            SizedBox(height: 10,),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: "Tax" , color: AppUI.blackColor,),
                CustomText(text: "text" , color: AppUI.blackColor),
              ],
            ),
            SizedBox(height: 10,),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: "promo code" , color: AppUI.blackColor,),
                CustomText(text: "text" , color: AppUI.errorColor),
              ],
            ),
            SizedBox(height: 10,),
            








              ],
            ),)

        ],
      ),
       bottomNavigationBar: Container(
        decoration: BoxDecoration( border:Border.all(color: AppUI.shimmerColor ,width: 0.5) ),
        height: 130,
        width: AppUtil.responsiveWidth(context),
        child: Padding(padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Column(
          children: [
           SizedBox(height: 10,),
           Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: "Total" , color: AppUI.blackColor,fontSize: 16,fontWeight: FontWeight.w600,),
                CustomText(text: "text" , color: AppUI.blackColor,fontSize: 16,fontWeight: FontWeight.w600,),
              ],
            ),
            SizedBox(height: 10,),
            CustomButton(text: "Order execution" , radius: 15,)
        ],),
        )
        )

    );
  }
}