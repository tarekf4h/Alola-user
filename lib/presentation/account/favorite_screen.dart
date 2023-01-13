import 'package:adelco_user/shared/components.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';

import '../../utilities/app_ui.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "Favorite".tr() , centerTitle: true , elevation: 0.5),
      body: ListView.separated(
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
              background: Container(color: Colors.red ,child: Row(children: [SizedBox(width: 5,),SvgPicture.asset("${AppUI.iconPath}trash.svg" , color: AppUI.whiteColor,),SizedBox(width: 10,) ,CustomText(text: "Delete".tr(),color: AppUI.whiteColor,),SizedBox(width: 10,)],),),
              child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
                          // margin: EdgeInsets.fromLTRB(0, 16, 0, 16),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12) , border:Border.all(color: AppUI.shimmerColor) ),
                          child: Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
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
                                    SizedBox(height: 8,),
                                    CustomText(text: "Text"   , color: AppUI.greyColor,),
                                    SizedBox(height: 8,),
                                    CustomText(text: "Text" , color:  AppUI.blackColor,fontWeight: FontWeight.bold,),
                                    // Row(
                                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    //       children: [
                                            
                                           
                                        //    SizedBox(width: 5,),
                                        //     Expanded(flex: 0,child: Container(
                                        //       padding: EdgeInsets.only(right: 10,left: 10),
                                        //       height: 50,
                                        //       decoration: BoxDecoration(borderRadius: BorderRadius.circular(12) , border:Border.all(color: AppUI.shimmerColor) ),
                                        //       child: Row(
                                        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        //         children: [SizedBox(width: 5,),SvgPicture.asset("${AppUI.iconPath}plus.svg"),SizedBox(width: 10,) ,CustomText(text: "1",color: AppUI.blackColor,),SizedBox(width: 10,), SvgPicture.asset("${AppUI.iconPath}minus.svg"),],
                                        //       ),
                                        //     )),

                                        //   ],

                                        //  )
                                    
                                  ],),
                                ),
                             

                          ]),),
                        ),
                      ));

                    }) ,
      
    );
  }
}