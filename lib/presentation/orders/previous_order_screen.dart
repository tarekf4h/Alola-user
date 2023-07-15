import 'package:adelco_user/presentation/orders/products_bottom_sheet.dart';
import 'package:adelco_user/presentation/orders/rating_bottom_sheet.dart';
import 'package:adelco_user/presentation/orders/statuses_screen.dart';
import 'package:adelco_user/presentation/orders/widget/product_order.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/Orders/orders_cubit.dart';
import '../../models/order/orders_model.dart';
import '../../shared/components.dart';
import '../../utilities/app_ui.dart';
import '../../utilities/app_util.dart';
import '../cart/cart_bottom_sheet.dart';

class PreviousOrderScreen extends StatefulWidget {
    final Order? data;

  const PreviousOrderScreen({Key? key, required this.data}) : super(key: key);

  @override
  State<PreviousOrderScreen> createState() => _PreviousOrderScreenState();
}

class _PreviousOrderScreenState extends State<PreviousOrderScreen> {
  @override
  Widget build(BuildContext context) {
      final cubit = OrdersCubit.get(context);
      return BlocBuilder< OrdersCubit, OrdersState>(
          buildWhen : (_,state) => state is ReorderLoadingState || state is ReorderLoadedState || state is ReorderErrorState,
          builder: (context, state) {
           return Scaffold(
      appBar: customAppBar(title: "Orders".tr() , elevation: 0.5 , centerTitle: true),
      body: Padding(padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: ListView(children: [
        SizedBox(height: 10,),
        InkWell(child:CustomAarrowContainer(title: "Tell us your rating to improve the service level".tr(),),onTap: () {
          showModalBottomSheet(
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.only(topLeft: Radius.circular(20) , topRight: Radius.circular(20)),),
            context: context,
            builder: (BuildContext context) {
              return BottomSheet(
                shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.only(topLeft: Radius.circular(20) , topRight: Radius.circular(20)),),
              onClosing: () {},
              builder: (BuildContext context) {
              var type = 0 ;
          return StatefulBuilder(builder: (BuildContext context, StateSetter mystate) {
          return RatingottomSheet(id: widget.data?.orderInfo?.id,);
          });});});
        },),
        
        SizedBox(height: 20,),
        //  CustomText(text: "Order details".tr() , color: AppUI.blackColor, fontSize: 16,fontWeight: FontWeight.w400,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: "Order details".tr()  ,fontSize: 16,fontWeight: FontWeight.w700, color: AppUI.blackColor,),
                  InkWell(onTap: () {
                    AppUtil.mainNavigator(context, StatusesScreen(data: widget.data,));
           
                 },
                 child: CustomText(text: "Show".tr() , fontSize: 14,color: AppUI.mainColor,fontWeight: FontWeight.w700,) ,
                 ),
              ],),
              SizedBox(height: 20,),
            Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppUI.shimmerColor)
            ),
            padding: EdgeInsets.symmetric(horizontal: 15),
            // margin: EdgeInsets.symmetric(horizontal: 15) ,
            child: Column(
              children: [
              SizedBox(height: 10,),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: "Order number".tr() , color: AppUI.greyColor,fontSize: 10,),
                CustomText(text: "${widget.data?.orderInfo?.orderCode}" , color: AppUI.blackColor,fontSize: 10),
              ],
            ),
            SizedBox(height: 10,),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: "Order status".tr() , color: AppUI.greyColor,fontSize: 10),
                Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(8) , color: AppUI.activeColor.withAlpha(800)),padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),child: Center(child: CustomText(text: "${widget.data?.orderInfo?.status}" , color: AppUI.activeColor,fontSize: 10)))
              ],
            ),
            SizedBox(height: 10,),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: "Delivery location".tr() , color: AppUI.greyColor,fontSize: 10),
                CustomText(text: "${widget.data?.orderInfo?.address?.blockName} , ${widget.data?.orderInfo?.address?.streetName} ${widget.data?.orderInfo?.address?.specialMarque}" , color: AppUI.blackColor,fontSize: 10),
              ],
            ),
            SizedBox(height: 10,),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: "Number of products".tr() , color: AppUI.greyColor,fontSize: 10),
                CustomText(text: "${widget.data?.orderInfo?.quantity}" , color: AppUI.blackColor,fontSize: 10),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: "Total".tr() , color: AppUI.greyColor,fontSize: 10),
                CustomText(text: "${widget.data?.orderInfo?.total} ${"SR".tr()}" , color: AppUI.blackColor,fontSize: 10),
              ],
            ),
            SizedBox(height: 10,),
            
            ],),),
            Padding(
             padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
             child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: "Products".tr() ,fontSize: 16,fontWeight: FontWeight.w700, color: AppUI.blackColor,),
                  InkWell(onTap: () {
           showModalBottomSheet(
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.only(topLeft: Radius.circular(20) , topRight: Radius.circular(20)),),
            context: context,
            builder: (BuildContext context) {
              return BottomSheet(
                shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.only(topLeft: Radius.circular(20) , topRight: Radius.circular(20)),),
              onClosing: () {},
              builder: (BuildContext context) {
              var type = 0 ;
          return StatefulBuilder(builder: (BuildContext context, StateSetter mystate) {
          return ProductsBottomSheet(data: widget.data,);
          });});});
                 },
                 child: CustomText(text: "Show".tr() , fontSize: 14,color: AppUI.mainColor,fontWeight: FontWeight.w700,) ,
                 ),
              ],),
           ),
              Container(
                    height:160,
                child: GridView.builder(
                 shrinkWrap : false,
                    primary: false,
                    itemCount: widget.data?.orderDetails?.length ?? 0,
                    scrollDirection:Axis.horizontal,
                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                 crossAxisCount: 1,
                 crossAxisSpacing : 5 ,
                 mainAxisSpacing: 10 ,
                 childAspectRatio  : 1/0.9,
                 
           ),
          itemBuilder: (BuildContext context, int index) { 
            return  ProductOrder(data: widget.data?.orderDetails?[index],);
            },
            ),
            ),
            SizedBox(height: 20,),
            CustomText(text: "Bill Summary".tr() , color: AppUI.blackColor, fontSize: 16,fontWeight: FontWeight.w400,),
            SizedBox(height: 20,),
            Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppUI.shimmerColor)
            ),
            padding: EdgeInsets.symmetric(horizontal: 15),
            // margin: EdgeInsets.symmetric(horizontal: 15) ,
            child: Column(
              children: [
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
                    ]),
            SizedBox(height: 10,),


              ])),
              SizedBox(height: 10,),
           state is ReorderLoadingState ? LoadingWidget() : Center(child: CustomButton(text: "Re-order".tr() , radius: 15,onPressed: () async {
          await cubit.reorder("${widget.data?.orderInfo?.id}", "${widget.data?.orderInfo?.address?.id}", "${widget.data?.orderInfo?.deliveryDuration}", "${widget.data?.orderInfo?.deliveryNotes}", "${widget.data?.orderInfo?.discountCode}");
                if (cubit.reorderModel?.status == true){
                  AppUtil.successToast(context, cubit.reorderModel?.message);
                  cubit.getOrders();
                  Navigator.pop(context, true);  
                }else{
                  AppUtil.errorToast(context, cubit.reorderModel?.message);
                }
        },),),
            SizedBox(height: 10,),



      ],),
      ),
    );
          }
      );
    
  }
}