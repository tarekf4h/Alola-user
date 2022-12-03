import 'dart:ffi';

import 'package:adelco_user/shared/components.dart';
import 'package:adelco_user/utilities/app_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import '../../utilities/app_ui.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(backgroundColor: AppUI.mainColor.withAlpha(800)
      ,title: "" , 
      leadingWidth: 60.0,
        leading: InkWell(child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(width: 60,decoration: BoxDecoration(color: AppUI.mainColor.withAlpha(300),borderRadius:BorderRadius.all(Radius.circular(10))),padding: EdgeInsets.all(8),child: SvgPicture.asset("${AppUI.iconPath}back.svg" , width: 25,height: 25,)),) , onTap: (){ Navigator.pop(context);},),
        actions: [InkWell(child:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(decoration: BoxDecoration(color: AppUI.mainColor.withAlpha(300),borderRadius:BorderRadius.all(Radius.circular(10))),padding: EdgeInsets.all(10),child: SvgPicture.asset("${AppUI.iconPath}bookmark.svg" , width: 20,height: 20,)),)  ,onTap: (){},),
        InkWell(child:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(decoration: BoxDecoration(color: AppUI.mainColor.withAlpha(300),borderRadius:BorderRadius.all(Radius.circular(10))),padding: EdgeInsets.all(10),child: SvgPicture.asset("${AppUI.iconPath}share.svg" , width: 20,height: 20,)),)  ,onTap: (){},),
        ]
      ),
      body: ListView(
        children: [
          Container(
            color:  AppUI.mainColor.withAlpha(800),
            height: 160,
            child: Center(child:Image.asset('${AppUI.imgPath}milk.png') ,),
            ),
            Container
            (child: Padding(padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
             child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10,),
                              CustomText(text: "Text",color: AppUI.blackColor,),
                              SizedBox(height: 5,),
                              CustomText(text: "Text",color: AppUI.blackColor,fontSize: 12,),
                              SizedBox(height: 5,),
                              Row(children: [
                                CustomText(text: "Text",color: AppUI.mainColor,fontWeight: FontWeight.w600,),
                                SizedBox(width: 5,),
                                CustomText(text: "Text",color: AppUI.blackColor, textDecoration: TextDecoration.lineThrough)
                              ],),
                            SizedBox(height: 5,),
                            Divider(height: 1,),
                            SizedBox(height: 5,),

                                SizedBox(height: 10,),
                                Row(children: [SvgPicture.asset("${AppUI.iconPath}publicFill.svg" , height: 15,width: 15,) , SizedBox(width: 10,) , CustomText(text: "Country of Origin :" , color: AppUI.blackColor,)],),
                                SizedBox(height: 5,),
                                Expanded(
                                  flex: 0,
                                  child: 
                                Padding(
                                  padding: const EdgeInsets.only(left:25 ),
                                  child: CustomText(text: "Text" , color: AppUI.greyColor,),
                                )),
                                SizedBox(height: 10,),
                                SizedBox(height: 10,),
                                Row(children: [SvgPicture.asset("${AppUI.iconPath}verified.svg" , height: 15,width: 15,) , SizedBox(width: 10,) , CustomText(text: "Product Expiry :" , color: AppUI.blackColor,)],),
                                SizedBox(height: 5,),
                                Expanded(
                                  flex: 0,
                                  child: 
                                Padding(
                                  padding: const EdgeInsets.only(left:25 ),
                                  child: CustomText(text: "Text" , color: AppUI.greyColor,),
                                )),
                                SizedBox(height: 10,),
                                SizedBox(height: 10,),
                                Row(children: [SvgPicture.asset("${AppUI.iconPath}info.svg" , height: 15,width: 15,) , SizedBox(width: 10,) , CustomText(text: "Product information :" , color: AppUI.blackColor,)],),
                                SizedBox(height: 5,),
                                Expanded(
                                  flex: 0,
                                  child: 
                                Padding(
                                  padding: const EdgeInsets.only(left:25 ),
                                  child: CustomText(text: "Text" , color: AppUI.greyColor,),
                                )),
                                SizedBox(height: 10,),
                            ],
                        ),),),
      ],),
      bottomNavigationBar: Container(decoration: BoxDecoration(color: AppUI.whiteColor,boxShadow:[ BoxShadow(
        color: Colors.grey.withAlpha(100),
        blurRadius: 0.5, 
        spreadRadius: 0.5, 
        offset: Offset(
          0.5, 
          0.5,
        ),
      )]),padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),width: AppUtil.responsiveWidth(context) , height: 70,
                                     child: Row(
                                      children: [
                                       
                                        Expanded(child: Container(
                                          padding: EdgeInsets.only(right: 10,left: 10),
                                          height: 50,
                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12) , border:Border.all(color: AppUI.shimmerColor) ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [SvgPicture.asset("${AppUI.iconPath}plus.svg") ,CustomText(text: "1",color: AppUI.blackColor,), SvgPicture.asset("${AppUI.iconPath}trash.svg")],
                                          ),
                                        )),
                                         SizedBox(width: 20,),
                                         CustomButton(text: "Add" ,fontSize: 12,width: AppUtil.responsiveWidth(context) * 0.3,),
                                      ],

                                     )
                                     ,),

    );
    
  }
}