import 'package:adelco_user/shared/components.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../bloc/Cart/cart_cubit.dart';
import '../../utilities/app_ui.dart';
import '../../utilities/app_util.dart';
import 'order_confirmation_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool open = false;
  bool firstTime = true;
  final items = List<String>.generate(20, (i) => 'Item ${i + 1}');
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final cubit = CartCubit.get(context);
    if (AppUtil.isLogin){
    cubit.getCart();
    }
  }
  @override
  Widget build(BuildContext context) {
      final cubit = CartCubit.get(context);
    return BlocBuilder< CartCubit, CartState>(
          buildWhen : (_,state) => state is  RemoveCartLoadingState || state is RemoveCartLoadedState || state is RemoveCartErrorState ||
           state is UpdateCartLoadingState || state is UpdateCartLoadedState || state is UpdateCartErrorState ||
           state is GetCartLoadingState || state is GetCartLoadedState || state is GetCartErrorState ,

          builder: (context, state) {
          return  Stack(
            children: [
              Scaffold(
      appBar: customAppBar(title: "Cart".tr() , centerTitle: true),
      body:BlocBuilder< CartCubit, CartState>(
              buildWhen : (_,state) => state is  RemoveCartLoadingState || state is RemoveCartLoadedState || state is RemoveCartErrorState ||
               state is UpdateCartLoadingState || state is UpdateCartLoadedState || state is UpdateCartErrorState ||
               state is GetCartLoadingState || state is GetCartLoadedState || state is GetCartErrorState ,

              builder: (context, state) {
                // if(state is GetCartLoadingState && firstTime){
                //   return const LoadingWidget();
                // }
                if(state is  GetCartErrorState){
                  return const ErrorFetchWidget();
                }
              return Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: (AppUtil.isLogin || (cubit.cartModel?.data?.cartDetails?.length ?? 0) > 0) ? ListView.separated(
                        separatorBuilder: (context, index) {
                          return  Divider(
                            color: AppUI.shimmerColor.withOpacity(0),
                            thickness: 0,
                          );
                        },
                        scrollDirection: Axis.vertical,
                        itemCount: cubit.cartModel?.data?.cartDetails?.length ?? 0,
                        itemBuilder: (context, count) {
                          final item = cubit.cartModel?.data?.cartDetails?[count].cartId;
                          return  Dismissible(
                            direction: DismissDirection.startToEnd,
                  key: UniqueKey(),
                  // Key("$item"),
                  onDismissed: (direction) {
                      
                    setState(() async {
                      var id =  cubit.cartModel?.data?.cartDetails?[count].product?.id ?? 0;
                       cubit.cartModel?.data?.cartDetails?.removeAt(count);
                    await  cubit.removeCart("${id}");
                      firstTime = false;
                      cubit.getCart();
                    });

                    // Then show a snackbar.
                    // ScaffoldMessenger.of(context)
                    //     .showSnackBar(SnackBar(content: Text('$item dismissed')));
                  },
                  // Show a red background as the item is swiped away.
                  background: Container(color: Colors.red ,child: Row(children: [SizedBox(width: 5,),SvgPicture.asset("${AppUI.iconPath}trash.svg" , color: AppUI.whiteColor,),SizedBox(width: 10,) ,CustomText(text: "Delete".tr(),color: AppUI.whiteColor,),SizedBox(width: 10,)],),),
                  child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: Container(
                              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12) , border:Border.all(color: AppUI.shimmerColor) ),
                              child: Padding(padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                              child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SetImage(width: 80, height: 80, img: cubit.cartModel?.data?.cartDetails?[count].product?.image, borderRadius: 0),
                                  SizedBox(width: 10,),
                                  Expanded(child: 
                                  
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                        CustomText(text: "${cubit.cartModel?.data?.cartDetails?[count].product?.productTitle}" , color:  AppUI.blackColor,),
                                        SizedBox(height: 8,),
                                        CustomText(text: "${cubit.cartModel?.data?.cartDetails?[count].product?.weight} ${cubit.cartModel?.data?.cartDetails?[count].product?.productUnit}"   , color: AppUI.greyColor,),
                                        SizedBox(height: 8,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                
                                               CustomText(text: "${cubit.cartModel?.data?.cartDetails?[count].product?.discountPrice ?? cubit.cartModel?.data?.cartDetails?[count].product?.price} ${"SR".tr()}" , color:  AppUI.blackColor,),
                                               SizedBox(width: 5,),
                                                Expanded(flex: 0,child: Container(
                                                  padding: EdgeInsets.only(right: 10,left: 10),
                                                  height: 50,
                                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12) ,),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [SizedBox(width: 5,),
                                                   InkWell(child: Container(decoration: BoxDecoration(color: AppUI.secondColor,borderRadius: BorderRadius.all(Radius.circular(4))),padding: EdgeInsets.symmetric(vertical: 4 , horizontal: 4),child: SvgPicture.asset("${AppUI.iconPath}plus.svg")),onTap: () async {
                                                    await cubit.updateCart( cubit.cartModel?.data?.cartDetails?[count].product?.id ?? 0 , (cubit.cartModel?.data?.cartDetails?[count].quantity ?? 0 ) + 1);
                                                    if(cubit.updateCartModel?.status == true){
                                                      firstTime = false;
                                                    cubit.getCart();
                                                    }
                                                   },),
                                                    SizedBox(width: 10,) ,
                                                    CustomText(text: "${cubit.cartModel?.data?.cartDetails?[count].quantity}",color: AppUI.blackColor,),SizedBox(width: 10,), 
                                                   InkWell(child:Container(decoration: BoxDecoration(color: AppUI.secondColor,borderRadius: BorderRadius.all(Radius.circular(4))),padding: EdgeInsets.symmetric(horizontal: 4,vertical: 4),child: SvgPicture.asset("${AppUI.iconPath}minus.svg" , color: cubit.cartModel?.data?.cartDetails?[count].quantity == 1 ? AppUI.mainColor.withAlpha(100):AppUI.mainColor ,)),onTap: () async {
                                                     if((cubit.cartModel?.data?.cartDetails?[count].quantity ?? 0 )> 1){
                                                    await cubit.updateCart( cubit.cartModel?.data?.cartDetails?[count].product?.id ?? 0 , (cubit.cartModel?.data?.cartDetails?[count].quantity ?? 0 ) - 1);
                                                    if(cubit.updateCartModel?.status == true){
                                                    firstTime = false;
                                                    cubit.getCart();
                                                    }
                                                     }
                                                   },),],
                                                  ),
                                                )),

                                              ],

                                             )
                                        
                                      ],),
                                    ),
                                 

                              ]),),
                            ),
                          ));

                        })  : Center(child: CustomText(text: "The cart is empty".tr() , fontWeight: FontWeight.bold,fontSize: 18,),),
      );
              }
      ),
      bottomNavigationBar: AppUtil.isLogin ? (cubit.cartModel?.data?.cartDetails?.length ?? 0) > 0 ? BlocBuilder< CartCubit, CartState>(
              buildWhen : (_,state) => state is  RemoveCartLoadingState || state is RemoveCartLoadedState || state is RemoveCartErrorState ||
               state is UpdateCartLoadingState || state is UpdateCartLoadedState || state is UpdateCartErrorState ||
               state is GetCartLoadingState || state is GetCartLoadedState || state is GetCartErrorState ,

              builder: (context, state) {
               return  Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12) , border:Border.all(color: AppUI.shimmerColor ,width: 0.5) ),
        height: open ? 230:140,
        width: AppUtil.responsiveWidth(context),
        child: Padding(padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Column(
              children: [
               InkWell(child: Center(child:open ? SvgPicture.asset("${AppUI.iconPath}arrowDown.svg"):SvgPicture.asset("${AppUI.iconPath}arrowTop.svg") ),onTap: () {
                 this.open = !open;
                 setState(() {
                   
                 });
               },),
               
               if (open) ...[
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(text: "${cubit.cartModel?.data?.cartInfo?.quantity} ${"Product".tr()}" , color: AppUI.blackColor,),
                    CustomText(text: "${cubit.cartModel?.data?.cartInfo?.subtotal} ${"SR".tr()}" , color: AppUI.blackColor),
                  ],
                ),
                SizedBox(height: 10,),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(text: "Delivery".tr() , color: AppUI.blackColor,),
                    CustomText(text: "${cubit.cartModel?.data?.cartInfo?.shippingPrice} ${"SR".tr()}"  , color: AppUI.blackColor),
                  ],
                ),
                SizedBox(height: 10,),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(text: "Tax".tr() , color: AppUI.blackColor,),
                    CustomText(text: "${cubit.cartModel?.data?.cartInfo?.vat} ${"SR".tr()}" , color: AppUI.blackColor),
                  ],
                ),

               ],
               SizedBox(height: 10,),
               Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(text: "Total".tr() , color: AppUI.blackColor,fontSize: 16,fontWeight: FontWeight.w600,),
                    CustomText(text: "${cubit.cartModel?.data?.cartInfo?.total} ${"SR".tr()}" , color: AppUI.blackColor,fontSize: 16,fontWeight: FontWeight.w600,),
                  ],
                ),
                SizedBox(height: 10,),
                CustomButton(text: "Order execution".tr() , radius: 36, height: 17,onPressed: () {
                  AppUtil.mainNavigator(context, OrderConfirmationScreen());
                },)
        ],),
        )
        );
              }) : null : null
              
      ),
      if(state is UpdateCartLoadingState || state is GetCartLoadingState || state is RemoveCartLoadedState)
      Container(color: AppUI.whiteColor.withAlpha(0),height: AppUtil.responsiveHeight(context) , width: AppUtil.responsiveWidth(context),child: LoadingWidget())
            ],
          );
  }
    );
    }
}