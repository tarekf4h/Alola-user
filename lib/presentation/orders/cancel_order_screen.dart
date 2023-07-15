import 'package:adelco_user/presentation/orders/products_bottom_sheet.dart';
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

class CancelOrderScreen extends StatefulWidget {
  final Order? data;
  const CancelOrderScreen({Key? key, required this.data}) : super(key: key);

  @override
  State<CancelOrderScreen> createState() => _CancelOrderScreenState();
}

class _CancelOrderScreenState extends State<CancelOrderScreen> {
  @override
  Widget build(BuildContext context) {
            final cubit = OrdersCubit.get(context);
      return BlocBuilder< OrdersCubit, OrdersState>(
          buildWhen : (_,state) => state is ReorderLoadingState || state is ReorderLoadedState || state is ReorderErrorState,
          builder: (context, state) {
           return Scaffold(
        appBar: customAppBar(title: "Orders".tr() , elevation: 0.5 , centerTitle: true),
        body: ListView(
          children: [
             SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomText(text: "Order details".tr() , color: AppUI.blackColor, fontSize: 16,fontWeight: FontWeight.w400,),
              ),
              SizedBox(height: 20,),
            Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppUI.shimmerColor)
            ),
            padding: EdgeInsets.symmetric(horizontal: 15),
            margin: EdgeInsets.symmetric(horizontal: 15) ,
            child: Column(
              children: [
              SizedBox(height: 10,),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: "Order number".tr() , color: AppUI.greyColor,),
                CustomText(text: "${widget.data?.orderInfo?.orderCode}" , color: AppUI.blackColor),
              ],
            ),
            SizedBox(height: 10,),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: "Order status".tr() , color: AppUI.greyColor,),
                Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(8) , color: AppUI.errorColor.withAlpha(800)),padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),child: Center(child: CustomText(text: "${widget.data?.orderInfo?.status}" , color: AppUI.errorColor,)))
              ],
            ),
            SizedBox(height: 10,),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomText(text: "Delivery location".tr() , color: AppUI.greyColor,),
                // Spacer(),
                SizedBox(width: 20,),
                         Expanded(
  child:   CustomText(maxLines: 1,overflow: TextOverflow.ellipsis,text: "${widget.data?.orderInfo?.address?.blockName} , ${widget.data?.orderInfo?.address?.streetName} ${widget.data?.orderInfo?.address?.specialMarque}" , color: AppUI.blackColor),)
              ],
            ),
            SizedBox(height: 10,),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: "Number of products".tr() , color: AppUI.greyColor,),
                CustomText(text: "${widget.data?.orderInfo?.quantity}" , color: AppUI.blackColor),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: "Total".tr() , color: AppUI.greyColor,),
                CustomText(text: "${widget.data?.orderInfo?.total} ${"SR".tr()}" , color: AppUI.blackColor),
              ],
            ),
            SizedBox(height: 10,),
            
            ],),),
            Padding(
             padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
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
            return ProductOrder(data: widget.data?.orderDetails?[index],) ;
            },
            ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
        decoration: BoxDecoration( border:Border.all(color: AppUI.shimmerColor ,width: 0.5) ),
        height: 70,
        width: AppUtil.responsiveWidth(context),
        child: Padding(padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: state is ReorderLoadingState ? LoadingWidget() : Center(child: CustomButton(text: "Re-order".tr() , radius: 15,onPressed: () async {
          await cubit.reorder("${widget.data?.orderInfo?.id}", "${widget.data?.orderInfo?.address?.id}", "${widget.data?.orderInfo?.deliveryDuration}", "${widget.data?.orderInfo?.deliveryNotes}", "${widget.data?.orderInfo?.discountCode}");
                if (cubit.reorderModel?.status == true){
                  AppUtil.successToast(context, cubit.reorderModel?.message);
                  cubit.getOrders();
                  Navigator.pop(context, true);  
                }else{
                  AppUtil.errorToast(context, cubit.reorderModel?.message);
                }
        },),)
        )
        ) ,
        );
          }
      );
    
  }
}