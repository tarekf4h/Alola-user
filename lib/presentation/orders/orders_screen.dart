import 'package:adelco_user/presentation/orders/previous_order_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../bloc/Orders/orders_cubit.dart';
import '../../shared/components.dart';
import '../../utilities/app_ui.dart';
import '../../utilities/app_util.dart';
import 'cancel_order_screen.dart';
import 'current_order_screen.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final cubit = OrdersCubit.get(context);
    if(AppUtil.isLogin){
    cubit.getOrders();
    }
  }
  @override
  Widget build(BuildContext context) {
    final cubit = OrdersCubit.get(context);
        return Scaffold(
        appBar: customAppBar(title: "Orders".tr() , elevation: 0.5 , centerTitle: true),
        body:BlocBuilder< OrdersCubit, OrdersState>(
          buildWhen : (_,state) => state is GetOrdersLoadingState || state is GetOrdersLoadedState || state is GetOrdersErrorState,
          builder: (context, state) {
            if(state is GetOrdersLoadingState){
              return const LoadingWidget();
            }
            if(state is  GetOrdersErrorState){
              return const ErrorFetchWidget();
            }
            return Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: (AppUtil.isLogin || (cubit.ordersModel?.orders?.length ?? 0) > 0) ? ListView.separated(
                    separatorBuilder: (context, index) {
                      return  Divider(
                        color: AppUI.shimmerColor.withOpacity(0),
                        thickness: 0,
                      );
                    },
                    scrollDirection: Axis.vertical,
                    itemCount: cubit.ordersModel?.orders?.length ?? 0,
                    itemBuilder: (context, count) {
                      final item = count;
                      return InkWell(child:  Padding(
                        padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12) , border:Border.all(color: AppUI.shimmerColor) ),
                          child: Padding(padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                          child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset("${AppUI.imgPath}Shape.png",width: 56,height: 56,),
                              SizedBox(width: 10,),
                              Expanded(child: 
                              
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      // Text('${cubit.notifications![count].body}'),
                                      // Text('${cubit.notifications![count].date} ${cubit.notifications![count].time}'),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                        CustomText(text: "${cubit.ordersModel?.orders?[count].orderInfo?.quantity} ${"Product".tr()}" , color:  AppUI.blackColor,),
                                        Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(8) , color:
                                          (cubit.ordersModel?.orders?[count].orderInfo?.status == "Canceled" || cubit.ordersModel?.orders?[count].orderInfo?.status == "تم الإلغاء") ?
                                         AppUI.errorColor.withAlpha(100) : 
                                         (cubit.ordersModel?.orders?[count].orderInfo?.status == "Validated" || cubit.ordersModel?.orders?[count].orderInfo?.status == "التحقق من الطلب") ?
                                         AppUI.secondColor : 
                                         AppUI.activeColor.withAlpha(100)

                                         ),padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                        child: Center(child: CustomText(text: "${cubit.ordersModel?.orders?[count].orderInfo?.status}", color: 
                                        (cubit.ordersModel?.orders?[count].orderInfo?.status == "Canceled" || cubit.ordersModel?.orders?[count].orderInfo?.status == "تم الإلغاء") ?
                                         AppUI.errorColor : 
                                         (cubit.ordersModel?.orders?[count].orderInfo?.status == "Validated" || cubit.ordersModel?.orders?[count].orderInfo?.status == "التحقق من الطلب") ?
                                         AppUI.mainColor : 
                                         AppUI.activeColor,)))
                                      ],),
                                    
                                    SizedBox(height: 5,),
                                    CustomText(text:"${cubit.ordersModel?.orders?[count].orderInfo?.orderCode}"   ,fontSize: 10, color: AppUI.greyColor,),
                                    SizedBox(height: 5,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            
                                           CustomText(text: "${cubit.ordersModel?.orders?[count].orderInfo?.date}" , color:  AppUI.blackColor,),
                                           SizedBox(width: 5,),
                                           CustomText(text: "${cubit.ordersModel?.orders?[count].orderInfo?.total } ${"SR".tr()}" , color:  AppUI.blackColor,fontWeight: FontWeight.w600,),
                                          ],

                                         )
                                    
                                  ],),
                                ),
                             

                          ]),),
                        ),
                      ),
                      onTap: () {
                      if (cubit.ordersModel?.orders?[count].orderInfo?.status == "Canceled" || cubit.ordersModel?.orders?[count].orderInfo?.status == "تم الإلغاء") {
                        AppUtil.mainNavigator(context, CancelOrderScreen(data: cubit.ordersModel?.orders?[count],));
                      }else if(cubit.ordersModel?.orders?[count].orderInfo?.status == "Validated" || cubit.ordersModel?.orders?[count].orderInfo?.status == "التحقق من الطلب") {
                        AppUtil.mainNavigator(context, CurrentOrderScreen(data: cubit.ordersModel?.orders?[count],));
                      }else{
                        AppUtil.mainNavigator(context, PreviousOrderScreen(data: cubit.ordersModel?.orders?[count],));
                      }

                      },
                      );

                    }) : Center(child: CustomText(text: "There are no orders".tr() , fontWeight: FontWeight.bold,fontSize: 18,)) ,
      );
          }
        )
        );
  }
}