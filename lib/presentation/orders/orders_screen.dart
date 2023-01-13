import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../shared/components.dart';
import '../../utilities/app_ui.dart';
import '../../utilities/app_util.dart';
import 'current_order_screen.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
        return Scaffold(
        appBar: customAppBar(title: "Orders".tr() , elevation: 0.5 , centerTitle: true),
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
                      return InkWell(child:  Padding(
                        padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12) , border:Border.all(color: AppUI.shimmerColor) ),
                          child: Padding(padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                          child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset("${AppUI.imgPath}Shape.png",width: 56,height: 56,),
                              SizedBox(width: 10,),
                              Expanded(child: 
                              
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      // Text('${cubit.notifications![count].body}'),
                                      // Text('${cubit.notifications![count].date} ${cubit.notifications![count].time}'),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                        CustomText(text: "Text" , color:  AppUI.blackColor,),
                                        Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(8) , color: AppUI.secondColor),padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),child: Center(child: CustomText(text: "Text")))
                                      ],),
                                    
                                    SizedBox(height: 5,),
                                    CustomText(text: "Text"   ,fontSize: 10, color: AppUI.greyColor,),
                                    SizedBox(height: 5,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            
                                           CustomText(text: "Text" , color:  AppUI.blackColor,),
                                           SizedBox(width: 5,),
                                           CustomText(text: "Text" , color:  AppUI.blackColor,fontWeight: FontWeight.w600,),
                                          ],

                                         )
                                    
                                  ],),
                                ),
                             

                          ]),),
                        ),
                      ),
                      onTap: () {
                        AppUtil.mainNavigator(context, CurrentOrderScreen());
                      },
                      );

                    }) ,
      ),
        );
  }
}