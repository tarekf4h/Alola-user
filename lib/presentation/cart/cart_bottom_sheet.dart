import 'package:adelco_user/presentation/home/products_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../shared/components.dart';
import '../../utilities/app_ui.dart';
import '../../utilities/app_util.dart';

class CartBottomSheet extends StatefulWidget {
  const CartBottomSheet({Key? key}) : super(key: key);

  @override
  State<CartBottomSheet> createState() => _CartBottomSheetState();
}

class _CartBottomSheetState extends State<CartBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
                height: AppUtil.responsiveHeight(context)*0.9,
                child: Scaffold(
                backgroundColor: Colors.transparent,
                  appBar: AppBar(
                   backgroundColor: Colors.transparent,
                   centerTitle: true,
                  title: CustomText(text: "Products".tr() , color: AppUI.blackColor , fontSize: 20,), 
                  elevation: 0 ,
                  leadingWidth: 50,
                  leading:InkWell(onTap: () {
                  Navigator.pop(context, true); 
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset("${AppUI.imgPath}closePopup.png",height: 15,width: 15),
                  )
                  )),
      // customAppBar(title: "Category" , centerTitle: true,elevation: 0.5),
      body: Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
      child:  ListView.separated(
                    separatorBuilder: (context, index) {
                      return  Divider(
                        color: AppUI.shimmerColor.withOpacity(0),
                        thickness: 0,
                      );
                    },
                    scrollDirection: Axis.vertical,
                    itemCount: 20,
                    itemBuilder: (context, count) {
                      final item = count;
                      return  Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12) , border:Border.all(color: AppUI.shimmerColor) ),
                          child: Padding(padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                          child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset("${AppUI.imgPath}Coffe.png",width: 80,height: 80,),
                              SizedBox(width: 10,),
                              Expanded(child: 
                              
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      // Text('${cubit.notifications![count].body}'),
                                      // Text('${cubit.notifications![count].date} ${cubit.notifications![count].time}'),
                                    CustomText(text: "Text" , color:  AppUI.blackColor,),
                                    SizedBox(height: 5,),
                                    CustomText(text: "Text"   , color: AppUI.greyColor,),
                                    SizedBox(height: 5,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            
                                           CustomText(text: "Text" , color:  AppUI.blackColor,),
                                           SizedBox(width: 5,),
                                            Expanded(flex: 0,child: Container(
                                              padding: EdgeInsets.only(right: 10,left: 10),
                                              height: 50,
                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12) , border:Border.all(color: AppUI.shimmerColor) ),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [SizedBox(width: 5,),SvgPicture.asset("${AppUI.iconPath}plus.svg"),SizedBox(width: 10,) ,CustomText(text: "1",color: AppUI.blackColor,),SizedBox(width: 10,), SvgPicture.asset("${AppUI.iconPath}minus.svg"),],
                                              ),
                                            )),

                                          ],

                                         )
                                    
                                  ],),
                                ),
                             

                          ]),),
                        ),
                      );

                    }) ,
      ),
      bottomNavigationBar:InkWell(child:  Container(height: 50,width: AppUtil.responsiveWidth(context),
      decoration: BoxDecoration(
                 border: Border.all(color: AppUI.shimmerColor ,width: 0.5),
                 ),
      child:  Row(
          children: [
           SizedBox(width: 10,),
          SvgPicture.asset("${AppUI.iconPath}cart.svg"),
          SizedBox(width: 5,),
          
          CustomText(text: "Add a new product".tr() , color: AppUI.blackColor,fontWeight: FontWeight.w700, fontSize: 12,),
         ],),),
         onTap: () {
           AppUtil.mainNavigator(context, ProductsScreen());
         }, 
         
      )
    ));
    
  }
}