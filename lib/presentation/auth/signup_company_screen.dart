import 'package:adelco_user/presentation/auth/verification_screen.dart';
import 'package:adelco_user/presentation/auth/widgets/company_data.dart';
import 'package:adelco_user/presentation/auth/widgets/company_data2.dart';
import 'package:adelco_user/presentation/auth/widgets/company_data3.dart';
import 'package:adelco_user/presentation/auth/widgets/company_data4.dart';
import 'package:adelco_user/utilities/app_util.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:status_stepper/status_stepper.dart';

import '../../bloc/auth/auth_cubit.dart';
import '../../shared/components.dart';
import '../../utilities/app_ui.dart';

class SignupCompanyScreen extends StatefulWidget {
  const SignupCompanyScreen({Key? key}) : super(key: key);

  @override
  State<SignupCompanyScreen> createState() => _SignupCompanyScreenState();
}

class _SignupCompanyScreenState extends State<SignupCompanyScreen> with TickerProviderStateMixin  {
  int curIndex = 0;
  int lastIndex = 0;
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    var cubit = AuthCubit.get(context);
    tabController = TabController(
      initialIndex: 0,
      length: 4,
      vsync: this,
    );
  }
  @override
  Widget build(BuildContext context) {

   var statuses = List.generate(
    4,
    (index) => SizedBox.square(
      dimension: 32,
      // Text(this.curIndex <= index ?'$index':'Lo')
      child: Center(child:this.curIndex <= index ? CustomText(text: "${index + 1}" , color: AppUI.whiteColor,):Image.asset(
                     '${AppUI.imgPath}Rectangle 4403 (Stroke).png',
                     width: 25,
                     height: 25,),)
      ));
   return Scaffold(
      appBar: customAppBar(title: "createAccount".tr() , centerTitle: true),
      body: BlocBuilder<AuthCubit,AuthState>(
        builder: (context, state) {
          var cubit = AuthCubit.get(context);
          return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: StatusStepper(
                connectorCurve: Curves.easeIn,
                itemCurve: Curves.easeOut,
                activeColor: AppUI.mainColor,
                disabledColor: AppUI.greyColor,
                animationDuration: const Duration(milliseconds: 500),
                children: statuses,
                lastActiveIndex: lastIndex,
                currentIndex: curIndex,
                connectorThickness: 6,
              ),
            ),
            Expanded(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: tabController ,
                children: [
                CompanyData(),
                CompanyData2(),
                CompanyData3(),
                CompanyData4()
              ],)
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                    if(state is SendOtpLoadingState)
                    const LoadingWidget()
                    else
                          CustomButton(width: 140,text: tabController.index==3 ? "create".tr() : "next".tr()  , radius: 20 ,onPressed: () {
                            setState(() async {
                            if (tabController.index < 3){
                              if (tabController.index == 0){
                                if(cubit.businessAccountFormKey1.currentState!.validate()) {
                                  if(cubit.dateBusiness == null || cubit.orderTypeBusiness == null || cubit.activityBusiness == null  || cubit.clientCategoryIdBusiness == null){
                                    AppUtil.errorToast(context, "All fields required".tr());
                                } else{
                                 tabController.index += 1; 
                                 lastIndex =  curIndex;
                                 curIndex += 1; 
                                  }
                                }else{
                                 AppUtil.errorToast(context, "All fields required".tr()); 
                                }
                              }else if (tabController.index == 1){
                              if(cubit.businessAccountFormKey2.currentState!.validate()) {
                                 tabController.index += 1; 
                                 lastIndex =  curIndex;
                                 curIndex += 1; 
                              }else{
                                 AppUtil.errorToast(context, "All fields required".tr()); 
                              }
                              }else if (tabController.index == 2){
                              if(cubit.businessAccountFormKey3.currentState!.validate()) {
                                  if(cubit.procurement == null || cubit.commercialRegistration == null || cubit.bankStatementFor6Months == null  || cubit.taxCertificate == null
                                  || cubit.identityOfTheOwnerOrOwnersImage == null|| cubit.nationalAddress == null|| cubit.latitude == null|| cubit.longitude == null){
                                    AppUtil.errorToast(context, "All fields required".tr());
                                } else{
                                 tabController.index += 1; 
                                 lastIndex =  curIndex;
                                 curIndex += 1; 
                                  }
                              }else{
                                 AppUtil.errorToast(context, "All fields required".tr()); 
                              }
                              }
                            }else if (tabController.index == 3){
                              print("object");
                              if(cubit.businessAccountFormKey4.currentState!.validate()) {
                            await cubit.sendOtp(context, 'register', "${cubit.phoneBusiness.text}" , cubit.emailBusiness.text);
                            if(cubit.sendOtpModel!.status == true){
                             AppUtil.successToast(context, "${cubit.sendOtpModel?.message ?? ""} \n ${cubit.sendOtpModel?.data ?? ""}");
                            AppUtil.mainNavigator(context,  VerificationScreen(type: 'register', phone: "${cubit.phoneBusiness.text}" ,email: cubit.emailBusiness.text,));
                            }else{
                             AppUtil.errorToast(context, cubit.sendOtpModel?.message ?? "");
                            }
                              }else{
                                 AppUtil.errorToast(context, "All fields required".tr()); 
                              }
                            }
                            });
                            
                          },),
                          SizedBox(width: 30,),
                          CustomButton(width: 140,textColor:AppUI.mainColor ,color: AppUI.secondColor,text: tabController.index == 0 ?  "cancel".tr() : "Previous".tr() , radius: 20 ,onPressed: (() {
                            setState(() {
                            if ((tabController.index > 0) && (tabController.index <= 3))  {
                            tabController.index -= 1; 
                            curIndex -= 1;
                            lastIndex =  curIndex;
                            }else if (tabController.index == 0){

                            }
                            });
                            

                           }),),
                        ],
                      ),
            ),
                    //     Container(height: 100,color: AppUI.mainColor,
                    //  child: Center(child:  Row(
                    //        mainAxisAlignment: MainAxisAlignment.center,
                    //       children: [
                    //     //   CustomButton(width: 140,text:  "Reason" , radius: 20 ,onPressed: (() {
                    //     //  }),),
                    //     InkWell(onTap: () {
                    //       setState(() {
                    //         if (tabController.index < 3){
                    //         print(tabController.index);
                    //        tabController.index += 1; 
                    //        lastIndex =  curIndex;
                    //        curIndex += 1; 
                    //         }
                    //       });
                    //       print("x");
                          
                    //     },child: Text("Reason"),),
                         
                    //      SizedBox(width: 30,),
                    //     // CustomButton(width: 140,textColor:AppUI.mainColor , color: AppUI.secondColor,text: "next"  , radius: 20 , onPressed: () {
                    //     //   AppUtil.mainNavigator(context, const LoginScreen());
                    //     // },),
                    //   ],
                    // ),),)
          ],
        ),
      );
          
          }));
    
  }
}