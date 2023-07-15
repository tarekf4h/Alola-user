import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/auth/auth_cubit.dart';
import '../../../shared/components.dart';
import '../../../utilities/app_ui.dart';

class CompanyData2 extends StatefulWidget {
  const CompanyData2({Key? key}) : super(key: key);

  @override
  State<CompanyData2> createState() => _CompanyData2State();
}

class _CompanyData2State extends State<CompanyData2> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit,AuthState>(
        builder: (context, state) {
          var cubit = AuthCubit.get(context);
          return Form(
            key: cubit.businessAccountFormKey2,
           child : Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: ListView(
        children: [
         SizedBox(height: 15,),
         CustomText(text: "Banks dealing with it".tr() , fontSize: 16, fontWeight: FontWeight.w700,color: AppUI.titleColor,),
         SizedBox(height: 15,),
         Container(width: 300,child: CustomInput(controller: cubit.bankNameBusiness, textInputType: TextInputType.text , lable: "Bank name".tr() ,)),
         SizedBox(height: 10,),
         Container(width: 300,child: CustomInput(controller: cubit.branchNameBusiness, textInputType: TextInputType.text , lable: "Branch".tr() ,)),
         SizedBox(height: 10,),
         Container(width: 300,child: CustomInput(controller: cubit.bankAccountNumberBusiness, textInputType: TextInputType.phone , lable: "Account number".tr(),)),
         SizedBox(height: 15,),
         CustomText(text: "Commercial references or suppliers".tr() , fontSize: 16, fontWeight: FontWeight.w700,color: AppUI.titleColor,),
         SizedBox(height: 15,),
         Container(width: 300,child: CustomInput(controller: cubit.companyNameBusiness, textInputType: TextInputType.text , lable: "Company".tr(),)),
         SizedBox(height: 10,),
         Container(width: 300,child: CustomInput(controller: cubit.responsableNameBusiness, textInputType: TextInputType.text , lable: "Responsible person".tr(),)),
         SizedBox(height: 10,),
         Container(width: 300,child: CustomInput(controller: cubit.responsablePhoneBusiness, textInputType: TextInputType.phone , lable: "Phone".tr(),)),
         SizedBox(height: 10,),
         Container(width: 300,child: CustomInput(controller: cubit.taxBusiness, textInputType: TextInputType.phone , lable: "Tax Number".tr() ,)),
         SizedBox(height: 15,),
         CustomText(text: "The manager or directors".tr() , fontSize: 16, fontWeight: FontWeight.w700,color: AppUI.titleColor,),
         SizedBox(height: 15,),
         Container(width: 300,child: CustomInput(controller: cubit.managerNameBusiness, textInputType: TextInputType.text , lable: "Name".tr() ,)),
         SizedBox(height: 10,),
         Container(width: 300,child: CustomInput(controller: cubit.managerDirectPhoneBusiness, textInputType: TextInputType.phone , lable: "Direct phone number".tr() ,)),
         SizedBox(height: 10,),
         Container(width: 300,child: CustomInput(controller: cubit.managerPhoneBusiness, textInputType: TextInputType.phone , lable: "Phone".tr() ,)),
         SizedBox(height: 10,),
 
        ],

      ),
           ));
        }
    );
    
  }
}