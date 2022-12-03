
import 'package:adelco_user/presentation/auth/phone_screen.dart';
import 'package:adelco_user/presentation/auth/signup_company_screen.dart';
import 'package:adelco_user/presentation/auth/signup_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../bloc/auth/auth_cubit.dart';
import '../../shared/components.dart';
import '../../utilities/app_ui.dart';
import '../../utilities/app_util.dart';
import '../bottom_nav/bottom_nav_tabs_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // var type = 0 ;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: BlocBuilder<AuthCubit,AuthState>(
        builder: (context, state) {
          var cubit = AuthCubit.get(context);
          return Form(
            child:
            Padding(
              padding: const EdgeInsets.only(left: 50 , right: 50 ),
              child: Center(
                child: SingleChildScrollView(
                  child:
                   Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Image.asset(
                     '${AppUI.imgPath}logoMain.png',
                     width: 150,
                     height: 200,),
                     SizedBox(height: 20,),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [ CustomText(text: "welcomeTo".tr() ,fontSize: 22,color: AppUI.blackColor,),SizedBox(width: 5,),CustomText(text: "adelco".tr() ,color: AppUI.mainColor,fontSize: 22,)],),
                     SizedBox(height: 10,),
                     CustomText(text: "login".tr() ,fontSize: 22,color: AppUI.blackColor,),
                     SizedBox(height: 10,),
                     Container(width: 300,child: CustomInput(controller: TextEditingController(), textInputType: TextInputType.phone , lable: "phone".tr() ,)),
                     SizedBox(height: 20,),
                     Container(width: 300,child: CustomInput(obscureText: true ,controller: TextEditingController(), textInputType: TextInputType.phone , lable: "pass".tr(),)),
                     SizedBox(height: 10,),
                     Container(
                      width: 300,
                       child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                        InkWell(
                          child: CustomText(text: "forgotPass".tr() , fontWeight: FontWeight.w700,color: AppUI.blackColor , textDecoration: TextDecoration.underline,),
                          onTap: () {
                              AppUtil.mainNavigator(context, const PhoneScreen());
                          }
                       ,),
                        ],),
                     ),
                     SizedBox(height: 20,),
                     Container(width: 300,
                     child: CustomButton(text:  "Login".tr() , radius: 20 ,onPressed: () {
                       AppUtil.replacementNavigator(context, BottomNavTabsScreen());
                     },),),
                     SizedBox(height: 10,),
                     Container(
                     child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [CustomText(text:"newAdelco".tr() ,fontSize: 12,color: AppUI.greyColor,),
                      SizedBox(width: 5,),
                       InkWell(
                          child: Expanded(child:  CustomText(text: "createAccount".tr(), fontWeight: FontWeight.w700,fontSize: 12,color: AppUI.blackColor , textDecoration: TextDecoration.underline,)),
                          onTap: () {
                            //  AppUtil.mainNavigator(context, const SignupScreen());
            showModalBottomSheet(
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.only(topLeft: Radius.circular(20) , topRight: Radius.circular(20)),),
            context: context,
            builder: (BuildContext context) {
              return BottomSheet(
              onClosing: () {},
              builder: (BuildContext context) {
              var type = 0 ;
          return StatefulBuilder(builder: (BuildContext context, StateSetter mystate) {
          return SizedBox(
                height: AppUtil.responsiveHeight(context)*0.75,
                child:
                 Scaffold(
                  backgroundColor: Colors.transparent,
                  appBar: AppBar(
                   backgroundColor: Colors.transparent,
                  title: CustomText(text: "createAccount".tr() , color: AppUI.blackColor , fontSize: 20,), 
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
                  body: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children:[
                          Container(
                            decoration:
                             BoxDecoration(
                             color: AppUI.whiteColor,
                             border: Border.all(color: type == 1 ? AppUI.mainColor:AppUI.shimmerColor),
                             borderRadius: BorderRadius.circular(8),) ,

                            child: InkWell(child: Container(height:150 , width: 300 ,child: Center(child: Column(
                              children: [
                                Image.asset("${AppUI.imgPath}Layer 1.png",height: 100,width: 100),
                                SizedBox(height: 10,),
                                CustomText(text: "Create a personal account".tr() , fontSize: 18, color: AppUI.blackColor,)
                              ],
                            )),),
                              onTap: () {
                              print("c");
                               type = 1;
                              mystate(() {
                                type = 1;
                              });
                            },),
                          ) ,
                           SizedBox(height: 10,) ,
                          Container(
                            decoration:
                             BoxDecoration(
                             color: AppUI.whiteColor,
                             border: Border.all(color: type == 2 ? AppUI.mainColor:AppUI.shimmerColor),
                             borderRadius: BorderRadius.circular(8),) ,
                            child: InkWell(child: Container(height:150 , width: 300 ,child: Center(child: Column(
                              children: [
                                Image.asset("${AppUI.imgPath}Layer 2.png",height: 100,width: 100),
                                SizedBox(height: 10,),
                                CustomText(text: "Create a corporate account".tr() , fontSize: 18, color: AppUI.blackColor,)
                              ],
                            )),),
                              onTap: () {
                               print("g");
                               type = 2;
                              mystate(() {
                               type = 2;
                              });
                            },),
                          ),
                          SizedBox(height: 20,) ,
                          CustomButton(text:  "Confirm".tr() , radius: 20 , onPressed: () {
                            if (type == 1) {
                              AppUtil.replacementNavigator(context, const SignupScreen());
                            }else if (type == 2) {
                              AppUtil.replacementNavigator(context, const SignupCompanyScreen());
                            }
                          },),
                        ],
                      ),
                    ),
                  ),
                ),
              );

          });});
              
            }
            );
            
                          }
                       ,)],
                     ),)
                     ],
                ),),
              ),
            )
          );
            
            }
            )
    );
  }
}



