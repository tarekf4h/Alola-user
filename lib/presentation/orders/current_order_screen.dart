import 'package:adelco_user/presentation/orders/chat_screen.dart';
import 'package:adelco_user/presentation/orders/products_bottom_sheet.dart';
import 'package:adelco_user/presentation/orders/statuses_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';

import '../../shared/components.dart';
import '../../utilities/app_ui.dart';
import '../../utilities/app_util.dart';

class CurrentOrderScreen extends StatefulWidget {
  const CurrentOrderScreen({Key? key}) : super(key: key);

  @override
  State<CurrentOrderScreen> createState() => _CurrentOrderScreenState();
}

class _CurrentOrderScreenState extends State<CurrentOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "Orders".tr(), elevation: 0.5, centerTitle: true),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: "Products".tr(),
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppUI.blackColor,
                  ),
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                          isScrollControlled: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)),
                          ),
                          context: context,
                          builder: (BuildContext context) {
                            return BottomSheet(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20)),
                                ),
                                onClosing: () {},
                                builder: (BuildContext context) {
                                  var type = 0;
                                  return StatefulBuilder(builder:
                                      (BuildContext context,
                                          StateSetter mystate) {
                                    return ProductsBottomSheet();
                                  });
                                });
                          });
                    },
                    child: CustomText(
                      text: "Show".tr(),
                      fontSize: 14,
                      color: AppUI.mainColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 138,
              child: GridView.builder(
                shrinkWrap: false,
                primary: false,
                itemCount: 20,
                scrollDirection: Axis.horizontal,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1 / 0.7,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: 96,
                    height: 138,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppUI.whiteColor,
                        border: Border.all(color: AppUI.shimmerColor)),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Image.asset("${AppUI.imgPath}milk.png",
                            height: 70, width: 70),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            // margin: EdgeInsets.all(5.0),
                            child: Center(
                                child: CustomText(
                              text: "1",
                              color: AppUI.whiteColor,
                            )),
                            decoration: BoxDecoration(
                                color: AppUI.mainColor,
                                shape: BoxShape.circle)),
                        CustomText(
                          text: "Text",
                          color: AppUI.blackColor,
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: "Order status".tr(),
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppUI.blackColor,
                  ),
                  InkWell(
                    onTap: () {
                      AppUtil.mainNavigator(context, StatusesScreen());
                    },
                    child: CustomText(
                      text: "Show".tr(),
                      fontSize: 14,
                      color: AppUI.mainColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppUI.shimmerColor)),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 16,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppUI.activeColor.withAlpha(600),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Container(
                        height: 16,
                        width: MediaQuery.of(context).size.width * 0.25,
                        decoration: BoxDecoration(
                          color: AppUI.activeColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: "Estimated time of arrival".tr(),
                        fontSize: 12,
                        color: AppUI.blackColor,
                      ),
                      CustomText(
                        text: "text",
                        fontSize: 12,
                        color: AppUI.darkActiveColor,
                        fontWeight: FontWeight.w600,
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: "Order details".tr(),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppUI.blackColor,
                ),
                // InkWell(
                //   onTap: () {
                //     showModalBottomSheet(
                //         isScrollControlled: true,
                //         shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.only(
                //               topLeft: Radius.circular(20),
                //               topRight: Radius.circular(20)),
                //         ),
                //         context: context,
                //         builder: (BuildContext context) {
                //           return BottomSheet(
                //               shape: RoundedRectangleBorder(
                //                 borderRadius: BorderRadius.only(
                //                     topLeft: Radius.circular(20),
                //                     topRight: Radius.circular(20)),
                //               ),
                //               onClosing: () {},
                //               builder: (BuildContext context) {
                //                 var type = 0;
                //                 return StatefulBuilder(builder:
                //                     (BuildContext context,
                //                         StateSetter mystate) {
                //                   return ProductsBottomSheet();
                //                 });
                //               });
                //         });
                //   },
                //   child: CustomText(
                //     text: "Show".tr(),
                //     fontSize: 14,
                //     color: AppUI.mainColor,
                //     fontWeight: FontWeight.w700,
                //   ),
                // ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppUI.shimmerColor)),
              padding: EdgeInsets.symmetric(horizontal: 16 , vertical: 16),
              // margin: EdgeInsets.symmetric(horizontal: 15) ,
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: "Order number".tr(),
                        color: AppUI.greyColor,
                        fontSize: 12,
                        padding:
                              EdgeInsets.symmetric( vertical: 5)
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      CustomText(
                        text: "Order status".tr(),
                        color: AppUI.greyColor,
                        fontSize: 12,
                        padding:
                              EdgeInsets.symmetric( vertical: 5)
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      CustomText(
                        text: "Delivery location".tr(),
                        color: AppUI.greyColor,
                        fontSize: 12,
                        padding:
                              EdgeInsets.symmetric( vertical: 5)
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      CustomText(
                        text: "Delegate name".tr(),
                        color: AppUI.greyColor,
                        fontSize: 12,
                        padding:
                              EdgeInsets.symmetric( vertical: 5)
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      CustomText(
                        text: "Phone".tr(),
                        color: AppUI.greyColor,
                        fontSize: 12,
                        padding:
                              EdgeInsets.symmetric( vertical: 5)
                      ),
                      SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 4,
                      ),
                      CustomText(
                        text: "Text",
                        color: AppUI.blackColor,
                        fontSize: 14,
                        padding:
                              EdgeInsets.symmetric( vertical: 5)
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: AppUI.mainColor.withAlpha(800)),
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: Center(
                              child: CustomText(
                                  text: "Text",
                                  color: AppUI.mainColor,
                                  fontSize: 14))),
                      SizedBox(
                        height: 8,
                      ),
                      CustomText(
                        text: "Text",
                        color: AppUI.blackColor,
                        fontSize: 14,
                        padding:
                              EdgeInsets.symmetric( vertical: 5)
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      CustomText(
                        text: "Text",
                        color: AppUI.blackColor,
                        fontSize: 14,
                        padding:
                              EdgeInsets.symmetric( vertical: 5)
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(children: [
                        CustomText(
                        text: "Text",
                        color: AppUI.blackColor,
                        fontSize: 14,
                        padding:
                              EdgeInsets.symmetric( vertical: 5)
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      InkWell(child:
                      Container( 
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8) , color: AppUI.mainColor.withAlpha(800)),
                        padding: EdgeInsets.symmetric( vertical: 5 , horizontal: 5),
                        child: SvgPicture.asset("${AppUI.iconPath}phone.svg"),
                      ),
                      onTap: () {
                        
                      },
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      InkWell(child:
                      Container( 
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8) , color: AppUI.mainColor.withAlpha(800)),
                        padding: EdgeInsets.symmetric( vertical: 5 , horizontal: 5),
                        child: SvgPicture.asset("${AppUI.iconPath}comment.svg"),
                      ),
                      onTap: () {
                        AppUtil.mainNavigator(context, ChatScreen());
                      },
                      )

                      ],)
                    ],
                  )
                ],
              ),

            ),
            SizedBox(
              height: 20,
            ),
            CustomText(
              text: "Bill Summary".tr(),
              color: AppUI.blackColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppUI.shimmerColor)),
                padding: EdgeInsets.symmetric(horizontal: 15),
                // margin: EdgeInsets.symmetric(horizontal: 15) ,
                child: Column(children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: "text",
                        color: AppUI.blackColor,
                      ),
                      CustomText(text: "text", color: AppUI.blackColor),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: "Delivery".tr(),
                        color: AppUI.blackColor,
                      ),
                      CustomText(text: "text", color: AppUI.blackColor),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: "Tax".tr(),
                        color: AppUI.blackColor,
                      ),
                      CustomText(text: "text", color: AppUI.blackColor),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: "Promo code".tr(),
                        color: AppUI.blackColor,
                      ),
                      CustomText(text: "text", color: AppUI.errorColor),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: "Total".tr(),
                        color: AppUI.blackColor,
                        fontSize: 16,
                      ),
                      CustomText(
                          text: "text", color: AppUI.blackColor, fontSize: 16),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ])),
            SizedBox(
              height: 10,
            ),
            CustomButton(
              text: "Order cancellation".tr(),
              color: AppUI.errorColor.withAlpha(600),
              textColor: AppUI.errorColor,
              radius: 20,
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
