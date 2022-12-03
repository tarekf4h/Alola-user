import 'package:adelco_user/shared/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utilities/app_ui.dart';
import '../../utilities/app_util.dart';
import 'order_confirmation_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool open = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "Cart" , centerTitle: true),
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
                      return  Dismissible(
              // Each Dismissible must contain a Key. Keys allow Flutter to
              // uniquely identify widgets.
              key: Key("$item"),
              // Provide a function that tells the app
              // what to do after an item has been swiped away.
              onDismissed: (direction) {
                // Remove the item from the data source.
                setState(() {
                  // items.removeAt(count);
                });

                // Then show a snackbar.
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('$item dismissed')));
              },
              // Show a red background as the item is swiped away.
              background: Container(color: Colors.red ,child: Row(children: [SizedBox(width: 5,),SvgPicture.asset("${AppUI.iconPath}trash.svg" , color: AppUI.whiteColor,),SizedBox(width: 10,) ,CustomText(text: "Delete",color: AppUI.whiteColor,),SizedBox(width: 10,)],),),
              child: Padding(
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
                      ));

                    }) ,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12) , border:Border.all(color: AppUI.shimmerColor ,width: 0.5) ),
        height: open ? 220:130,
        width: AppUtil.responsiveWidth(context),
        child: Padding(padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Column(
          children: [
           InkWell(child: Center(child:open ? SvgPicture.asset("${AppUI.iconPath}arrowDown.svg"):SvgPicture.asset("${AppUI.iconPath}arrowTop.svg") ),onTap: () {
             this.open = !open;
             setState(() {
               
             });
           },),
           
           if (open) ...[
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

           ],
           SizedBox(height: 10,),
           Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: "Total" , color: AppUI.blackColor,fontSize: 16,fontWeight: FontWeight.w600,),
                CustomText(text: "text" , color: AppUI.blackColor,fontSize: 16,fontWeight: FontWeight.w600,),
              ],
            ),
            SizedBox(height: 10,),
            CustomButton(text: "Order execution" , radius: 15,onPressed: () {
              AppUtil.mainNavigator(context, OrderConfirmationScreen());
            },)
        ],),
        )
        ) ,
      );
  }
}