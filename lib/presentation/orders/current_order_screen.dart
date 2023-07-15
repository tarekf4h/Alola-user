import 'package:adelco_user/presentation/orders/chat_screen.dart';
import 'package:adelco_user/presentation/orders/products_bottom_sheet.dart';
import 'package:adelco_user/presentation/orders/statuses_screen.dart';
import 'package:adelco_user/presentation/orders/widget/product_order.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../bloc/Orders/orders_cubit.dart';
import '../../models/order/orders_model.dart';
import '../../shared/components.dart';
import '../../utilities/app_ui.dart';
import '../../utilities/app_util.dart';

class CurrentOrderScreen extends StatefulWidget {
  final Order? data;
  const CurrentOrderScreen({Key? key , required this.data}) : super(key: key);

  @override
  State<CurrentOrderScreen> createState() => _CurrentOrderScreenState();
}

class _CurrentOrderScreenState extends State<CurrentOrderScreen> {
  @override
  Widget build(BuildContext context) {
        final cubit = OrdersCubit.get(context);
    return Scaffold(
      appBar: customAppBar(title: "Orders".tr(), elevation: 0.5, centerTitle: true),
      body: BlocBuilder< OrdersCubit, OrdersState>(
          buildWhen : (_,state) => state is CancelLoadingState || state is CancelLoadedState || state is CancelErrorState,
          builder: (context, state) {
           return Padding(
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
                                    return ProductsBottomSheet(data: widget.data,);
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
                itemCount: widget.data?.orderDetails?.length ?? 0,
                scrollDirection: Axis.horizontal,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1 / 0.9,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return ProductOrder(data: widget.data?.orderDetails?[index],);
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
                      AppUtil.mainNavigator(context, StatusesScreen(data: widget.data,));
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
                        text: "${widget.data?.orderInfo?.expectedDeliveryInMinutes}",
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
              Expanded(
  child:    Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 4,
                      ),
                      CustomText(
                        text: "${widget.data?.orderInfo?.orderCode}",
                        color: AppUI.blackColor,
                        fontSize: 14,
                        padding:
                              EdgeInsets.symmetric( vertical: 5)
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          SizedBox(width: 0,),
                          Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: AppUI.mainColor.withAlpha(800)),
                              padding:
                                  EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                              child: Center(
                                  child: CustomText(
                                      text: "${widget.data?.orderInfo?.status}",
                                      color: AppUI.mainColor,
                                      fontSize: 14))),
                                      SizedBox(width: 0,),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
   CustomText(
                        text: "${widget.data?.orderInfo?.address?.blockName} , ${widget.data?.orderInfo?.address?.streetName} ${widget.data?.orderInfo?.address?.specialMarque}",
                        color: AppUI.blackColor,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        fontSize: 14,
                        // padding:
                        //       EdgeInsets.symmetric( vertical: 5)
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
                        text: "${widget.data?.orderInfo?.quantity} ${"Product".tr()}",
                        color: AppUI.blackColor,
                      ),
                      CustomText(text: "${widget.data?.orderInfo?.subtotal } ${"SR".tr()}", color: AppUI.blackColor),
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
                      CustomText(text: "${widget.data?.orderInfo?.shippingPrice } ${"SR".tr()}", color: AppUI.blackColor),
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
                      CustomText(text: "${widget.data?.orderInfo?.vat } ${"SR".tr()}", color: AppUI.blackColor),
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
                      CustomText(text: "${widget.data?.orderInfo?.discount } ${"SR".tr()}", color: AppUI.errorColor),
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
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      CustomText(
                          text: "${widget.data?.orderInfo?.total } ${"SR".tr()}", color: AppUI.blackColor,fontWeight: FontWeight.bold, fontSize: 16),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ])),
            SizedBox(
              height: 10,
            ),
            state is CancelLoadingState ?  LoadingWidget() :
            CustomButton(
              text: "Order cancellation".tr(),
              color: AppUI.errorColor.withAlpha(600),
              textColor: AppUI.errorColor,
              radius: 20,
              onPressed: () async {
                await cubit.cancel("${widget.data?.orderInfo?.id}");
                if (cubit.cancelModel?.status == true){
                  AppUtil.successToast(context, cubit.cancelModel?.message);
                  cubit.getOrders();
                  Navigator.pop(context, true);  
                }else{
                  AppUtil.errorToast(context, cubit.cancelModel?.message);
                }
              },
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      );
          }
      )
    );
  }
}
