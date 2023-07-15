import 'package:flutter/cupertino.dart';
import '../../../models/order/orders_model.dart';
import '../../../shared/components.dart';
import '../../../utilities/app_ui.dart';

class ProductOrder extends StatefulWidget {
  final OrderDetails? data;
  const ProductOrder({super.key , required this.data});

  @override
  State<ProductOrder> createState() => _ProductOrderState();
}

class _ProductOrderState extends State<ProductOrder> {
  @override
  Widget build(BuildContext context) {
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
                        // Image.asset("${AppUI.imgPath}milk.png",
                            // height: 70, width: 70),
                          SetImage(width: 70, height: 70, img: widget.data?.product?.image, borderRadius: 0),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            // margin: EdgeInsets.all(5.0),
                            padding: EdgeInsets.only(top: 3),
                            child: Center(
                                child: CustomText(
                              text: "${widget.data?.quantity}",
                              color: AppUI.whiteColor,
                            )),
                            decoration: BoxDecoration(
                                color: AppUI.mainColor,
                                shape: BoxShape.circle)),
                                SizedBox(
                          height: 8,
                        ),
                        CustomText(
                          text: "${widget.data?.product?.productTitle}",
                          color: AppUI.blackColor,
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  );
  }
}