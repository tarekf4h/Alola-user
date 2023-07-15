import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../bloc/Checkout/checkout_cubit.dart';
import '../../bloc/addresses/addresses_cubit.dart';
import '../../bloc/product/product_cubit.dart';
import '../../shared/cash_helper.dart';
import '../../shared/components.dart';
import '../../utilities/app_ui.dart';
import '../../utilities/app_util.dart';
import 'add_address_screen.dart';

class SelectAddressBottomSheet extends StatefulWidget {
  final Function()? update;
  const SelectAddressBottomSheet({Key? key, this.update}) ;

  @override
  State<SelectAddressBottomSheet> createState() => _SelectAddressBottomSheetState();
}

class _SelectAddressBottomSheetState extends State<SelectAddressBottomSheet> {
   Function()? updateNew;
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
    final cubitCheckout = CheckoutCubit.get(context);

    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: SizedBox(
                  height: AppUtil.responsiveHeight(context)*0.8,
                  child:
                   Scaffold(
                    backgroundColor: Colors.transparent,
                    appBar: AppBar(
                     backgroundColor: Colors.transparent,
                     centerTitle: true,
                    title: CustomText(text: "Choose delivery location".tr() , color: AppUI.blackColor , fontSize: 20,), 
                    elevation: 0 ,
                    leadingWidth: 50,
                    leading:InkWell(onTap: () {
                    Navigator.pop(context, true); 
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset("${AppUI.imgPath}closePopup.png",height: 15,width: 15),
                    )
                    )),
                    body:BlocBuilder< AddressesCubit, AddressesState>(
          buildWhen : (_,state) => state is  GetAddressLoadingState || state is GetAddressLoadedState || state is GetAddressErrorState ||
          state is  DefaultAddressLoadingState || state is DefaultAddressLoadedState || state is DefaultAddressErrorState,
          builder: (context, state) {
            if(state is GetAddressLoadingState){
              return const LoadingWidget();
            }
            if(state is  GetAddressErrorState){
              return const ErrorFetchWidget();
            }
          return Center(
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
                      itemCount: cubit.getAddressModel?.address?.length ?? 0,
                      itemBuilder: (context, count) {
                        return InkWell(child: Padding(padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                        child: Container(
                        decoration: BoxDecoration(
                        color: AppUI.whiteColor,
                        border: Border.all(color:select==count ? AppUI.mainColor:AppUI.shimmerColor),
                        borderRadius: BorderRadius.circular(8),),
                        padding: EdgeInsets.all(12),
                        child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                        SvgPicture.asset("${AppUI.iconPath}mapMarker.svg" , color: select==count ? AppUI.mainColor:AppUI.greyColor),
                        SizedBox(width: 10,),
                        Expanded(child: 
                        CustomText(text: "${cubit.getAddressModel?.address?[count].blockName} , ${cubit.getAddressModel?.address?[count].streetName}  ${cubit.getAddressModel?.address?[count].specialMarque} " , color: AppUI.blackColor, fontSize: 12,),),
                        ],),)
                        ),
                        onTap: () async {
                          select = count;
                          print(select);

                         Navigator.pop(context, true); 
                          await cubit.defaultAddress("${cubit.getAddressModel?.address?[count].id}");
                          cubitCheckout.addressId = "${cubit.getAddressModel?.address?[count].id}";
                          CashHelper.setSavedString("address", "${cubit.getAddressModel?.address?[count].apartmentName} , ${cubit.getAddressModel?.address?[count].streetName}");
                         var address =  await CashHelper.getSavedString("address", "");
                         AppUtil.address = address;
                         



                        },
                        );

                      }),
                            ),
                            SizedBox(height: 24,) ,
                            InkWell( child :
                            Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                        SvgPicture.asset("${AppUI.iconPath}mapMarkerPlus.svg"),
                        SizedBox(width: 10,),
                        Expanded(child: 
                        CustomText(text: "Add a new delivery location".tr() , color: AppUI.blackColor, fontSize: 14,fontWeight: FontWeight.w600,),),
                        ],),
                        onTap: () {
                           Navigator.pop(context, true); 
                          AppUtil.mainNavigator(context, AddAddressScreen());
                        },
                        )
                          ],
                        ),
                      ),
                    );
          }
                    )
  
                  ),
                ),
    );
  }
  
}