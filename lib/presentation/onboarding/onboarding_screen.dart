import 'package:adelco_user/presentation/auth/login_screen.dart';
import 'package:adelco_user/shared/components.dart';
import 'package:adelco_user/utilities/app_util.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:light_carousel/main/light_carousel.dart';

import '../../bloc/onboarding/onboarding_cubit.dart';
import '../../utilities/app_ui.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return    BlocBuilder<OnboardingCubit,OnboardingState>(
        builder: (context, state,) {
          var cubit = OnboardingCubit.get(context);
          return Scaffold(
      body: SingleChildScrollView(
            child: Column(children: [
            SizedBox(height: 40,),
            SizedBox(
            height: AppUtil.responsiveHeight(context)*0.5,
            width: double.infinity,
            child: LightCarousel(
              images: [
                Image.asset("${AppUI.imgPath}splash1.png",width: double.infinity,height:  AppUtil.responsiveHeight(context)*0.5,fit: BoxFit.fill,),
                Image.asset("${AppUI.imgPath}splash2.png",width: double.infinity,height:  AppUtil.responsiveHeight(context)*0.5,fit: BoxFit.fill),
                Image.asset("${AppUI.imgPath}splash3.png",width: double.infinity,height:  AppUtil.responsiveHeight(context)*0.5,fit: BoxFit.fill),
                Image.asset("${AppUI.imgPath}splash4.png",width: double.infinity,height:  AppUtil.responsiveHeight(context)*0.5,fit: BoxFit.fill),
              ],
              
              onImageChange: (p0, p1) {
                print("$p0" + "----" + "$p1" );
                cubit.currentIndex = p1;
                setState(() {
                  
                });
              },
              dotSize: 0.0,
              dotSpacing: 0.0,
              dotColor: AppUI.whiteColor,
              dotIncreasedColor: AppUI.mainColor,
              indicatorBgPadding: 15.0,
              dotBgColor: Colors.purple.withOpacity(0.0),
              borderRadius: true,
            )
        ),
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: cubit.currentIndex == 0 ?32:14 ,
              height: 4,
              decoration: BoxDecoration(
            color: cubit.currentIndex == 0 ?AppUI.mainColor:AppUI.greyColor ,
             borderRadius: BorderRadius.all(Radius.circular(10))
           ),
          ),
          SizedBox(width: 10,),
           Container(
              width: cubit.currentIndex == 1 ?32:14 ,
              height: 4,
              decoration: BoxDecoration(
            color: cubit.currentIndex == 1 ?AppUI.mainColor:AppUI.greyColor ,
             borderRadius: BorderRadius.all(Radius.circular(10))
           ),
          ),
            SizedBox(width: 10,),
           Container(
              width: cubit.currentIndex == 2 ?32:14 ,
              height: 4,
              decoration: BoxDecoration(
            color: cubit.currentIndex == 2 ?AppUI.mainColor:AppUI.greyColor ,
             borderRadius: BorderRadius.all(Radius.circular(10))
           ),
          ),
            SizedBox(width: 10,),
           Container(
              width: cubit.currentIndex == 3 ?32:14 ,
              height: 4,
              decoration: BoxDecoration(
            color: cubit.currentIndex == 3 ?AppUI.mainColor:AppUI.greyColor ,
             borderRadius: BorderRadius.all(Radius.circular(10))
           ),
          ),

          ],),
          SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: CustomTextCenter(text: "Order your goods through the app".tr() , fontSize: 22,fontWeight: FontWeight.w800 ,color: AppUI.blackColor,),
              ), 
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomTextCenter(text: "Order all your grocery, bakery and dairy needs".tr() , fontSize: 18,fontWeight: FontWeight.w500,color: AppUI.blackColor,),
          ),
          SizedBox(height: 20,),
          Padding(padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          CustomButton(width: 140,text:  "Shop now".tr() , radius: 20 ,onPressed: (() {
                         }),),
                         SizedBox(width: 30,),
                        CustomButton(width: 140,textColor:AppUI.mainColor ,color: AppUI.secondColor,text:"Login".tr()  , radius: 20 ,onPressed: () {
                          AppUtil.mainNavigator(context, const LoginScreen());
                        },),
                      ],
                    ),
                  ),
          )

        
         
          
          
          
      ])),
    );
        });
    
  }
} 