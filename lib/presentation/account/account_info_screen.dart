import 'package:adelco_user/shared/components.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/auth/auth_cubit.dart';
import '../../shared/cash_helper.dart';
import '../../utilities/app_ui.dart';
import '../../utilities/app_util.dart';

class AccountInfoScreen extends StatefulWidget {
  const AccountInfoScreen({Key? key}) : super(key: key);

  @override
  State<AccountInfoScreen> createState() => _AccountInfoScreenState();
}

class _AccountInfoScreenState extends State<AccountInfoScreen> {
    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final cubit = AuthCubit.get(context);
    cubit.isUpdate = false;
    cubit.profile();
  }
  @override
  Widget build(BuildContext context) {
        final cubit = AuthCubit.get(context);
    
    return BlocBuilder<AuthCubit,AuthState>(
                      buildWhen : (_,state) => state is GetUserInfoLoadingState || state is GetUserInfoLoadedState || state is GetUserInfoErrorState ||
                      state is UpdateProfileLoadingState || state is UpdateProfileLoadedState || state is UpdateProfileErrorState ,
                      builder: (context, state) { 
        // if (state is GetUserInfoLoadingState){
        //   return  const LoadingWidget();
        // } 
      return Scaffold(
      appBar: customAppBar(title: "Account info".tr() ,  centerTitle:  true ,elevation: 00.5,  actions:[ Center(child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: InkWell(child:  CustomText(text: "Update".tr() , fontWeight: FontWeight.bold,) , onTap: () {
            cubit.isUpdate = true;
           setState(() {
             
           });
        },),
      ))]),
      body: state is GetUserInfoLoadingState ? LoadingWidget(): Form(
            key: cubit.profileFormKey,
            child: Padding(padding: EdgeInsets.all(20),
      child: ListView(children: [
        SizedBox(height: 10,),
                     Container(child: CustomInput(readOnly: !cubit.isUpdate ,controller: cubit.updateName, textInputType: TextInputType.text , lable: "Name".tr(),)),
                     SizedBox(height: 10,),
                     Container(child: CustomInput(
                           suffixIcon:AppUtil.Lang == "ar" ? Container(
                              width: 70,
                              padding: EdgeInsets.only(left: 4, bottom: 2,right:8 ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  
                                    CustomText(
                                    text:  "966+" ,
                                    color: AppUI.blackColor,
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),
                                 
                                  Image.asset(
                                    '${AppUI.imgPath}ksa.png',
                                    width: 16,
                                    height: 16,
                                  ), 
                                  
                                ],
                              ),
                            )   : null         ,
                           prefixIcon: AppUtil.Lang == "en" ? Container(
                              width: 70,
                              padding: EdgeInsets.only(left: 4, bottom: 2,right:8 ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  
                                  Image.asset(
                                    '${AppUI.imgPath}ksa.png',
                                    width: 16,
                                    height: 16,
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  CustomText(
                                    text: "+966",
                                    color: AppUI.blackColor,
                                  )
                                  
                                ],
                              ),
                            )   : null,
                         readOnly: !cubit.isUpdate ,controller: cubit.updatePhone, textInputType: TextInputType.phone , lable: "Phone".tr() ,)),
                     SizedBox(height: 10,),
                     Container(child: CustomInput(readOnly: !cubit.isUpdate ,controller: cubit.updateEmail, textInputType: TextInputType.text , lable: "email".tr(),)),
                     SizedBox(height: 10,),
            if (cubit.isUpdate == true)...[
            const SizedBox(height: 50,),
            if(state is UpdateProfileLoadingState)
            const LoadingWidget()
            else
            CustomButton(text: 'submit'.tr(),onPressed: () async {
              
              if(cubit.profileFormKey.currentState!.validate()) {
               await cubit.updateProfile(context);
               if (cubit.updateProfileModel?.status == true){
                cubit.isUpdate = false;
                CashHelper.setSavedString("name", cubit.updateName.text);
                var name =  await CashHelper.getSavedString("name", "");
                          AppUtil.name = name;
              AppUtil.successToast(context, cubit.updateProfileModel?.message);
              //   AppUtil.successDialog(context, msg: cubit.updateProfileModel?.message ?? "", onFinish: (){
                Navigator.pop(context);
              //   Navigator.pop(context);
              // });
               }else{
               AppUtil.errorToast(context,cubit.updateProfileModel?.message ?? "");
               }
                
              }
              setState(() {
                
              });
              // AppUtil.mainNavigator(context,  VerificationScreen(type: 'updateProfile' , phone: "", email: "",));
            },)
            ]
      ],),
      ),
      )
    );
    
                      }
    );
  }
}