import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/auth/auth_cubit.dart';
import '../../../shared/components.dart';
import '../../../utilities/app_ui.dart';

class CompanyData4 extends StatefulWidget {
  const CompanyData4({Key? key}) : super(key: key);

  @override
  State<CompanyData4> createState() => _CompanyData4State();
}

class _CompanyData4State extends State<CompanyData4> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit,AuthState>(
        builder: (context, state) {
          var cubit = AuthCubit.get(context);
          return Form(
            key: cubit.businessAccountFormKey4,
           child :  Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: ListView(
        children: [
          CustomText(text: "Account details".tr() , fontSize: 16, fontWeight: FontWeight.w700,color: AppUI.titleColor,),
          SizedBox(height: 10,),
          Container(width: 300,child: CustomInput(controller: cubit.phoneBusiness, textInputType: TextInputType.phone , lable: "Phone".tr() ,)),
          SizedBox(height: 10,),
          Container(width: 300,child: CustomInput(controller: cubit.passwordBusiness, textInputType: TextInputType.text , lable: "pass".tr(),obscureText:true ,)),
          SizedBox(height: 10,),
          Container(width: 300,child: CustomInput(controller: cubit.confirmPasswordBusiness, textInputType: TextInputType.text , lable: "rePass".tr(),obscureText:true)),
         
        ],

      ),
           )
          );
        }
    );
  }
}