import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/auth/auth_cubit.dart';
import '../../shared/components.dart';
import '../../utilities/app_ui.dart';
import '../../utilities/app_util.dart';
import 'new_password_screen.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: customAppBar(title: ""),
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
                     '${AppUI.imgPath}Mobile login-cuate.png',
                     width: 250,
                     height: 280,),
                     Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [ CustomText(text: "enterCode".tr() ,fontSize: 22,color: AppUI.blackColor,),SizedBox(width: 5,),CustomText(text: "05620000000000" ,color: AppUI.mainColor,fontSize: 22,)],),
                     SizedBox(height: 10,),
                     Container(width: 300,child: CustomInput(controller: TextEditingController(), textInputType: TextInputType.phone , lable: "verifyCode".tr() ,)),
                     SizedBox(height: 20,),
                    Container(
                      width: 300,
                       child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                        InkWell(
                          child: CustomText(text: "resendCode".tr() , fontWeight: FontWeight.w700,color: AppUI.blackColor , textDecoration: TextDecoration.underline,),
                          onTap: () {
                          }
                       ,),
                        ],),
                     ),
                     SizedBox(height: 20,),
                     Container(width: 300,
                     child: CustomButton(text:  "send".tr() , radius: 20 ,onPressed: (() {
                     AppUtil.mainNavigator(context, const NewPasswordScreen());

                     })),),
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