import 'package:adelco_user/shared/components.dart';
import 'package:adelco_user/utilities/app_ui.dart';
import 'package:date_field/date_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/auth/auth_cubit.dart';

class CompanyData extends StatefulWidget {
  const CompanyData({Key? key}) : super(key: key);

  @override
  State<CompanyData> createState() => _CompanyDataState();
}

class _CompanyDataState extends State<CompanyData> {
  var list = [
    {"name": "IT", "id": "12"},
    {"name": "HR", "id": "14"},
    {"name": "Engineering", "id": "17"},
  ];
  List<DropdownMenuItem<String>> dropdownItems = [];
  String selectedCurrency = 'IT';
  List<DropdownMenuItem<String>> requestTypeDropdown = [];
  List<DropdownMenuItem<String>> activityDropdown = [];
  List<DropdownMenuItem<String>> customerActivityDropdown = [];
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   final cubit = TasksCubit.get(context);
  //   cubit.employeeId = null;
  //       dropdownEmployee = List.generate(
  //    cubit.getEmployeesModel?.employee?.length ?? 0,
  //     (index) => DropdownMenuItem(
  //       value: "${cubit.getEmployeesModel?.employee?[index].id}",
  //       child: Text(
  //        "${cubit.getEmployeesModel?.employee?[index].name}",
  //       ),
  //     ),
  //   );
  // }
  @override
  void initState() {
    super.initState();
    var cubit = AuthCubit.get(context);
   cubit.orderTypeBusiness = null;
    requestTypeDropdown = List.generate(
     cubit.getCompaniesOrderTypesListModel?.item?.length ?? 0,
      (index) => DropdownMenuItem(
        value: "${cubit.getCompaniesOrderTypesListModel?.item?[index].code}",
        child: Text(
         "${cubit.getCompaniesOrderTypesListModel?.item?[index].title}"
        ),
      ),
    );
    cubit.activityBusiness = null;
    activityDropdown = List.generate(
     cubit.getCommercialActivitiesListModel?.item?.length ?? 0,
      (index) => DropdownMenuItem(
        value: "${cubit.getCommercialActivitiesListModel?.item?[index].code}",
        child: Text(
         "${cubit.getCommercialActivitiesListModel?.item?[index].title}"
        ),
      ),
    );
    cubit.clientCategoryIdBusiness = null;
    customerActivityDropdown = List.generate(
     cubit.getClientCategoriesLisModel?.item?.length ?? 0,
      (index) => DropdownMenuItem(
        value: "${cubit.getClientCategoriesLisModel?.item?[index].id}",
        child: Text(
         "${cubit.getClientCategoriesLisModel?.item?[index].title}"
        ),
      ),
    );
    // dropdownItems = List.generate(
    //   list.length,
    //   (index) => DropdownMenuItem(
    //     value: list[index]["id"],
    //     child: Text(
    //      "${list[index]["name"]}",
    //     ),
    //   ),
    // );
  }
  @override
  Widget build(BuildContext context) {

  String dropdownvalue = 'Item 1'; 
    return BlocBuilder<AuthCubit,AuthState>(
        builder: (context, state) {
          var cubit = AuthCubit.get(context);
          return Form(
            key: cubit.businessAccountFormKey1,
           child: Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: ListView(
        children: [
          CustomText(text: "Company Data".tr() , fontSize: 16, fontWeight: FontWeight.w700,color: AppUI.titleColor,),
          SizedBox(height: 10,),
          Container(width: 300,child: CustomInput(controller: cubit.nameBusiness, textInputType: TextInputType.text , lable: "Company name".tr() ,)),
          SizedBox(height: 10,),
          Container(width: 300,child: CustomInput(controller: cubit.commercialActivitiesBusiness, textInputType: TextInputType.text , lable: "Commercial activity".tr() ,)),
          SizedBox(height: 10,),
          Container(width: 300,child: CustomInput(controller: cubit.commercialActivitiesNumberBusiness, textInputType: TextInputType.phone , lable: "Commercial Registration No".tr(),)),
          SizedBox(height: 10,),
         CustomDateTimeFormField (label: "Select date".tr() ,onDateSelected: (p0) {
          cubit.dateBusiness = DateFormat("yyyy-MM-dd" ,"en_ISO").format(p0); 
         },),
         SizedBox(height: 10,),
         CustomDropdownButtonFormField(items:requestTypeDropdown ,label: "Request type".tr(),onChanged: (p0) {
          cubit.orderTypeBusiness = p0;
          print(p0);
         },),
         
         SizedBox(height: 10,),
         CustomDropdownButtonFormField(items:activityDropdown ,label: "Activity".tr(),onChanged: (p0) {
          cubit.activityBusiness = p0;
          print(p0);
         },),
         SizedBox(height: 10,),
         Container(width: 300,child: CustomInput(controller: cubit.postalBusiness, textInputType: TextInputType.phone , lable: "PO Box".tr(),)),
         SizedBox(height: 10,),
         Container(width: 300,child: CustomInput(controller: cubit.cityBusiness, textInputType: TextInputType.text , lable: "City".tr(),)),
         SizedBox(height: 10,),
         Container(width: 300,child: CustomInput(controller: cubit.countryCodeBusiness, textInputType: TextInputType.phone , lable: "Postal code".tr(),)),
         SizedBox(height: 10,),
         CustomInput(controller: cubit.phoneBusiness, lable: "Phone".tr(), textInputType: TextInputType.phone,prefixIcon:  CustomText(text: "+966",fontSize: 16.0,color: AppUI.blackColor),),
        //  Container(width: 300,child: CustomInput(controller: cubit.phoneBusiness, textInputType: TextInputType.phone , lable: "Phone".tr() ,)),
         SizedBox(height: 10,),
         Container(width: 300,child: CustomInput(controller: cubit.faxBusiness, textInputType: TextInputType.phone , lable: "Fax".tr() ,)),
         SizedBox(height: 10,),
         Container(width: 300,child: CustomInput(controller: cubit.emailBusiness, textInputType: TextInputType.emailAddress , lable: "email".tr() ,)),
         SizedBox(height: 10,),
         Container(width: 300,child: CustomInput(controller: cubit.websiteBusiness, textInputType: TextInputType.text , lable: "Website".tr() ,)),
         SizedBox(height: 10,),
         CustomDropdownButtonFormField(items:customerActivityDropdown ,label: "Customer activity".tr(),onChanged: (p0) {
          cubit.clientCategoryIdBusiness = p0;
          print(p0);
         },),
        ],

      ),
    )
          );
        });
  }
}

