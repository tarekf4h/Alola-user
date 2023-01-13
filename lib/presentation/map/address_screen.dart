import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';

import '../../shared/components.dart';
import '../../utilities/app_ui.dart';
import '../../utilities/app_util.dart';
import 'add_address_screen.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  var select = -1 ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
                  // backgroundColor: Colors.transparent,
                  appBar:  customAppBar(title: "Addressees".tr() , centerTitle: true , elevation: 0.5),
                  // AppBar(
                  //  backgroundColor: Colors.transparent,
                  //  centerTitle: true,
                  // title: CustomText(text: "Addressees".tr() , color: AppUI.blackColor , fontSize: 20,), 
                  // elevation: 0 ,),
                  // leadingWidth: 50,
                  // leading:InkWell(onTap: () {
                  // Navigator.pop(context, true); 
                  // },
                  // child: Padding(
                  //   padding: const EdgeInsets.all(10.0),
                  //   child: Image.asset("${AppUI.imgPath}closePopup.png",height: 15,width: 15),
                  // )
                  // )),
                  body: Center(
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
                    itemCount: 2,
                    itemBuilder: (context, count) {
                      return InkWell(child: Padding(padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                      child: Container(
                      decoration: BoxDecoration(
                      color: AppUI.whiteColor,
                      border: Border.all(color:select==count ? AppUI.mainColor:AppUI.shimmerColor),
                      borderRadius: BorderRadius.circular(8),),
                      padding: EdgeInsets.all(8),
                      child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                      SvgPicture.asset("${AppUI.iconPath}mapMarker.svg" , color: select==count ? AppUI.mainColor:AppUI.greyColor),
                      SizedBox(width: 10,),
                      Expanded(child: 
                      CustomText(text: "Select your location".tr() , color: AppUI.blackColor, fontSize: 12,),),
                      ],),)
                      ),
                      onTap: () {
                        select = count;
                        print(select);
                        setState(() {
                          
                        });
                      },
                      );

                    }),
                          ),
                          SizedBox(height: 20,) ,
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
                        AppUtil.mainNavigator(context, AddAddressScreen());
                      },
                      )
                        ],
                      ),
                    ),
                  ),
                );
  }
}