import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/auth/auth_cubit.dart';
import '../../shared/components.dart';
import '../../utilities/app_ui.dart';
import '../../utilities/app_util.dart';

class NewPasswordScreen extends StatefulWidget {
  final String phone;
  const NewPasswordScreen({Key? key , required this.phone}) : super(key: key);

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: customAppBar(centerTitle: true , title: "rePass".tr() ),
      body: BlocBuilder<AuthCubit,AuthState>(
        builder: (context, state) {
          var cubit = AuthCubit.get(context);
          return Form(
            key: cubit.newPassFormKey,
            child:
            Padding(
              padding: const EdgeInsets.only(left: 50 , right: 50 ),
              child: 
              // Center(
                // child:
                 SingleChildScrollView(
                  child:
                   Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     SizedBox(height: 30,),
                     Container(width: 300,child: CustomInput(obscureText: true ,controller: cubit.newPassword, textInputType: TextInputType.text , lable: "pass".tr(),)),
                     SizedBox(height: 10,),
                     Container(width: 300,child: CustomInput(obscureText: true ,controller: cubit.newConfirmPassword, textInputType: TextInputType.text , lable: "Confirm New Password".tr(),)),
                     SizedBox(height: 30,),
                     if(state is ForgotPasswordLoadingState)
                    const LoadingWidget()
                    else
                     Container(width: 300,
                     child: CustomButton(text: "send".tr() , radius: 20 , onPressed: () async {
                        if(cubit.newPassFormKey.currentState!.validate()) {
                        await cubit.forgotPassword(context, widget.phone);
                        if(cubit.changePassModel?.status == true){
                         Navigator.of(context)..pop()..pop()..pop();
                            AppUtil.successToast(context, cubit.changePassModel?.message ?? "");
                            cubit.newPassword.text = "";
                            cubit.newConfirmPassword.text = "";
                        }else{
                          AppUtil.errorToast(context, cubit.changePassModel?.message);
                        }
                      }
                     },),),
                     SizedBox(height: 20,),
                     Container(width: 300,
                     child: CustomButton(textColor:AppUI.mainColor ,color: AppUI.secondColor,text: "cancel".tr() , radius: 20,onPressed: () {
                       Navigator.of(context)..pop()..pop()..pop();
                     },),),
                     
                     ],
                ),),
              // ),
            )
          );
            
        }
      )
    );
  }
}