// SizedBox(
//                 height: AppUtil.responsiveHeight(context)*0.75,
//                 child:
//                  Scaffold(
//                   backgroundColor: Colors.transparent,
//                   appBar: AppBar(
//                    backgroundColor: Colors.transparent,
//                   title: CustomText(text: "createAccount".tr() , color: AppUI.blackColor , fontSize: 20,), 
//                   elevation: 0 ,
//                   leadingWidth: 50,
//                   leading:InkWell(onTap: () {
//                   Navigator.pop(context, true); 
//                   },
//                   child: Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Image.asset("${AppUI.imgPath}closePopup.png",height: 15,width: 15),
//                   )
//                   )),
//                   body: Center(
//                     child: Padding(
//                       padding: const EdgeInsets.all(20.0),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         mainAxisSize: MainAxisSize.min,
//                         children:[
//                           Container(
//                             decoration:
//                              BoxDecoration(
//                              color: AppUI.whiteColor,
//                              border: Border.all(color: type == 1 ? AppUI.mainColor:AppUI.shimmerColor),
//                              borderRadius: BorderRadius.circular(8),) ,

//                             child: InkWell(child: Container(height:150 , width: 300 ,child: Center(child: Column(
//                               children: [
//                                 Image.asset("${AppUI.imgPath}Layer 1.png",height: 100,width: 100),
//                                 SizedBox(height: 10,),
//                                 CustomText(text: "Create a personal account".tr() , fontSize: 18, color: AppUI.blackColor,)
//                               ],
//                             )),),
//                               onTap: () {
//                               print("c");
//                               setState(() {
//                                 this.type = 1;
//                               });
//                             },),
//                           ) ,
//                            SizedBox(height: 10,) ,
//                           Container(
//                             decoration:
//                              BoxDecoration(
//                              color: AppUI.whiteColor,
//                              border: Border.all(color: type == 2 ? AppUI.mainColor:AppUI.shimmerColor),
//                              borderRadius: BorderRadius.circular(8),) ,
//                             child: InkWell(child: Container(height:150 , width: 300 ,child: Center(child: Column(
//                               children: [
//                                 Image.asset("${AppUI.imgPath}Layer 2.png",height: 100,width: 100),
//                                 SizedBox(height: 10,),
//                                 CustomText(text: "Create a corporate account".tr() , fontSize: 18, color: AppUI.blackColor,)
//                               ],
//                             )),),
//                               onTap: () {
//                                print("g");
//                               setState(() {
//                                 this.type = 2;
//                               });
//                             },),
//                           ),
//                           SizedBox(height: 20,) ,
//                           CustomButton(text:  "Confirm".tr() , radius: 20 , onPressed: () {
//                             if (type == 1) {
//                               AppUtil.replacementNavigator(context, const SignupScreen());
//                             }else if (type == 2) {
//                               AppUtil.replacementNavigator(context, const SignupCompanyScreen());
//                             }
//                           },),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               );