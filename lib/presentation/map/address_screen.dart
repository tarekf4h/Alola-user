import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../bloc/addresses/addresses_cubit.dart';
import '../../shared/components.dart';
import '../../utilities/app_ui.dart';
import '../../utilities/app_util.dart';
import 'add_address_screen.dart';
import 'locations_screen.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final cubit = AddressesCubit.get(context);
    cubit.getAddress();
  }
  var select = -1 ;
  @override
  Widget build(BuildContext context) {
        final cubit = AddressesCubit.get(context);
    return Scaffold(
                  appBar:  customAppBar(title: "Addressees".tr() , centerTitle: true , elevation: 0.5),
                  body: BlocBuilder< AddressesCubit, AddressesState>(
          buildWhen : (_,state) => state is  GetAddressLoadingState || state is GetAddressLoadedState || state is GetAddressErrorState,
          builder: (context, state) {
            if(state is GetAddressLoadingState){
              return const LoadingWidget();
            }
            if(state is  GetAddressErrorState){
              return const ErrorFetchWidget();
            }
          return 
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children:[
                          Expanded(
                            child: ListView.separated(
                              
                    separatorBuilder: (context, index) {
                      return  Divider(
                        color: AppUI.shimmerColor.withOpacity(0),
                        thickness: 0,
                      );
                    },
                    scrollDirection: Axis.vertical,
                    itemCount: (cubit.getAddressModel?.address?.length ?? 0) + 1,
                    itemBuilder: (context, count) {
                      return count != (((cubit.getAddressModel?.address?.length ?? 0) + 1) - 1) ? InkWell(child: Padding(padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                      child: Container(
                      decoration: BoxDecoration(
                      color: AppUI.whiteColor,
                      // border: Border.all(color:select==count ? AppUI.mainColor:AppUI.shimmerColor),
                      border: Border.all(color:AppUI.shimmerColor),
                      borderRadius: BorderRadius.circular(8),),
                      padding: EdgeInsets.all(8),
                      child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                      SvgPicture.asset("${AppUI.iconPath}mapMarker.svg" , color: select==count ? AppUI.mainColor:AppUI.mainColor),
                      SizedBox(width: 10,),
                      Expanded(child: 
                      CustomText(text: "${cubit.getAddressModel?.address?[count].blockName} , ${cubit.getAddressModel?.address?[count].streetName}  ${cubit.getAddressModel?.address?[count].specialMarque} " , color: AppUI.blackColor, fontSize: 12,),),
                      ],),)
                      ),
                      onTap: () {
                        select = count;
                        print(select);
                        AppUtil.mainNavigator(context, AddAddressScreen(data: cubit.getAddressModel?.address?[count],update: true,));
                        setState(() {
                          
                        });
                      },
                      ) : InkWell( child :
                          Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                      SvgPicture.asset("${AppUI.iconPath}mapMarkerPlus.svg"),
                      SizedBox(width: 10,),
                      Expanded(child: 
                      CustomText(text: "Add a new delivery location".tr() , color: AppUI.blackColor, fontSize: 14,fontWeight: FontWeight.w600,),),
                      ],),
                      onTap: () {
                        AppUtil.mainNavigator(context, AddAddressScreen());
                      },
                      );

                    }),
                          ),
                          SizedBox(height: 20,) ,
                      //     InkWell( child :
                      //     Row(
                      // mainAxisSize: MainAxisSize.min,
                      // children: [
                      // SvgPicture.asset("${AppUI.iconPath}mapMarkerPlus.svg"),
                      // SizedBox(width: 10,),
                      // Expanded(child: 
                      // CustomText(text: "Add a new delivery location".tr() , color: AppUI.blackColor, fontSize: 14,fontWeight: FontWeight.w600,),),
                      // ],),
                      // onTap: () {
                      //   AppUtil.mainNavigator(context, AddAddressScreen());
                      // },
                      // )
                        ],
                      ),
                    ),
                  );
          }
                  )
                );
  }
}