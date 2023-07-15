import 'package:adelco_user/shared/components.dart';
import 'package:adelco_user/utilities/app_util.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/addresses/addresses_cubit.dart';
import '../../models/Addresses/address_model.dart';
import '../../utilities/app_ui.dart';
import 'locations_screen.dart';


class AddAddressScreen extends StatefulWidget {
  final bool? update ;
  final Address? data;
  const AddAddressScreen({Key? key , this.update , this.data}) : super(key: key);

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
 bool open = false;
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final cubit = AddressesCubit.get(context);
    cubit.street.text = widget.data?.streetName ?? "";
    cubit.blockName.text = widget.data?.blockName ?? "";
    cubit.apartmentName.text = widget.data?.apartmentName ?? "";
    cubit.specialMarque.text = widget.data?.specialMarque ?? "";

    cubit.latitude = "${widget.data?.latitude}";
    cubit.longitude = "${widget.data?.longitude}";

  }
  @override
  Widget build(BuildContext context) {
        final cubit = AddressesCubit.get(context);

    return BlocBuilder< AddressesCubit, AddressesState>(
          buildWhen : (_,state) => state is  AddAddressLoadingState || state is AddAddressLoadedState || state is AddAddressErrorState ||
          state is  RemoveAddressLoadingState || state is RemoveAddressLoadedState || state is RemoveAddressErrorState ||
          state is  UpdateAddressLoadingState || state is UpdateAddressLoadedState || state is UpdateAddressErrorState ,
          builder: (context, state) {

          return Form(
            key: cubit.addressFormKey,
            child: Scaffold(
      appBar: customAppBar(title: widget.update == true ? "Address details".tr() : "Add a new delivery location".tr(),centerTitle: true , elevation: 0.5 , actions: [
        if(widget.update ?? false)...[
          if(open == false)...[
         Center(
           child: InkWell(child: CustomText(text: "Update".tr(), fontWeight: FontWeight.bold,color: AppUI.mainColor,) ,onTap: () {
             print("Update");
             open = true;
             setState(() {
               
             });
           },),
         )
          ]
          else
         Center(
           child: state is RemoveAddressLoadingState ? LoadingWidget(): InkWell(child: CustomText(text: "Delete".tr(), fontWeight: FontWeight.bold,color: AppUI.errorColor,) ,onTap: () async {
                              await cubit.removeAddress("${widget.data?.id}");
                                   if (cubit.removeAddressModel?.status == true){
                                    AppUtil.successToast(context, cubit.removeAddressModel?.message ?? "");
                                    cubit.getAddress();
                                    Navigator.pop(context, true);
                                   }else{
                                    AppUtil.errorToast(context, cubit.removeAddressModel?.message ?? "");
                                   }
             print("Delete");
             
           },),
         )
          
        ]
      ]),
      body: Padding(
        // key: cubit.addressFormKey,
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: SingleChildScrollView(child: Column(
          children: [
          SizedBox(height: 15,),
          CustomText(text: "Select your location".tr() , fontSize: 16, fontWeight: FontWeight.w700,color: AppUI.titleColor,),
          SizedBox(height: 15,),
          InkWell(child: SelectLocationContainer(title:widget.update == true ?  "${widget.data?.blockName} , ${widget.data?.streetName}  ${widget.data?.specialMarque} "  :null ,), onTap: () {
          if(open){
          AppUtil.mainNavigator(context, LocationsScreen(type: "address",lat:widget.data?.latitude , lng: widget.data?.longitude ,update: widget.data != null ? true:null,),);
          }else if(widget.update != true ){
            AppUtil.mainNavigator(context, LocationsScreen(type: "address"));
          }
          },),  
          SizedBox(height: 10,),
          Container(child: CustomInput(readOnly:  (open == false && widget.update == true) ? true : false ,controller: cubit.street, textInputType: TextInputType.text , lable: "Street name".tr() ,)),
          SizedBox(height: 10,),
          Row(children: [
          Expanded(child: CustomInput(readOnly:  (open == false && widget.update == true) ? true : false ,controller: cubit.blockName, textInputType: TextInputType.number , lable: "Block number".tr() ,),),
          SizedBox(width: 10,),
          Expanded(child: CustomInput(readOnly:  (open == false && widget.update == true) ? true : false ,controller: cubit.apartmentName, textInputType: TextInputType.number , lable: "Flat number".tr() ,),),
          ],),
         SizedBox(height: 10,),
         Container(child: CustomInput(readOnly:  (open == false && widget.update == true) ? true : false ,controller: cubit.specialMarque, textInputType: TextInputType.text , lable: "Special marque".tr(),)),
         SizedBox(height: 15,),
         if (open || widget.update != true  )...[
        //  Spacer(),
        SizedBox(height: 60,),
        if(state is UpdateAddressLoadingState || state is AddAddressLoadingState)
        LoadingWidget()
        else
        CustomButton(textColor:AppUI.whiteColor ,color: AppUI.mainColor,text: "save".tr() , radius: 20,onPressed: () async {
                           if(cubit.addressFormKey.currentState!.validate()) {
                                  if(cubit.latitude == null|| cubit.longitude == null || cubit.latitude == "null"|| cubit.longitude == "null"){
                                    AppUtil.errorToast(context, "Select your location".tr());
                                } else{
                                  if(widget.update == true){
                                   await cubit.updateAddress("${widget.data?.id}");
                                   if (cubit.updateAddressModel?.status == true){
                                    AppUtil.successToast(context, cubit.updateAddressModel?.message ?? "");
                                    cubit.getAddress();
                                    Navigator.pop(context, true);
                                   }else{
                                    AppUtil.errorToast(context, cubit.updateAddressModel?.message ?? "");
                                   }
                                  }else{
                                   await cubit.addAddress();
                                   if (cubit.addAddressModel?.status == true){
                                    AppUtil.successToast(context, cubit.addAddressModel?.message ?? "");
                                    cubit.getAddress();
                                    Navigator.pop(context, true);
                                   }else{
                                    AppUtil.errorToast(context, cubit.addAddressModel?.message ?? "");
                                   }
                                  }
                                  }
                              }       
        },),
         SizedBox(height: 15,),
         CustomButton(textColor:AppUI.mainColor ,color: AppUI.secondColor,text: "cancel".tr() , radius: 20,onPressed: () {
                      Navigator.pop(context, true);  
                     },),
        SizedBox(height: 15,),  
         ]        
        ],
        ),
        )
      ),
            )
      );
    
          }

    );
  }
}