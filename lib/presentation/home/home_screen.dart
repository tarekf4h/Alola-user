import 'package:adelco_user/presentation/home/product_details_screen.dart';
import 'package:adelco_user/shared/components.dart';
import 'package:adelco_user/utilities/app_util.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:light_carousel/main/light_carousel.dart';

import '../../utilities/app_ui.dart';
import '../map/select_address_bottom_sheet.dart';
import 'notification_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        toolbarHeight: 80,
        leadingWidth: 80,
        centerTitle: true,
        leading: Center(child: Image.asset('${AppUI.imgPath}Logo.png', width: 40,height: 60,),),
        title: InkWell(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize:MainAxisSize.min,
          children: [
          CustomText(text: "Your delivery site".tr() ,fontSize: 12, color: AppUI.shimmerColor,),
          SizedBox(height: 5,),
          Row( mainAxisAlignment: MainAxisAlignment.center,
            children: [
             CustomText(text: "Your delivery site".tr() ,fontSize: 14, color: AppUI.blackColor,),
             SizedBox(width: 7,),
             Image.asset('${AppUI.imgPath}arrowDown.png', width: 12,height: 12,)

          ],)
        ],),
        onTap: () {
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
        },
        ),
        actions: [Container(width: 80,
        child: InkWell(onTap: () {
          AppUtil.mainNavigator(context, NotificationScreen());
//           Navigator.push(
// context,
// MaterialPageRoute(builder: (context) => NotificationScreen()),);
              // Navigator.of(context).push(MaterialPageRoute(builder: (context) => NotificationScreen()));

        },child: Center(child: Image.asset('${AppUI.imgPath}notfy.png', width: 25,height: 25,)),),
        )]
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
          child: ListView(
            children: [
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16) ,
                child: CustomText(text: "Welcome back".tr() ,fontSize: 12, color: AppUI.shimmerColor,),
              ),
              SizedBox(height: 5,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: CustomText(text: "Name".tr() ,fontSize: 16,fontWeight: FontWeight.w700, color: AppUI.blackColor,),
              ),
              SizedBox(height: 20,),
              SizedBox(
             width: AppUtil.responsiveWidth(context) - 40, 
             child: Padding(
               padding: const EdgeInsets.symmetric(horizontal: 16),
               child: CustomInput(suffixIcon:InkWell(onTap: () {
            
                },child:  Image.asset("${AppUI.imgPath}scannerIcon.png",height: 17,width: 25),),prefixIcon:Icon(Icons.search) ,controller: TextEditingController(), textInputType: TextInputType.name , hint: "search".tr() , radius: 20,),
             ),
            ),
            SizedBox(height: 20,),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 16),
               child: SizedBox(
            height: 190.0,
            width: double.infinity,
            child: LightCarousel(
                images: [
                  Image.asset("${AppUI.imgPath}Group 53766.png",width: double.infinity,height: 190,fit: BoxFit.fill,),
                  Image.asset("${AppUI.imgPath}Group 53766.png",width: double.infinity,height: 190,fit: BoxFit.fill),
                  Image.asset("${AppUI.imgPath}Group 53766.png",width: double.infinity,height: 190,fit: BoxFit.fill),
                ],
                dotSize: 5.0,
                dotSpacing: 15.0,
                dotColor: AppUI.whiteColor,
                dotIncreasedColor: AppUI.mainColor,
                indicatorBgPadding: 15.0,
                dotBgColor: Colors.purple.withOpacity(0.0),
                borderRadius: true,
            )
        ),
             ),
        SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomText(text: "Best selling category".tr() ,fontSize: 16,fontWeight: FontWeight.w700, color: AppUI.blackColor,),
        ),
        SizedBox(height: 20,),
         GridView.builder(
                shrinkWrap: true ,
                primary: false ,
                itemCount: 17,
                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                 crossAxisCount: 4,
                 crossAxisSpacing : 0 ,
                 mainAxisSpacing: 0 ,
                 childAspectRatio  : 1/1.2
           ), itemBuilder: (BuildContext context, int index) { 
            return InkWell(
              onTap: () {
                // BottomNavCubit.get(context).setWarehouseIndex(1);
              },

                     child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                           decoration: BoxDecoration(
                          color: AppUI.backgroundColor,
                          shape: BoxShape.circle
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset("${AppUI.imgPath}Coffe.png",height: 50,width: 50),
                            ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(text: "text" ,fontSize: 12, color: AppUI.blackColor,),
                             SizedBox(height: 5,),
                          ],
                        )
                      ],
                     ),

            );
            },
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: "Best offers".tr() ,fontSize: 16,fontWeight: FontWeight.w700, color: AppUI.blackColor,),
                  InkWell(onTap: () {

                 },
                 child: CustomText(text: "more".tr() , fontSize: 14,color: AppUI.mainColor,fontWeight: FontWeight.w700,) ,
                 ),
              ],),
            ),
            SizedBox(height: 10,),
            Container(
              height: 230,
              child: GridView.builder(
                   shrinkWrap : false,
                      primary: false,
                      itemCount: 20,
                      scrollDirection:Axis.horizontal,
                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                   crossAxisCount: 1,
                   crossAxisSpacing : 10 ,
                   mainAxisSpacing: 10 ,
                   childAspectRatio  : 1/0.8,
                   
           ),
          itemBuilder: (BuildContext context, int index) { 
              return InkWell(
                onTap: () {
                  AppUtil.mainNavigator(context, ProductDetailsScreen());
                },
                child:Container(
                        margin:EdgeInsets.all(8),
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        width: 100,
                        // height: 180,
                        decoration: BoxDecoration(
                        color: AppUI.whiteColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                        BoxShadow(
                        color: Colors.grey.withAlpha(100),
                        blurRadius: 0.5, 
                        spreadRadius: 0.5, 
                        offset: Offset(  0.5,  0.5,),) ],),
                        child: Stack(children: [
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           
                           child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10,),
                              Center(child: Image.asset("${AppUI.imgPath}Coffe.png",height: 80,width: 80)),
                              SizedBox(height: 10,),
                              CustomText(text: "Text",color: AppUI.blackColor,),
                              SizedBox(height: 5,),
                              CustomText(text: "Text",color: AppUI.blackColor,fontSize: 12,),
                              SizedBox(height: 5,),
                              Row(children: [
                                CustomText(text: "Text",color: AppUI.blackColor,fontWeight: FontWeight.w600,),
                                SizedBox(width: 5,),
                                CustomText(text: "Text",color: AppUI.greyColor, textDecoration: TextDecoration.lineThrough)
                              ],),
                            SizedBox(height: 5,),
                            CustomButton(text: "Add".tr(),fontSize: 12,)

                             

                            ],
                        ),
                         ),
                            Container(margin: EdgeInsets.only(top: 10 , right: 0), height: 20 , width: 80,
                             child: Row(
                              children: [
                              SizedBox(width: 5,),
                              Image.asset("${AppUI.imgPath}Mask Group 461.png",height: 10,width: 10),
                              SizedBox(width: 5,),
                              CustomText(text: "Save 20%".tr(), fontSize: 10,color: AppUI.errorColor,),
                              SizedBox(width: 5,)
                             ],),
                             decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(topRight: Radius.circular(5) , bottomRight:Radius.circular(5) ),
                                    color: AppUI.errorLiteColor)
                             ,)
                        ],)

                        ));
              },
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: "Most popular products".tr() ,fontSize: 16,fontWeight: FontWeight.w700, color: AppUI.blackColor,),
                  InkWell(onTap: () {

                 },
                 child: CustomText(text: "more".tr() , fontSize: 14,color: AppUI.mainColor,fontWeight: FontWeight.w700,) ,
                 ),
              ],),
            ),
            SizedBox(height: 10,),
            Container(
              height: 230,
              child: GridView.builder(
                   shrinkWrap : false,
                      primary: false,
                      itemCount: 20,
                      scrollDirection:Axis.horizontal,
                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                   crossAxisCount: 1,
                   crossAxisSpacing : 10 ,
                   mainAxisSpacing: 10 ,
                   childAspectRatio  : 1/0.8,
                   
           ),
          itemBuilder: (BuildContext context, int index) { 
              return  Container(
                        margin:EdgeInsets.all(8),
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        width: 100,
                        // height: 180,
                        decoration: BoxDecoration(
                        color: AppUI.whiteColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                        BoxShadow(
                        color: Colors.grey.withAlpha(100),
                        blurRadius: 0.5, 
                        spreadRadius: 0.5, 
                        offset: Offset(  0.5,  0.5,),) ],),
                        child: Stack(children: [
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10,),
                              Center(child: Image.asset("${AppUI.imgPath}Coffe.png",height: 80,width: 80)),
                              SizedBox(height: 10,),
                              CustomText(text: "Text",color: AppUI.blackColor,),
                              SizedBox(height: 5,),
                              CustomText(text: "Text",color: AppUI.blackColor,fontSize: 12,),
                              SizedBox(height: 5,),
                              Row(children: [
                                CustomText(text: "Text",color: AppUI.blackColor,fontWeight: FontWeight.w600,),
                                SizedBox(width: 5,),
                                CustomText(text: "Text",color: AppUI.greyColor, textDecoration: TextDecoration.lineThrough)
                              ],),
                            SizedBox(height: 5,),
                            CustomButton(text: "Add".tr() ,fontSize: 12,)

                             

                            ],
                        ),
                         ),
                            // Container(margin: EdgeInsets.only(top: 10 , right: 0), height: 20 , width: 80,
                            //  child: Row(
                            //   children: [
                            //   SizedBox(width: 5,),
                            //   Image.asset("${AppUI.imgPath}Mask Group 461.png",height: 10,width: 10),
                            //   SizedBox(width: 5,),
                            //   CustomText(text: "Save 20%", fontSize: 10,color: AppUI.errorColor,),
                            //   SizedBox(width: 5,)
                            //  ],),
                            //  decoration: BoxDecoration(
                            //         borderRadius: BorderRadius.only(topRight: Radius.circular(5) , bottomRight:Radius.circular(5) ),
                            //         color: AppUI.errorLiteColor)
                            //  ,)
                        ],)

                        );
              },
              ),
            ),
            SizedBox(height: 20,)



              
        ],
          ),
        ) ,

    );
  }
}