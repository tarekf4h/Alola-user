
import 'package:adelco_user/presentation/auth/verification_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/auth/auth_cubit.dart';
import '../../shared/components.dart';
import '../../utilities/app_ui.dart';
import '../../utilities/app_util.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: customAppBar(title: "createAccount".tr() , centerTitle: true),
      body: BlocBuilder<AuthCubit,AuthState>(
        builder: (context, state) {
          var cubit = AuthCubit.get(context);
          return Form(
            key: cubit.registerFormKey,
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
                     Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [ CustomText(text: "welcomeTo".tr() ,fontSize: 22,color: AppUI.blackColor,),SizedBox(width: 5,),CustomText(text: "adelco".tr() ,color: AppUI.mainColor,fontSize: 22,)],),
                     SizedBox(height: 10,),
                     CustomText(text: "createAccount".tr() ,fontSize: 22,color: AppUI.blackColor,),
                     SizedBox(height: 10,),
                     Container(child: CustomInput(controller: cubit.registerName, textInputType: TextInputType.text , lable: "Name".tr(),)),
                     SizedBox(height: 10,),
                    CustomInput(controller: cubit.registerPhone, lable: "Phone".tr(), textInputType: TextInputType.phone,prefixIcon:  CustomText(text: "+966",fontSize: 16.0,color: AppUI.blackColor),),
                     SizedBox(height: 10,),
                     Container(child: CustomInput(controller: cubit.registerEmail, textInputType: TextInputType.text , lable: "email".tr(),)),
                     SizedBox(height: 10,),
                     Container(child: CustomInput(obscureText: true ,controller: cubit.registerPassword, textInputType: TextInputType.text , lable: "pass".tr(),)),
                     SizedBox(height: 10,),
                     Container(child: CustomInput(obscureText: true ,controller: cubit.registerConfirmPassword, textInputType: TextInputType.text , lable: "rePass".tr(),)),
                     SizedBox(height: 10,),
                     Container(
                       child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        CustomText(text:"agree".tr() ,color: AppUI.blackColor ),
                        SizedBox(width: 2,),
                        InkWell(
                          child: CustomText(text: "terms".tr() , fontWeight: FontWeight.w700,color: AppUI.blackColor , textDecoration: TextDecoration.underline,),
                          onTap: () {
                          }
                       ,),
                        ],),
                     ),
                     SizedBox(height: 20,),
                    if(state is SendOtpLoadingState)
                    const LoadingWidget()
                    else
                     CustomButton(text:  "createAccount".tr() , radius: 20 ,
                     onPressed: () async {
                              if(cubit.registerFormKey.currentState!.validate()) {
                            await cubit.sendOtp(context, 'register', cubit.registerPhone.text , cubit.registerEmail.text);
                            if(cubit.sendOtpModel!.status == true){
                             AppUtil.successToast(context, "${cubit.sendOtpModel?.message ?? ""} \n ${cubit.sendOtpModel?.data ?? ""}");
                            AppUtil.mainNavigator(context,  VerificationScreen(type: 'register', phone: cubit.registerPhone.text ,email: cubit.registerEmail.text,));
                            }else{
                             AppUtil.errorToast(context, cubit.sendOtpModel?.message ?? "");
                            }
                            }
                     }),
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
}