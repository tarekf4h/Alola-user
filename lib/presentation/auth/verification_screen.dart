import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/auth/auth_cubit.dart';
import '../../bloc/bottom_nav/bottom_nav_cubit.dart';
import '../../shared/cash_helper.dart';
import '../../shared/components.dart';
import '../../utilities/app_ui.dart';
import '../../utilities/app_util.dart';
import '../bottom_nav/bottom_nav_tabs_screen.dart';
import 'new_password_screen.dart';

class VerificationScreen extends StatefulWidget {
  final String type;
  final String phone;
  final String email;
  const VerificationScreen({Key? key,required this.type ,required this.phone , required this.email }) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
    int? code;
  int seconds=60;
    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var cubit = AuthCubit.get(context);
    cubit.verifyCode.text = "";
    timer();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: customAppBar(title: ""),
      body: BlocBuilder<AuthCubit,AuthState>(
        builder: (context, state) {
          var cubit = AuthCubit.get(context);
          return Form(
            key: cubit.checkFormKey,
            child:
            Padding(
              padding: const EdgeInsets.only(left: 50 , right: 50 ),
              child: Center(
                child: SingleChildScrollView(
                  child:
                   Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Image.asset(
                     '${AppUI.imgPath}Mobile login-cuate.png',
                     width: 250,
                     height: 280,),
                     Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [ CustomText(text: "${"enterCode".tr()} ${widget.phone}" ,fontSize: 22,color: AppUI.blackColor,)],),
                     SizedBox(height: 10,),
                     Container(width: 300,child: CustomInput(controller: cubit.verifyCode, textInputType: TextInputType.phone , lable: "verifyCode".tr() ,)),
                     SizedBox(height: 20,),

                     Row(
                      children: [
                        InkWell(
                          onTap: () async {
                            if(seconds==0){
                              seconds = 60;
                              timer();
                              await cubit.sendOtp(context, widget.type, widget.phone, widget.email);
                      if (cubit.sendOtpModel?.status == true) {
                      AppUtil.successToast(context, "${cubit.sendOtpModel?.message ?? ""} \n ${cubit.sendOtpModel?.data ?? ""}");
                        AppUtil.successToast(
                            context, cubit.sendOtpModel?.message);
                      } else {
                        AppUtil.errorToast(
                            context, cubit.sendOtpModel?.message);
                      }
                            }
                          },
                            child: CustomText(text: "resendCode".tr(),textDecoration: TextDecoration.underline,color: seconds==0?AppUI.secondColor:AppUI.shimmerColor,)),
                        const Spacer(),
                        CustomText(text: "00:${seconds<10?"0$seconds":seconds.toString()}",color: Colors.grey.shade500,),
                      ],
                    ),
                    // Container(
                    //   width: 300,
                    //    child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.start,
                    //     children: [
                    //     InkWell(
                    //       child: CustomText(text: "resendCode".tr() , fontWeight: FontWeight.w700,color: AppUI.blackColor , textDecoration: TextDecoration.underline,),
                    //       onTap: () {
                    //       }
                    //    ,),
                    //     ],),
                    //  ),
                     SizedBox(height: 20,),
                     Container(
                     child: state is VerifyOtpLoadingState ? LoadingWidget(): CustomButton(text:  "send".tr() , radius: 20 ,onPressed: (() async {
                            if (cubit.checkFormKey.currentState!.validate()) {
                              // if (cubit.verifyController1.text.isNotEmpty && cubit
                              //     .verifyController2.text.isNotEmpty && cubit.verifyController3
                              //     .text.isNotEmpty && cubit.verifyController4.text.isNotEmpty) {
                                  await cubit.verifyOtp(context, cubit.verifyCode.text, widget.phone);
                                  if (cubit.verifyOtpModel?.status == true) {
                                    AppUtil.successToast(
                                        context, cubit.verifyOtpModel?.message);

                                  if (widget.type == "register") {
                                    if (widget.phone == cubit.registerPhone.text){
                                  await cubit.register(context);
                                  if(cubit.registerModel?.status == true){
                                   CashHelper.setSavedString("id", cubit.registerModel?.data?.accessToken ?? "");
                                   CashHelper.setSavedString("name",cubit.registerModel?.data?.userData?.name ?? "");
                                                            var name =  await CashHelper.getSavedString("name", "");
                          AppUtil.name = name;
                                   AppUtil.isLogin = true;
                          AppUtil.successToast(context, cubit.registerModel?.message);
                          BottomNavCubit.get(context).setCurrentIndex(0);
                          AppUtil.removeUntilNavigator(
                              context,  BottomNavTabsScreen());
                                  }else{
                                  AppUtil.errorToast(context, cubit.registerModel?.message ?? "");
                                  }
                                  }else{
                                   await cubit.createBusinessAccount(); 
                                  if(cubit.createBusinessAccountModel?.status == true){
                                   CashHelper.setSavedString("id", cubit.createBusinessAccountModel?.data?.accessToken ?? "");
                                   CashHelper.setSavedString("name",cubit.createBusinessAccountModel?.data?.userData?.name ?? "");
                                                            var name =  await CashHelper.getSavedString("name", "");
                          AppUtil.name = name;
                                   AppUtil.isLogin = true;
                          AppUtil.successToast(context, cubit.createBusinessAccountModel?.message);
                          BottomNavCubit.get(context).setCurrentIndex(0);
                          AppUtil.removeUntilNavigator(
                              context,  BottomNavTabsScreen());
                                  }else{
                                  AppUtil.errorToast(context, cubit.registerModel?.message ?? "");
                                  }
                                  }
                                  }else{
                                    AppUtil.successToast(context, cubit.verifyOtpModel?.message ?? "");
                                    AppUtil.mainNavigator(context,  NewPasswordScreen(phone: widget.phone,));
                                  }

                                  } else {
                                    AppUtil.errorToast(
                                        context, cubit.verifyOtpModel?.message);
                                  }
                              }

                            }
                    //  AppUtil.mainNavigator(context, const NewPasswordScreen());

                     )),),
                     SizedBox(height: 40,),
                     
                     ],
                ),),
              ),
            )
          );
            
            }
            )
    );
  }
    timer(){
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if(seconds!=0){
        seconds--;
        setState(() {});
      }else{
        timer.cancel();
      }
    });
  }
}