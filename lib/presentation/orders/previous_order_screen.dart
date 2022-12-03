import 'package:adelco_user/presentation/orders/products_bottom_sheet.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../shared/components.dart';
import '../../utilities/app_ui.dart';
import '../cart/cart_bottom_sheet.dart';

class PreviousOrderScreen extends StatefulWidget {
  const PreviousOrderScreen({Key? key}) : super(key: key);

  @override
  State<PreviousOrderScreen> createState() => _PreviousOrderScreenState();
}

class _PreviousOrderScreenState extends State<PreviousOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "Orders" , elevation: 0.5 , centerTitle: true),
      body: Padding(padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: ListView(children: [
        SizedBox(height: 10,),
        CustomAarrowContainer(title: "Tell us your rating to improve the service level".tr(),),
        SizedBox(height: 20,),
        //  CustomText(text: "Order details".tr() , color: AppUI.blackColor, fontSize: 16,fontWeight: FontWeight.w400,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: "Order details".tr()  ,fontSize: 16,fontWeight: FontWeight.w700, color: AppUI.blackColor,),
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
          return ProductsBottomSheet();
          });});});
                 },
                 child: CustomText(text: "Show".tr() , fontSize: 14,color: AppUI.mainColor,fontWeight: FontWeight.w700,) ,
                 ),
              ],),
              SizedBox(height: 20,),
            Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppUI.shimmerColor)
            ),
            padding: EdgeInsets.symmetric(horizontal: 15),
            // margin: EdgeInsets.symmetric(horizontal: 15) ,
            child: Column(
              children: [
              SizedBox(height: 10,),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: "Order number" , color: AppUI.greyColor,fontSize: 10,),
                CustomText(text: "text" , color: AppUI.blackColor,fontSize: 10),
              ],
            ),
            SizedBox(height: 10,),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: "Order status" , color: AppUI.greyColor,fontSize: 10),
                Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(8) , color: AppUI.activeColor.withAlpha(800)),padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),child: Center(child: CustomText(text: "Text" , color: AppUI.activeColor,fontSize: 10)))
              ],
            ),
            SizedBox(height: 10,),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: "Delivery location" , color: AppUI.greyColor,fontSize: 10),
                CustomText(text: "text" , color: AppUI.blackColor,fontSize: 10),
              ],
            ),
            SizedBox(height: 10,),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: "Number of products" , color: AppUI.greyColor,fontSize: 10),
                CustomText(text: "text" , color: AppUI.blackColor,fontSize: 10),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: "Total" , color: AppUI.greyColor,fontSize: 10),
                CustomText(text: "text" , color: AppUI.blackColor,fontSize: 10),
              ],
            ),
            SizedBox(height: 10,),
            
            ],),),
            Padding(
             padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
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
          return ProductsBottomSheet();
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
            SizedBox(height: 20,),
            CustomText(text: "Bill Summary".tr() , color: AppUI.blackColor, fontSize: 16,fontWeight: FontWeight.w400,),
            SizedBox(height: 20,),
            Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppUI.shimmerColor)
            ),
            padding: EdgeInsets.symmetric(horizontal: 15),
            // margin: EdgeInsets.symmetric(horizontal: 15) ,
            child: Column(
              children: [
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: "Total" , color: AppUI.blackColor,fontSize: 16,),
                CustomText(text: "text" , color: AppUI.blackColor,fontSize: 16),
              ],
            ),
            SizedBox(height: 10,),


              ])),
              SizedBox(height: 10,),
            CustomButton(text: "Re-order" , radius: 15,),
            SizedBox(height: 10,),



      ],),
      ),
    );
    
  }
}