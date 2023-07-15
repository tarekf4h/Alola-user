import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/auth/auth_cubit.dart';
import '../../../shared/components.dart';
import '../../../utilities/app_ui.dart';
import '../../../utilities/app_util.dart';
import '../../map/locations_screen.dart';

class CompanyData3 extends StatefulWidget {
  const CompanyData3({Key? key}) : super(key: key);

  @override
  State<CompanyData3> createState() => _CompanyData3State();
}

class _CompanyData3State extends State<CompanyData3> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit,AuthState>(
       buildWhen: (_,state) => state is PhotosChangeState,
        builder: (context, state) {
          var cubit = AuthCubit.get(context);
          return Form(
            key: cubit.businessAccountFormKey3,
           child : Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: ListView(
        children: [
         SizedBox(height: 15,),
         CustomText(text: "The main attachments to accept the applicationt".tr() , fontSize: 16, fontWeight: FontWeight.w700,color: AppUI.titleColor,),
         SizedBox(height: 15,),
         InkWell(onTap: () {
            cubit.chooseImageDialog(context, "procurement");
         },
          child: CustomeCompanyData(mainTitel: "Procurement form with company stamp".tr(),file: cubit.procurement,),),
         SizedBox(height: 10,),
         InkWell(onTap: () {
           cubit.chooseImageDialog(context, "commercialRegistration");
           setState(() {
             
           });
         },
          child: CustomeCompanyData(mainTitel: "Photocopy Commercial registration".tr(),file: cubit.commercialRegistration,),),
          SizedBox(height: 10,),
          InkWell(onTap: () {
           cubit.chooseImageDialog(context, "bankStatementFor6Months");
         },
          child: CustomeCompanyData(mainTitel: "Bank statement for 6 months".tr(),file: cubit.bankStatementFor6Months,),),
          SizedBox(height: 10,),
          InkWell(onTap: () {
           cubit.chooseImageDialog(context, "taxCertificate");
         },
          child: CustomeCompanyData(mainTitel: "Photocopy of tax certificate".tr(),file: cubit.taxCertificate,),),
          SizedBox(height: 10,),
          InkWell(onTap: () {
           cubit.chooseImageDialog(context, "identityOfTheOwnerOrOwnersImage");
         },
          child: CustomeCompanyData(mainTitel: "Photocopy of the identity of the owner or the owners".tr(),file: cubit.identityOfTheOwnerOrOwnersImage,),),
          SizedBox(height: 10,),
          InkWell(onTap: () {
           cubit.chooseImageDialog(context, "nationalAddress");
         },
          child: CustomeCompanyData(mainTitel: "Photocopy of the national address".tr(),file: cubit.nationalAddress,),),
          SizedBox(height: 15,),
          CustomText(text: "Company location".tr() , fontSize: 16, fontWeight: FontWeight.w700,color: AppUI.titleColor,),
          SizedBox(height: 15,),
          InkWell(child:  SelectLocationContainer(),onTap: () {
            AppUtil.mainNavigator(context, LocationsScreen(),);

          },),
          SizedBox(height: 10,),
         Container(width: 300,child: CustomInput(controller: cubit.streetNameBusiness, textInputType: TextInputType.text , lable: "Street name".tr() ,)),
         SizedBox(height: 10,),
         Row(children: [
          Expanded(child: CustomInput(controller: cubit.blockNameBusiness, textInputType: TextInputType.number , lable: "Block number".tr() ,),),
          SizedBox(width: 10,),
          Expanded(child: CustomInput(controller: cubit.apartmentNameBusiness, textInputType: TextInputType.number , lable: "Flat number".tr() ,),),
          ],),
         SizedBox(height: 10,),
         Container(width: 300,child: CustomInput(controller: cubit.specialMarqueBusiness, textInputType: TextInputType.text , lable: "Special marque".tr(),)),
         SizedBox(height: 15,),
        ],

      ),
    ));
        }
          );

  }
}