import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/auth/auth_cubit.dart';
import '../../shared/components.dart';
import '../../utilities/app_ui.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({Key? key}) : super(key: key);

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
                    //   Image.asset(
                    //  '${AppUI.imgPath}Group 53687.png',
                    //  width: 150,
                    //  height: 170,),
                    //  Container(
                    //   width: 300,
                    //    child: Column(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [ CustomText(text:"rePass".tr() ,fontSize: 22,color: AppUI.blackColor,)],),
                    //  ),
                     SizedBox(height: 30,),
                     Container(width: 300,child: CustomInput(obscureText: true ,controller: TextEditingController(), textInputType: TextInputType.text , lable: "pass".tr(),)),
                     SizedBox(height: 10,),
                     Container(width: 300,child: CustomInput(obscureText: true ,controller: TextEditingController(), textInputType: TextInputType.text , lable: "Confirm New Password".tr(),)),
                     SizedBox(height: 30,),
                     Container(width: 300,
                     child: CustomButton(text: "send".tr() , radius: 20),),
                     SizedBox(height: 20,),
                     Container(width: 300,
                     child: CustomButton(textColor:AppUI.mainColor ,color: AppUI.secondColor,text: "cancel".tr() , radius: 20),),
                     
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