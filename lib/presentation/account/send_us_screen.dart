import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/auth/auth_cubit.dart';
import '../../shared/components.dart';
import '../../utilities/app_util.dart';

class SendUsScreen extends StatefulWidget {
  const SendUsScreen({Key? key}) : super(key: key);

  @override
  State<SendUsScreen> createState() => _SendUsScreenState();
}

class _SendUsScreenState extends State<SendUsScreen> {
    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final cubit = AuthCubit.get(context);
    cubit.contactNotes.text = "";
    cubit.contactTitle.text = "";
    cubit.contactEmail.text = "";
  }
  @override
  Widget build(BuildContext context) {
        final cubit = AuthCubit.get(context);
    return BlocBuilder<AuthCubit,AuthState>(
            buildWhen : (_,state) => state is ContactLoadingState || state is ContactLoadedState || state is ContactErrorState,
           builder: (context, state) { 
        return Scaffold(
      appBar: customAppBar(title: "Send us".tr() , centerTitle: true , elevation: 0.5),
      body: Form(
            key: cubit.contactFormKey,
          child:  Padding(padding: EdgeInsets.all(20),
      child: ListView(children: [
        SizedBox(height: 10,),
                     Container(child: CustomInput(controller: cubit.contactEmail, textInputType: TextInputType.text , lable: "email".tr(),)),
                     SizedBox(height: 10,),
                     Container(child: CustomInput(controller: cubit.contactTitle, textInputType: TextInputType.text , lable: "Message title".tr(),)),
                     SizedBox(height: 10,),
                     Container(child: CustomInput(controller: cubit.contactNotes, textInputType: TextInputType.text , lable: "Note".tr(), maxLines: 4,)),
                     SizedBox(height: 10,),
      ],),
      ),
      ),
      bottomNavigationBar:Container(height: 90,child: Padding(padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20) , child:  state is ContactLoadingState  ? const LoadingWidget(): CustomButton(text: "send".tr(),onPressed: () async {
                   if(cubit.contactFormKey.currentState!.validate()) {
            await cubit.contact();
            if(cubit.contactModel?.status == true){
                  cubit.contactNotes.text = "";
    cubit.contactTitle.text = "";
    cubit.contactEmail.text = "";
              AppUtil.successToast(context, cubit.contactModel?.message);
              //  AppUtil.successDialog(context, msg: "SentSuccessfully".tr(), onFinish: (){
                Navigator.pop(context);
              //   Navigator.pop(context);
              // });
            }else{
            AppUtil.errorToast(context,cubit.contactModel?.message ?? "");
            }

             }
      },),)),

    );
  }
    );
  }
  
}