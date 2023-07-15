import 'dart:ffi';

import 'package:adelco_user/shared/components.dart';
import 'package:adelco_user/utilities/app_util.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../bloc/Cart/cart_cubit.dart';
import '../../bloc/product/product_cubit.dart';
import '../../models/product/home_model.dart';
import '../../utilities/app_ui.dart';
import '../auth/login_screen.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product? data;
  const ProductDetailsScreen({Key? key , required this.data}) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
  final cubit = ProductCubit.get(context);
  final cubitCart = CartCubit.get(context);

    return BlocBuilder< CartCubit, CartState>(
          buildWhen : (_,state) => state is  RemoveCartLoadingState || state is RemoveCartLoadedState || state is RemoveCartErrorState ||
           state is UpdateCartLoadingState || state is UpdateCartLoadedState || state is UpdateCartErrorState ,
          builder: (context, state) {
          return Scaffold(
      appBar: customAppBar(backgroundColor: AppUI.mainColor.withAlpha(800)
      ,title: "" , 
      leadingWidth: 60.0,
        leading: InkWell(child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(width: 60,decoration: BoxDecoration(color: AppUI.mainColor.withAlpha(300),borderRadius:BorderRadius.all(Radius.circular(10))),padding: EdgeInsets.all(8),child: AppUtil.Lang != "ar" ? SvgPicture.asset("${AppUI.iconPath}back.svg" , width: 25,height: 25,) : Transform.scale(scaleX: -1,child: SvgPicture.asset("${AppUI.iconPath}back.svg" , width: 25,height: 25,),)),) , onTap: (){ Navigator.pop(context);},),
        actions: [InkWell(child:Padding(
        padding: const EdgeInsets.all(8.0), 
        // bookmarkFill
        child: Container(decoration: BoxDecoration(color: AppUI.mainColor.withAlpha(300),borderRadius:BorderRadius.all(Radius.circular(10))),padding: EdgeInsets.all(10),child: widget.data?.favoriteStatus == false ?
         SvgPicture.asset("${AppUI.iconPath}bookmark.svg" , width: 20,height: 20,) :
         SvgPicture.asset("${AppUI.iconPath}bookmarkFill.svg" , width: 20,height: 20,) ),)  ,onTap: () async {
          if (AppUtil.isLogin){
          if(widget.data?.favoriteStatus == true){
            await cubit.removeFavorite("${widget.data?.id}");
            if (cubit.removeFavoriteModel?.status == true ) {
             widget.data?.favoriteStatus = false;
             AppUtil.successToast(context, cubit.removeFavoriteModel?.message ?? "");
             setState(() {
               
             });
             cubit.home();
            }

          }else{
            await cubit.addFavorite("${widget.data?.id}");
            if (cubit.addFavoriteModel?.status == true ) {
             widget.data?.favoriteStatus = true;
             AppUtil.successToast(context, cubit.addFavoriteModel?.message ?? "");
             setState(() {
               
             });
             cubit.home();
            }
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
         },),
        InkWell(child:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(decoration: BoxDecoration(color: AppUI.mainColor.withAlpha(300),borderRadius:BorderRadius.all(Radius.circular(10))),padding: EdgeInsets.all(10),child: SvgPicture.asset("${AppUI.iconPath}share.svg" , width: 20,height: 20,)),)  ,onTap: (){},),
        ]
      ),
      body: ListView(
        children: [
          Container(
            color:  AppUI.mainColor.withAlpha(800),
            height: 160,
            child: Center(child:SetImage(width: 80, height: 80, img: widget.data?.image, borderRadius: 0) ,),
            ),
            Container
            (child: Padding(padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
             child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10,),
                              CustomText(text: widget.data?.productTitle,color: AppUI.blackColor,),
                              SizedBox(height: 5,),
                              CustomText(text: "${widget.data?.weight} ${widget.data?.productUnit}",color: AppUI.blackColor,fontSize: 12,),
                              SizedBox(height: 5,),
                              Row(children: [
                                CustomText(text: "${widget.data?.discountPrice == null ? widget.data?.price : widget.data?.discountPrice} ${"SR".tr()}",color: AppUI.mainColor,fontWeight: FontWeight.w600,),
                                                               if(widget.data?.discountPrice != null)...[
                                SizedBox(width: 5,),
                                CustomText(text: "${widget.data?.price} ${"SR".tr()}" ,color: AppUI.greyColor, textDecoration: TextDecoration.lineThrough)
                                ]
                              ],),
                            SizedBox(height: 5,),
                            Divider(height: 1,),
                            SizedBox(height: 5,),

                                SizedBox(height: 10,),
                                Row(children: [SvgPicture.asset("${AppUI.iconPath}publicFill.svg" , height: 15,width: 15,) , SizedBox(width: 10,) , CustomText(text: "Country of Origin :".tr() , color: AppUI.blackColor,)],),
                                SizedBox(height: 5,),
                                Expanded(
                                  flex: 0,
                                  child: 
                                Padding(
                                  padding: const EdgeInsets.only(left:25 ),
                                  child: CustomText(text: widget.data?.country , color: AppUI.greyColor,),
                                )),
                                SizedBox(height: 10,),
                                SizedBox(height: 10,),
                                Row(children: [SvgPicture.asset("${AppUI.iconPath}verified.svg" , height: 15,width: 15,) , SizedBox(width: 10,) , CustomText(text: "Product Expiry :".tr() , color: AppUI.blackColor,)],),
                                SizedBox(height: 5,),
                                Expanded(
                                  flex: 0,
                                  child: 
                                Padding(
                                  padding: const EdgeInsets.only(left:25 ),
                                  child: CustomText(text: widget.data?.validity , color: AppUI.greyColor,),
                                )),
                                SizedBox(height: 10,),
                                SizedBox(height: 10,),
                                Row(children: [SvgPicture.asset("${AppUI.iconPath}info.svg" , height: 15,width: 15,) , SizedBox(width: 10,) , CustomText(text: "Product information :".tr() , color: AppUI.blackColor,)],),
                                SizedBox(height: 5,),
                                Expanded(
                                  flex: 0,
                                  child: 
                                Padding(
                                  padding: const EdgeInsets.only(left:25 ),
                                  child: CustomText(text: widget.data?.productDetails , color: AppUI.greyColor,),
                                )),
                                SizedBox(height: 10,),
                            ],
                        ),),),
      ],),
      bottomNavigationBar: Container(decoration: BoxDecoration(color: AppUI.whiteColor,boxShadow:[ BoxShadow(
        color: Colors.grey.withAlpha(100),
        blurRadius: 0.5, 
        spreadRadius: 0.5, 
        offset: Offset(
          0.5, 
          0.5,
        ),
      )]),padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),width: AppUtil.responsiveWidth(context) , height: 70,
                                     child: Row(
                                      children: [
                                       
                                        Expanded(child: Container(
                                          padding: EdgeInsets.only(right: 10,left: 10),
                                          height: 50,
                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12) , border:Border.all(color: AppUI.shimmerColor) ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [

                                            InkWell(child:  SvgPicture.asset("${AppUI.iconPath}plus.svg"),onTap: () {
                                              if (widget.data?.cartQuantity != null){
                                                widget.data?.cartQuantity = ((widget.data?.cartQuantity ?? 1)+ 1);
                                              }else{
                                                widget.data?.cartQuantity = 1;
                                              }
                                              setState(() {
                                                
                                              });
                                              
                                            },), 
                                             CustomText(text: "${widget.data?.cartQuantity ?? 1}",color: AppUI.blackColor,),
                                             if((widget.data?.cartQuantity ?? 0 ) > 1)...[
                                            InkWell(child:  SvgPicture.asset("${AppUI.iconPath}minus.svg") ,onTap: () {
                                              if (widget.data?.cartQuantity != null){
                                                widget.data?.cartQuantity = ((widget.data?.cartQuantity ?? 1) - 1);
                                              }else{
                                                widget.data?.cartQuantity = 1;
                                              }
                                              setState(() {
                                                
                                              });
                                            },
                                            )
                                             ],
                                             if((widget.data?.cartQuantity ?? 0 ) <= 1)...[
                                            InkWell(child:  SvgPicture.asset("${AppUI.iconPath}trash.svg" , color: widget.data?.cartQuantity == null ? AppUI.mainColor.withAlpha(100) :  AppUI.mainColor  ,),
                                            onTap: () async {
                                            if( widget.data?.cartQuantity != null){
                                            await cubitCart.removeCart( "${widget.data?.id ?? 0}" );
                                            if(cubitCart.removeCartModel?.status == true){
                                              AppUtil.successToast(context, cubitCart.removeCartModel?.message ?? "");
                                              widget.data?.cartQuantity = null;
                                            cubit.home();
                                            setState(() {
                                              
                                            });
                                            }
                                            }
                                            },)
                                             ]
                                             ],
                                          ),
                                        )),
                                         SizedBox(width: 20,),
                                         CustomButton(text: "Add".tr() ,fontSize: 12,width: AppUtil.responsiveWidth(context) * 0.3,onPressed: () async {
                                          if (AppUtil.isLogin){
                                           await cubitCart.updateCart( widget.data?.id ?? 0 , (widget.data?.cartQuantity ?? 1 ) );
                                   if(cubitCart.updateCartModel?.status == true){
                                    widget.data?.cartQuantity = widget.data?.cartQuantity ?? 1;
                                    cubit.home();
                                   AppUtil.successToast(context, cubitCart.updateCartModel?.message ?? "");

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
           } },),
                                      ],
                                     )
          ,),

    );
          }
    );
  }
}