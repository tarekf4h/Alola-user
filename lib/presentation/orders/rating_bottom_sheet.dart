
// RatingottomSheet
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../bloc/Orders/orders_cubit.dart';
import '../../shared/components.dart';
import '../../utilities/app_ui.dart';
import '../../utilities/app_util.dart';
import 'dart:ui' as ui;

class RatingottomSheet extends StatefulWidget {
  final int? id;
  const RatingottomSheet({Key? key , required this.id}) : super(key: key);

  @override
  State<RatingottomSheet> createState() => _RatingottomSheetState();
}

class _RatingottomSheetState extends State<RatingottomSheet> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final cubit = OrdersCubit.get(context);
    cubit.deliverySpeedReview = null;
    cubit.captainReview = null;
    cubit.deliveryTimeReview = null;
    cubit.productsReview = null;

  }
  @override
  Widget build(BuildContext context) {
        final cubit = OrdersCubit.get(context);
    return BlocBuilder< OrdersCubit, OrdersState>(
          buildWhen : (_,state) => state is ReviewLoadingState || state is ReviewLoadedState || state is ReviewErrorState,
          builder: (context, state) {
           return SizedBox(
                height: AppUtil.responsiveHeight(context)*0.9,
                child: Scaffold(
                backgroundColor: Colors.transparent,
                  appBar: AppBar(
                   backgroundColor: Colors.transparent,
                   centerTitle: true,
                  title: CustomText(text: "Rating".tr() , color: AppUI.blackColor , fontSize: 20,), 
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
      body: Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
      child:  ListView(children: [
        Container(
          decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppUI.shimmerColor)),
          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Expanded(child:   CustomText(text: "Your rating for the delegate".tr() , fontSize: 12,color: AppUI.blackColor,)),
              // Expanded(child: 
               RatingBar(
              initialRating: 0,
              minRating: 1,
              // ignoreGestures: true,
              direction: Axis.horizontal,
              // allowHalfRating: f,
              itemCount: 5,
              itemSize: 35,
              unratedColor: AppUI.iconColor,
              onRatingUpdate: (rating) {
                // cubit.rateAdded = rating;
                cubit.captainReview =  "${rating}";
                setState(() {});
              }, ratingWidget: RatingWidget(
                empty:  Icon(Icons.star_border,size: 25,color: AppUI.iconColor,),
                half:  const Directionality(textDirection: ui.TextDirection.ltr,
                    child: Icon(Icons.star_half,size: 25,color: Colors.amber,)),
                full: const Icon(Icons.star,size: 25,color: Colors.amber,)
            ),
            ),
          ],

          ),
        ),
        SizedBox(height: 8,),
         Container(
          decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppUI.shimmerColor)),
          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Expanded(child:   CustomText(text: "Rate your delivery time".tr() , fontSize: 12,color: AppUI.blackColor,)),
              // Expanded(child: 
               RatingBar(
              initialRating: 0,
              minRating: 1,
              // ignoreGestures: true,
              direction: Axis.horizontal,
              // allowHalfRating: f,
              itemCount: 5,
              itemSize: 35,
              unratedColor: AppUI.iconColor,
              onRatingUpdate: (rating) {
                // cubit.rateAdded = rating;
                cubit.deliveryTimeReview =  "${rating}";
                setState(() {});
              }, ratingWidget: RatingWidget(
                empty:  Icon(Icons.star_border,size: 25,color: AppUI.iconColor,),
                half:  const Directionality(textDirection: ui.TextDirection.ltr,
                    child: Icon(Icons.star_half,size: 25,color: Colors.amber,)),
                full: const Icon(Icons.star,size: 25,color: Colors.amber,)
            ),
            ),
          ],

          ),
        ),
        SizedBox(height: 8,),
         Container(
          decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppUI.shimmerColor)),
          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Expanded(child:   CustomText(text: "Rate your delivery speed".tr() , fontSize: 12,color: AppUI.blackColor,)),
              // Expanded(child: 
               RatingBar(
              initialRating: 0,
              minRating: 1,
              // ignoreGestures: true,
              direction: Axis.horizontal,
              // allowHalfRating: f,
              itemCount: 5,
              itemSize: 35,
              unratedColor: AppUI.iconColor,
              onRatingUpdate: (rating) {
                // cubit.rateAdded = rating;
                cubit.deliverySpeedReview =  "${rating}";
                setState(() {});
              }, ratingWidget: RatingWidget(
                empty:  Icon(Icons.star_border,size: 25,color: AppUI.iconColor,),
                half:  const Directionality(textDirection: ui.TextDirection.ltr,
                    child: Icon(Icons.star_half,size: 25,color: Colors.amber,)),
                full: const Icon(Icons.star,size: 25,color: Colors.amber,)
            ),
            ),
          ],

          ),
        ),
        
         SizedBox(height: 8,),
         Container(
          decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppUI.shimmerColor)),
          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Expanded(child: CustomText(text: "Your rating for the products".tr() , fontSize: 12,color: AppUI.blackColor,)),
              // Expanded(child: 
               RatingBar(
              initialRating: 0,
              minRating: 1,
              // ignoreGestures: true,
              direction: Axis.horizontal,
              // allowHalfRating: f,
              itemCount: 5,
              itemSize: 35,
              unratedColor: AppUI.iconColor,
              onRatingUpdate: (rating) {
                // cubit.rateAdded = rating;
                cubit.productsReview =  "${rating}";
                setState(() {});
              }, ratingWidget: RatingWidget(
                empty:  Icon(Icons.star_border,size: 25,color: AppUI.iconColor,),
                half:  const Directionality(textDirection: ui.TextDirection.ltr,
                    child: Icon(Icons.star_half,size: 25,color: Colors.amber,)),
                full: const Icon(Icons.star,size: 25,color: Colors.amber,)
            ),
            ),
          ],

          ),
        ),
            SizedBox(height: 8,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomInput(controller: TextEditingController(), textInputType: TextInputType.name , maxLines: 4, lable: "Note".tr(),),
            ),
            SizedBox(height: 12,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: state is ReviewLoadingState ? LoadingWidget() : CustomButton(text: "send".tr() ,onPressed: () async {
                await cubit.review("${widget.id}");
                if(cubit.reviewModel?.status == true){
                  AppUtil.successToast(context, cubit.reviewModel?.message);
                  Navigator.pop(context, true); 
                }else{
                 AppUtil.errorToast(context, cubit.reviewModel?.message);
                }
              },),
            ),
             SizedBox(height: 12,),

      ],)
      ),
    ));
  }
    );
  }
}



