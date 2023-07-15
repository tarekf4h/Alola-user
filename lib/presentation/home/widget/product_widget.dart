import 'package:adelco_user/presentation/auth/login_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../bloc/Cart/cart_cubit.dart';
import '../../../bloc/product/product_cubit.dart';
import '../../../models/product/home_model.dart';
import '../../../shared/components.dart';
import '../../../utilities/app_ui.dart';
import '../../../utilities/app_util.dart';

class ProductWidget extends StatefulWidget {
  final Product? data;
  final int? index;
  final String? type;
  const ProductWidget({super.key , required this.data ,required this.index , this.type });

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
        final cubit = CartCubit.get(context);
        final cubitProduct = ProductCubit.get(context);

    return BlocBuilder< CartCubit, CartState>(
          buildWhen : (_,state) => state is  RemoveCartLoadingState || state is RemoveCartLoadedState || state is RemoveCartErrorState ||
           state is UpdateCartLoadingState || state is UpdateCartLoadedState || state is UpdateCartErrorState ,
          builder: (context, state) {
          return Container(
                        margin:EdgeInsets.all(8),
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        width: 100,
                        // height: 180,
                        decoration: BoxDecoration(
                        color: AppUI.whiteColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                        BoxShadow(
                        color: Colors.grey.withAlpha(100),
                        blurRadius: 0.5, 
                        spreadRadius: 0.5, 
                        offset: Offset(  0.5,  0.5,),) ],),
                        child: Stack(children: [
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           
                           child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10,),
                              Center(child: SetImage(width: 80, height: 80, img: widget.data?.image, borderRadius: 0)),
                              SizedBox(height: 10,),
                              CustomText(text: widget.data?.productTitle,color: AppUI.blackColor,),
                              SizedBox(height: 5,),
                              CustomText(text: "${widget.data?.weight} ${widget.data?.productUnit}",color: AppUI.blackColor,fontSize: 12,),
                              SizedBox(height: 5,),
                              Row(children: [
                                CustomText(text: "${widget.data?.discountPrice == null ? widget.data?.price : widget.data?.discountPrice} ${"SR".tr()}",color: AppUI.blackColor,fontWeight: FontWeight.w600, fontSize: 12),
                                if(widget.data?.discountPrice != null)...[
                                SizedBox(width: 5,),
                                CustomText(text: "${widget.data?.price} ${"SR".tr()}" ,color: AppUI.greyColor, textDecoration: TextDecoration.lineThrough , fontSize: 12,)
                                ]
                              ],),
                            SizedBox(height: 5,),
                            if((widget.data?.cartQuantity ?? 0) > 0)...[
                              // if(state is RemoveCartLoadingState || state is UpdateCartLoadingState)...[
                              //   SizedBox(height: 30,width: 30, child: LoadingWidget() ,)
                              // ]else...[
                              Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(width: 5,),
                                  InkWell(child: Container(decoration: BoxDecoration(color: AppUI.secondColor,borderRadius: BorderRadius.all(Radius.circular(4))),padding: EdgeInsets.symmetric(vertical: 4 , horizontal: 4),child: SvgPicture.asset("${AppUI.iconPath}plus.svg")),
                                  onTap: () async {
                                   await cubit.updateCart( widget.data?.id ?? 0 , (widget.data?.cartQuantity ?? 0 ) + 1);
                                   if(cubit.updateCartModel?.status == true){
                                  //  await cubitProduct.home();
                                  if(widget.type == "mostPopularProductsList"){
                                    cubitProduct.homeModel?.data?.mostPopularProductsList?[widget.index ?? 0].cartQuantity = (widget.data?.cartQuantity ?? 0 ) + 1;

                                  }else if(widget.type == "bestOffersList"){
                                    cubitProduct.homeModel?.data?.bestOffersList?[widget.index ?? 0].cartQuantity = (widget.data?.cartQuantity ?? 0 ) + 1;
                                  }else{
                                    cubitProduct.productsModel?.product?[widget.index ?? 0].cartQuantity = (widget.data?.cartQuantity ?? 0 ) + 1;
                                  }
                                   setState(() {
                                     
                                   });
                                   }
                                  },
                                  ),
                                  SizedBox(width: 10,) ,
                                  CustomText(text: "${widget.data?.cartQuantity}",color: AppUI.blackColor,),
                                  SizedBox(width: 10,), 
                                 InkWell(child: Container(decoration: BoxDecoration(color: AppUI.secondColor,borderRadius: BorderRadius.all(Radius.circular(4))),padding: EdgeInsets.symmetric(horizontal: 4,vertical: 4),child: widget.data?.cartQuantity == 1 ? SvgPicture.asset("${AppUI.iconPath}trash.svg"):SvgPicture.asset("${AppUI.iconPath}minus.svg")),
                                 onTap: () async {
                                  if (widget.data?.cartQuantity == 1){
                                  await cubit.removeCart( "${widget.data?.id ?? 0}" );
                                  cubit.getCart();
                                  if(cubit.removeCartModel?.status == true){
                                  //  await cubitProduct.home();
                                  if(widget.type == "mostPopularProductsList"){
                                    cubitProduct.homeModel?.data?.mostPopularProductsList?[widget.index ?? 0].cartQuantity = null;

                                  }else if(widget.type == "bestOffersList"){
                                    cubitProduct.homeModel?.data?.bestOffersList?[widget.index ?? 0].cartQuantity = null;

                                  }else{
                                   cubitProduct.productsModel?.product?[widget.index ?? 0].cartQuantity = null;
                                  }
                                  
                                   setState(() {
                                     
                                   });
                                   }
                                  }else{
                                   await cubit.updateCart( widget.data?.id ?? 0 , (widget.data?.cartQuantity ?? 0 ) - 1);
                                   cubit.getCart();
                                   if(cubit.updateCartModel?.status == true){
                                  //  await cubitProduct.home();
                                  if(widget.type == "mostPopularProductsList"){
                                    cubitProduct.homeModel?.data?.mostPopularProductsList?[widget.index ?? 0].cartQuantity = (widget.data?.cartQuantity ?? 0 ) - 1;

                                  }else if(widget.type == "bestOffersList"){
                                    cubitProduct.homeModel?.data?.bestOffersList?[widget.index ?? 0].cartQuantity = (widget.data?.cartQuantity ?? 0 ) - 1;
                                  }else{
                                    cubitProduct.productsModel?.product?[widget.index ?? 0].cartQuantity = (widget.data?.cartQuantity ?? 0 ) - 1;
                                  }
                                   setState(() {
                                     
                                   });
                                   }
                                  }
                                 },
                                 ),
                                  SizedBox(width: 5,),
                                  ],
                                
                                )
                              // ]
                           
                            ]else...[
                              // if(state is UpdateCartLoadingState)...[
                              // ]else...[
                              CustomButton(text: "Add".tr(),fontSize: 12,onPressed: () async {
                                if (AppUtil.isLogin){
                                  await cubit.updateCart( widget.data?.id ?? 0 ,  1);
                                  cubit.getCart();
                                   if(cubit.updateCartModel?.status == true){
                                  //  await cubitProduct.home();
                                  if(widget.type == "mostPopularProductsList"){
                                    cubitProduct.homeModel?.data?.mostPopularProductsList?[widget.index ?? 0].cartQuantity =  1;

                                  }else if(widget.type == "bestOffersList"){
                                    cubitProduct.homeModel?.data?.bestOffersList?[widget.index ?? 0].cartQuantity =  1;

                                  }else{
                                    cubitProduct.productsModel?.product?[widget.index ?? 0].cartQuantity =  1;

                                  }
                                   setState(() {
                                     
                                   });
                                   }
                                }else{
                                  AppUtil.dialog2(context, "Please login to continue".tr(), [
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                 InkWell(child:  Center(child: CustomText(text: "Login".tr(), fontWeight: FontWeight.bold,)),onTap: () {
                                  Navigator.of(context).pop();
                                   AppUtil.mainNavigator(context, LoginScreen());
                                 },),
                                    Spacer(),    
                                   InkWell(child:  Center(child: CustomText(text: "cancel".tr() , color: AppUI.errorColor, fontWeight: FontWeight.bold)),onTap: () {
                                     Navigator.of(context).pop();
                                   },)
                                                              ],
                                                               ),
                                ),

                                    ]);

                                }
                            
                            },) 
                            // ]
                            ]
                             

                            ],
                        ),
                         ),
                         if(widget.data?.discountPrice != null)...[
                            Container(margin: EdgeInsets.only(top: 10 , right: 0), height: 20 , width: 80,
                             child: Row(
                              children: [
                              SizedBox(width: 5,),
                              Image.asset("${AppUI.imgPath}Mask Group 461.png",height: 10,width: 10),
                              SizedBox(width: 5,),
                              CustomText(text: "Save ${widget.data?.percentDiscount} %".tr(), fontSize: 10,color: AppUI.errorColor,),
                              SizedBox(width: 5,)
                             ],),
                             decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(topRight: Radius.circular(5) , bottomRight:Radius.circular(5) ),
                                    color: AppUI.errorLiteColor)
                             ,)
                         ]
                        ],)

                        );
          }
    );
  
  }
}