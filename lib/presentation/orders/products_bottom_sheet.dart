import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../models/order/orders_model.dart';
import '../../shared/components.dart';
import '../../utilities/app_ui.dart';
import '../../utilities/app_util.dart';

class ProductsBottomSheet extends StatefulWidget {
  final Order? data;
  const ProductsBottomSheet({Key? key , required this.data}) : super(key: key);

  @override
  State<ProductsBottomSheet> createState() => _ProductsBottomSheetState();
}

class _ProductsBottomSheetState extends State<ProductsBottomSheet> {
  @override
  Widget build(BuildContext context) {
     return SizedBox(
                height: AppUtil.responsiveHeight(context)*0.9,
                child: Scaffold(
                backgroundColor: Colors.transparent,
                  appBar: AppBar(
                   backgroundColor: Colors.transparent,
                   centerTitle: true,
                  title: CustomText(text: "Products".tr() , color: AppUI.blackColor , fontSize: 20,), 
                  elevation: 0 ,
                  leadingWidth: 50,
                  leading:InkWell(onTap: () {
                  Navigator.pop(context, true); 
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset("${AppUI.imgPath}closePopup.png",height: 15,width: 15),
                  )
                  )),
      // customAppBar(title: "Category" , centerTitle: true,elevation: 0.5),
      body: Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
      child:  ListView.separated(
                    separatorBuilder: (context, index) {
                      return  Divider(
                        color: AppUI.shimmerColor.withOpacity(0),
                        thickness: 0,
                      );
                    },
                    scrollDirection: Axis.vertical,
                    itemCount: widget.data?.orderDetails?.length ?? 0,
                    itemBuilder: (context, count) {
                      final item = count;
                                                    // Image.asset("${AppUI.imgPath}Coffe.png",width: 80,height: 80,),

                      return  Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                          // decoration: BoxDecoration(borderRadius: BorderRadius.circular(12) , border:Border.all(color: AppUI.shimmerColor) ),
                          child: Padding(padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                          child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                              SetImage(width: 30, height: 30, img: widget.data?.orderDetails?[count].product?.image, borderRadius: 0),
                              SizedBox(width: 10,),
                              CustomText(text: "${widget.data?.orderDetails?[count].quantity} X ${widget.data?.orderDetails?[count].product?.productTitle}" , fontSize: 12, color: AppUI.blackColor,),
                              SizedBox(width: 10,),
                              ],
                              ),

                              CustomText(text: "${widget.data?.orderDetails?[count].discountPrice == "0.00"  || widget.data?.orderDetails?[count].discountPrice == null ? (widget.data?.orderDetails?[count].price) : widget.data?.orderDetails?[count].discountPrice} ${"SR".tr()}" , fontSize: 12, color: AppUI.blackColor,)

                          ]),),
                        ),
                      );

                    }) ,
      ),
    ));
  }
}