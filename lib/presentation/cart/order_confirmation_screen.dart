// OrderConfirmationScreen

import 'package:adelco_user/bloc/Checkout/checkout_cubit.dart';
import 'package:adelco_user/shared/components.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../bloc/Cart/cart_cubit.dart';
import '../../utilities/app_ui.dart';
import '../../utilities/app_util.dart';
import '../map/select_address_bottom_sheet.dart';
import 'cart_bottom_sheet.dart';

class OrderConfirmationScreen extends StatefulWidget {
  const OrderConfirmationScreen({Key? key}) : super(key: key);

  @override
  State<OrderConfirmationScreen> createState() => _OrderConfirmationScreenState();
}

class _OrderConfirmationScreenState extends State<OrderConfirmationScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  String? time;
  String? pay;
  @override
  Widget build(BuildContext context) {
    final cubitCart = CartCubit.get(context);
    final cubit = CheckoutCubit.get(context);
    return BlocBuilder< CheckoutCubit, CheckoutState>(
          buildWhen : (_,state) => state is  PlacementOrderLoadingState || state is PlacementOrderLoadedState || state is PlacementOrderErrorState ||
           state is ValidateCouponCodeLoadingState || state is ValidateCouponCodeLoadedState || state is ValidateCouponCodeErrorState,
          builder: (context, state) {
          return Scaffold(
      appBar: customAppBar(title: "Order details".tr(), centerTitle: true , elevation: 0.5),
      body:  ListView(
        children: [
           Padding(
             padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
             child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: "Products".tr() ,fontSize: 16,fontWeight: FontWeight.w700, color: AppUI.blackColor,),
//                   InkWell(onTap: () {
// showModalBottomSheet(
//             isScrollControlled: true,
//             shape: RoundedRectangleBorder(
//              borderRadius: BorderRadius.only(topLeft: Radius.circular(20) , topRight: Radius.circular(20)),),
//             context: context,
//             builder: (BuildContext context) {
//               return BottomSheet(
//                 shape: RoundedRectangleBorder(
//              borderRadius: BorderRadius.only(topLeft: Radius.circular(20) , topRight: Radius.circular(20)),),
//               onClosing: () {},
//               builder: (BuildContext context) {
//               var type = 0 ;
//           return StatefulBuilder(builder: (BuildContext context, StateSetter mystate) {
//           return CartBottomSheet();
//           });});});
//                  },
//                  child: CustomText(text: "Show".tr() , fontSize: 14,color: AppUI.mainColor,fontWeight: FontWeight.w700,) ,
//                  ),
              ],),
           ),
              Container(
                    height:180,
                child: GridView.builder(
                 shrinkWrap : false,
                    primary: false,
                    itemCount: cubitCart.cartModel?.data?.cartDetails?.length,
                    scrollDirection:Axis.horizontal,
                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                 crossAxisCount: 1,
                 crossAxisSpacing : 5 ,
                 mainAxisSpacing: 10 ,
                 childAspectRatio  : 1/0.7,
                 
           ),
          itemBuilder: (BuildContext context, int index) { 
            return  Container(
                      width: 90,
                      height: 170,
                      decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppUI.whiteColor,
                                   border:Border.all(color: AppUI.shimmerColor)
                                  ),
                      child: Column(
                        children: [
                          SizedBox(height: 10,),
                          // Image.asset("${AppUI.imgPath}milk.png",height: 80,width: 80),
                          SetImage(width: 80, height: 80, img: cubitCart.cartModel?.data?.cartDetails?[index].product?.image, borderRadius: 0),
                          SizedBox(height: 10,),
                          Container(
                            margin: EdgeInsets.all(5.0),
                            child: Center(child: CustomText(text: "${cubitCart.cartModel?.data?.cartDetails?[index].quantity}",color: AppUI.whiteColor,)),
                            decoration: BoxDecoration(
                            color: AppUI.mainColor,
                             shape: BoxShape.circle
                           )
                          ),
                         CustomText(text: "${cubitCart.cartModel?.data?.cartDetails?[index].product?.productTitle}",color: AppUI.blackColor,)

                        ],

                      ),
                      );
            },
            ),
            ),
            Padding(padding: EdgeInsets.fromLTRB(10, 20, 10, 20),child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(text: "Delivery location".tr(),fontSize: 16,fontWeight: FontWeight.w400,color: AppUI.blackColor,),
                SizedBox(height: 10,),
                InkWell(child:  SelectLocationContainer(), onTap: (){
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
          return  SelectAddressBottomSheet();
          });});});

                },),
                SizedBox(height: 10,),
                CustomText(text: "Delivery time".tr(),fontSize: 16,fontWeight: FontWeight.w400,color: AppUI.blackColor,),
                SizedBox(height: 10,),
                Container(
                  height: 45,
                decoration: BoxDecoration(
                 color: AppUI.whiteColor,
                 border: Border.all(color: AppUI.shimmerColor),
                 borderRadius: BorderRadius.circular(8),),
                  padding: EdgeInsets.all(8),
          child: Row(
          children: [
                Radio(
                  activeColor: AppUI.mainColor,
                    value: "morning_period", 
                    groupValue: time, 
                    onChanged: (value){
                      setState(() {
                          time = value.toString();
                          cubit.deliveryDuration = value.toString();
                      });
                    },
                ),
          SvgPicture.asset("${AppUI.iconPath}sun.svg"),
          SizedBox(width: 5,),
          
          CustomText(text: "Morning time".tr() , color: AppUI.blackColor, fontSize: 12,),
         ],),),
         SizedBox(height: 10,),
          Container(
                  height: 45,
                decoration: BoxDecoration(
                 color: AppUI.whiteColor,
                 border: Border.all(color: AppUI.shimmerColor),
                 borderRadius: BorderRadius.circular(8),),
                  padding: EdgeInsets.all(8),
          child: Row(
          children: [
                Radio(
                  activeColor: AppUI.mainColor,
                    value: "evening_period", 
                    groupValue: time, 
                    onChanged: (value){
                      setState(() {
                          time = value.toString();
                          cubit.deliveryDuration = value.toString();
                      });
                    },
                ),
          SvgPicture.asset("${AppUI.iconPath}moon.svg"),
          SizedBox(width: 5,),
          
          CustomText(text: "Evening time".tr() , color: AppUI.blackColor, fontSize: 12,),
         ],),),
         SizedBox(height: 10,),
         CustomText(text: "Promo code".tr(),fontSize: 16,fontWeight: FontWeight.w400,color: AppUI.blackColor,),
         SizedBox(height: 10,),
         CustomInput(
          suffixIcon: InkWell(child: Padding(
            padding: const EdgeInsets.only(top: 20 , bottom: 20),
            child: CustomText(text: "Send".tr() ,fontWeight: FontWeight.bold, color:  AppUI.mainColor1,),
          ),onTap: () async {
            await cubit.coupon();
            if (cubit.couponModel?.status == true){
            AppUtil.successToast(context, cubit.couponModel?.message);

            setState(() {
                          cubit.discount =   cubit.couponModel?.data?.value ?? 0;
            cubit.promoCodeText =  cubit.promoCode.text ;
            });
            }else{
              AppUtil.errorToast(context, cubit.couponModel?.message);
            }
            print("ccc");
          },),
          
          controller: cubit.promoCode, textInputType: TextInputType.text ,lable: "Promo code".tr(), prefixIcon: Container(padding: EdgeInsets.all(3),child: SvgPicture.asset("${AppUI.iconPath}ticket.svg")) ,),
         SizedBox(height: 10,),
                CustomText(text: "Payment type".tr(),fontSize: 16,fontWeight: FontWeight.w400,color: AppUI.blackColor,),
                SizedBox(height: 10,),
                Container(
                  height: 45,
                decoration: BoxDecoration(
                 color: AppUI.whiteColor,
                 border: Border.all(color: AppUI.shimmerColor),
                 borderRadius: BorderRadius.circular(8),),
                  padding: EdgeInsets.all(8),
          child: Row(
          children: [
                Radio(
                  activeColor: AppUI.mainColor,
                    value: "1", 
                    groupValue: pay, 
                    onChanged: (value){
                      setState(() {
                          pay = value.toString();
                      });
                    },
                ),
          SvgPicture.asset("${AppUI.iconPath}money.svg"),
          SizedBox(width: 5,),
          
          CustomText(text: "Payment on delivery".tr() , color: AppUI.blackColor, fontSize: 12,),
         ],),),
         SizedBox(height: 10,),
          Container(
                  height: 45,
                decoration: BoxDecoration(
                 color: AppUI.whiteColor,
                 border: Border.all(color: AppUI.shimmerColor),
                 borderRadius: BorderRadius.circular(8),),
                  padding: EdgeInsets.all(8),
          child: Row(
          children: [
                Radio(
                  activeColor: AppUI.mainColor,
                    value: "2", 
                    groupValue: pay, 
                    onChanged: (value){
                      setState(() {
                          pay = value.toString();
                      });
                    },
                ),
          SvgPicture.asset("${AppUI.iconPath}card.svg"),
          SizedBox(width: 5,),
          
          CustomText(text: "Online payment".tr() , color: AppUI.blackColor, fontSize: 12,),
         ],),),
          SizedBox(height: 10,),
          CustomText(text: "Note for delivery".tr(),fontSize: 16,fontWeight: FontWeight.w400,color: AppUI.blackColor,),
          SizedBox(height: 10,),
          CustomInput(controller: cubit.note, textInputType: TextInputType.text ,lable: "Note".tr() ,hint: "Please mention any notes related to the order".tr(),maxLines: 5,),
          SizedBox(height: 10,), 
          CustomText(text: "Bill Summary".tr() , color: AppUI.blackColor, fontSize: 16,fontWeight: FontWeight.w400,),
                      SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: "${cubitCart.cartModel?.data?.cartInfo?.quantity} ${"Product".tr()}"  , color: AppUI.blackColor,),
                CustomText(text: "${cubitCart.cartModel?.data?.cartInfo?.subtotal} ${"SR".tr()}", color: AppUI.blackColor),
              ],
            ),
            SizedBox(height: 10,),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: "Delivery".tr() , color: AppUI.blackColor,),
                CustomText(text: "${cubitCart.cartModel?.data?.cartInfo?.shippingPrice} ${"SR".tr()}"  , color: AppUI.blackColor),
              ],
            ),
            SizedBox(height: 10,),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: "Tax".tr() , color: AppUI.blackColor,),
                CustomText(text: "${cubitCart.cartModel?.data?.cartInfo?.vat} ${"SR".tr()}" , color: AppUI.blackColor),
              ],
            ),
            SizedBox(height: 10,),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: "Promo code".tr() , color: AppUI.blackColor,),
                CustomText(text: "${cubit.discount ?? 0} ${"SR".tr()}" , color: AppUI.errorColor),
              ],
            ),
            SizedBox(height: 10,),
              ],
            ),)

        ],
      ),
       bottomNavigationBar: Container(
        decoration: BoxDecoration( border:Border.all(color: AppUI.shimmerColor ,width: 0.5) ),
        height: 130,
        width: AppUtil.responsiveWidth(context),
        child: Padding(padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Column(
          children: [
           SizedBox(height: 10,),
           Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: "Total".tr() , color: AppUI.blackColor,fontSize: 16,fontWeight: FontWeight.w600,),
                CustomText(text: "${(double.parse(cubitCart.cartModel?.data?.cartInfo?.total ?? "0") - (cubit.discount ?? 0))} ${"SR".tr()}" , color: AppUI.blackColor,fontSize: 16,fontWeight: FontWeight.w600,),
              ],
            ),
            SizedBox(height: 10,),
            if (state is PlacementOrderLoadingState)...[
            LoadingWidget(),
            ]
            else
            CustomButton(text: "Order execution".tr() , radius: 36, height: 17,onPressed: () async {
              if (cubit.addressId == null){
                AppUtil.errorToast(context, "Select your location".tr());
              }else if (cubit.deliveryDuration == null){
               AppUtil.errorToast(context, "Choose your delivery time".tr());
              }else{
              await cubit.placementOrder();
              if (cubit.placementOrderModel?.status == true){
                AppUtil.successToast(context, cubit.placementOrderModel?.message);
               await cubitCart.removeAll();
                cubitCart.getCart();
              }else{
                AppUtil.errorToast(context, cubit.placementOrderModel?.message);
              }
              }
            },)
            
        ],),
        )
        )

    );
  }
    );
  }
}