import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../shared/components.dart';
import '../../utilities/app_ui.dart';
import '../../utilities/app_util.dart';
import '../cart/cart_bottom_sheet.dart';

class CancelOrderScreen extends StatefulWidget {
  const CancelOrderScreen({Key? key}) : super(key: key);

  @override
  State<CancelOrderScreen> createState() => _CancelOrderScreenState();
}

class _CancelOrderScreenState extends State<CancelOrderScreen> {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: customAppBar(title: "Orders" , elevation: 0.5 , centerTitle: true),
        body: ListView(
          children: [
             SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomText(text: "Order details".tr() , color: AppUI.blackColor, fontSize: 16,fontWeight: FontWeight.w400,),
              ),
              SizedBox(height: 20,),
            Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppUI.shimmerColor)
            ),
            padding: EdgeInsets.symmetric(horizontal: 15),
            margin: EdgeInsets.symmetric(horizontal: 15) ,
            child: Column(
              children: [
              SizedBox(height: 10,),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: "Order number" , color: AppUI.greyColor,),
                CustomText(text: "text" , color: AppUI.blackColor),
              ],
            ),
            SizedBox(height: 10,),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: "Order status" , color: AppUI.greyColor,),
                Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(8) , color: AppUI.errorColor.withAlpha(800)),padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),child: Center(child: CustomText(text: "Text" , color: AppUI.errorColor,)))
              ],
            ),
            SizedBox(height: 10,),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: "Delivery location" , color: AppUI.greyColor,),
                CustomText(text: "text" , color: AppUI.blackColor),
              ],
            ),
            SizedBox(height: 10,),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: "Number of products" , color: AppUI.greyColor,),
                CustomText(text: "text" , color: AppUI.blackColor),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: "Total" , color: AppUI.greyColor,),
                CustomText(text: "text" , color: AppUI.blackColor),
              ],
            ),
            SizedBox(height: 10,),
            
            ],),),
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
          ],
        ),
        bottomNavigationBar: Container(
        decoration: BoxDecoration( border:Border.all(color: AppUI.shimmerColor ,width: 0.5) ),
        height: 70,
        width: AppUtil.responsiveWidth(context),
        child: Padding(padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Center(child: CustomButton(text: "Re-order" , radius: 15,),)
        )
        ) ,
        );
    
  }
}