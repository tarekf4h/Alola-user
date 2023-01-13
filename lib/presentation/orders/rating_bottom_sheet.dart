
// RatingottomSheet
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../shared/components.dart';
import '../../utilities/app_ui.dart';
import '../../utilities/app_util.dart';
import 'dart:ui' as ui;

class RatingottomSheet extends StatefulWidget {
  const RatingottomSheet({Key? key}) : super(key: key);

  @override
  State<RatingottomSheet> createState() => _RatingottomSheetState();
}

class _RatingottomSheetState extends State<RatingottomSheet> {
  @override
  Widget build(BuildContext context) {
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
            Expanded(child:   CustomText(text: "Your rating for the delegate" , fontSize: 12,color: AppUI.blackColor,)),
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
            Expanded(child:   CustomText(text: "Rate your delivery time" , fontSize: 12,color: AppUI.blackColor,)),
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
            Expanded(child:   CustomText(text: "Rate your delivery speed" , fontSize: 12,color: AppUI.blackColor,)),
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
            Expanded(child: CustomText(text: "Your rating for the products" , fontSize: 12,color: AppUI.blackColor,)),
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
              child: CustomInput(controller: TextEditingController(), textInputType: TextInputType.name , maxLines: 4, lable: "Note",),
            ),
            SizedBox(height: 12,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomButton(text: "Send"),
            ),
             SizedBox(height: 12,),

      ],)
      ),
    ));
  }
}



