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

class PhoneScreen extends StatefulWidget {
  const PhoneScreen({Key? key}) : super(key: key);

  @override
  State<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: customAppBar(title: ""),
      body: BlocBuilder<AuthCubit,AuthState>(
        builder: (context, state) {
          var cubit = AuthCubit.get(context);
          return Form(
            key: cubit.phoneFormKey,
            child:
            Padding(
              padding: const EdgeInsets.only(left: 50 , right: 50 ),
              child: Center(
                child: SingleChildScrollView(
                  child:
                   Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Image.asset(
                     '${AppUI.imgPath}Group 53687.png',
                     width: 150,
                     height: 170,),
                     SizedBox(height: 20,),
                     Container(
                      
                       child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [ CustomText(text: "forgotPass".tr() ,fontSize: 22,color: AppUI.blackColor,),SizedBox(height: 20,),CustomTextCenter(text: "password reset code".tr()  ,color: AppUI.greyColor,fontSize: 14,)],),
                     ),
                     SizedBox(height: 20,),
                    CustomInput(controller: cubit.phoneCode, lable: "Phone".tr(), textInputType: TextInputType.phone,prefixIcon:  CustomText(text: "+966",fontSize: 16.0,color: AppUI.blackColor),),

                     SizedBox(height: 20,),
                    if(state is SendOtpLoadingState)
                    const CircularProgressIndicator()
                    else
                     Container(
                     child: CustomButton(text:  "send".tr() , radius: 20 , onPressed: () async {
                       if(cubit.phoneFormKey.currentState!.validate()) {
                              await cubit.sendOtp(context, "forgot", cubit.phoneCode.text , "");
                              if(cubit.sendOtpModel!.status == true){
                                AppUtil.successToast(context, "${cubit.sendOtpModel?.message ?? ""} \n ${cubit.sendOtpModel?.data ?? ""}");
                                AppUtil.mainNavigator(context,  VerificationScreen(type: 'forgot', phone: cubit.phoneCode.text ,email: "",));
                                }else{
                                 AppUtil.errorToast(context, cubit.sendOtpModel?.message ?? "");
                                }
                       }
                              
                     },),),
                    SizedBox(height: 20,),
                    Container(
                     
                       child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        InkWell(
                          child: CustomText(text: "Back to login".tr() , fontWeight: FontWeight.w700,color: AppUI.blackColor , textDecoration: TextDecoration.underline,),
                          onTap: () {
                            Navigator.pop(context);
                          }
                       ,),
                        ],),
                     ),
                     
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