
import 'dart:math';
import 'dart:ui' as ui;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:date_field/date_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../utilities/app_ui.dart';
import '../utilities/app_util.dart';
String lang = "en";
class GradientCircularProgressIndicator extends StatelessWidget {
  final double? radius;
  final List<Color>? gradientColors;
  final double strokeWidth;

  const GradientCircularProgressIndicator({Key? key,
    @required this.radius,
    @required this.gradientColors,
    this.strokeWidth = 10.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.fromRadius(radius!),
      painter: GradientCircularProgressPainter(
        radius: radius!,
        gradientColors: gradientColors!,
        strokeWidth: strokeWidth,
      ),
    );
  }
}

class GradientCircularProgressPainter extends CustomPainter {
  GradientCircularProgressPainter({
    @required this.radius,
    @required this.gradientColors,
    @required this.strokeWidth,
  });
  final double? radius;
  final List<Color>? gradientColors;
  final double? strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    size = Size.fromRadius(radius!);
    double offset = strokeWidth! / 2;
    Rect rect = Offset(offset, offset) &
    Size(size.width - strokeWidth!, size.height - strokeWidth!);
    var paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth!;
    paint.shader =
        SweepGradient(colors: gradientColors!, startAngle: 0.0, endAngle: 2 * pi)
            .createShader(rect);
    canvas.drawArc(rect, 0.0, 2 * pi, false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}


AppBar customAppBar ({required title,Widget? leading,List<Widget>? actions,double elevation = 0,Widget? bottomChild,Color? backgroundColor,bottomChildHeight,leadingWidth,centerTitle}){
  return AppBar(
    backgroundColor: backgroundColor??AppUI.whiteColor,
    elevation: double.parse(elevation.toString()),
    title: title is Widget? title : CustomText(text: title, fontSize: 18.0,color: AppUI.blackColor,fontWeight: FontWeight.w100,),
    centerTitle: centerTitle??false,
    leading: leading,
    leadingWidth: leadingWidth??30,
    actions: actions,
    bottom: bottomChild==null?null:PreferredSize(preferredSize: Size.fromHeight(bottomChildHeight??120),child: bottomChild,),
  );
}

// class SettingUser extends StatefulWidget {
//   const SettingUser({Key? key}) : super(key: key);

//   @override
//   State<SettingUser> createState() => _SettingUserState();
// }



// class _SettingUserState extends State<SettingUser> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
//       child: Container(
//         child: Row(
//           mainAxisAlignment:MainAxisAlignment.center,
//           children: [
//           Image.asset("${AppUI.imgPath}Ellipse 357.png",height: 40,width: 40),
//           SizedBox(width: 5,),
//           Image.asset("${AppUI.imgPath}Mask Group 314.png",height: 20,width: 20),
//         ],),

//       ),
//     );
    
//   }
// }

class CustomText extends StatelessWidget {
  final String? text;
  final double fontSize;
  final TextAlign? textAlign;
  final FontWeight fontWeight;
  final Color? color;
  final TextDecoration? textDecoration;
  final EdgeInsetsGeometry? padding;
  const CustomText({Key? key,@required this.text,this.fontSize = 14,this.textAlign,this.fontWeight = FontWeight.w100,this.color,this.textDecoration , this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(padding: padding,child: Text(text!,textAlign: textAlign==null?AppUtil.rtlDirection(context)?TextAlign.right:textAlign:TextAlign.left,style: TextStyle(color: color??AppUI.mainColor,fontSize: fontSize,fontWeight: fontWeight,decoration: textDecoration),textDirection: AppUtil.rtlDirection(context)?ui.TextDirection.rtl:ui.TextDirection.ltr,));
  }
}
class CustomTextCenter extends StatelessWidget {
  final String? text;
  final double fontSize;
  final TextAlign? textAlign;
  final FontWeight fontWeight;
  final Color? color;
  final TextDecoration? textDecoration;
  const CustomTextCenter({Key? key,@required this.text,this.fontSize = 14,this.textAlign,this.fontWeight = FontWeight.w100,this.color,this.textDecoration}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text!,textAlign: ui.TextAlign.center,style: TextStyle(color: color??AppUI.mainColor,fontSize: fontSize,fontWeight: fontWeight,decoration: textDecoration),textDirection: AppUtil.rtlDirection(context)?ui.TextDirection.rtl:ui.TextDirection.ltr,);
  }
}
// class CustomshowDialog
// CustomShowDaialog

class CustomShowDaialog extends StatelessWidget {
  final Function()? onPressed;
  const CustomShowDaialog({Key? key , this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
              title: AppBar(
                title: CustomText(text: "Add a new site".tr() , color: AppUI.blackColor , fontSize: 20,), 
                elevation: 0 ,
                leading:InkWell(onTap: () {
                Navigator.pop(context, true); 
                },
                child:Image.asset("${AppUI.imgPath}closePopup.png",height: 20,width: 20) ,)),
                scrollable: true,
                shape: RoundedRectangleBorder(borderRadius: 
                BorderRadius.all(Radius.circular(30))),
                content:Container(
                width: AppUtil.responsiveWidth(context)*0.3,
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [                     
                Container(width: 300,child: CustomInput(controller: TextEditingController(), textInputType: TextInputType.name , lable: "Site name".tr() )),
                SizedBox(height: 30,),
                Container(width: 300,child: CustomInput(controller: TextEditingController(), textInputType: TextInputType.name , lable: "Site capacity".tr() )),
                SizedBox(height: 30,),
                Container(width: 300,child: CustomInput(controller: TextEditingController(), textInputType: TextInputType.number , lable: "Temperature".tr() )),
                SizedBox(height: 30,),
                Container(width: 300,child: CustomInput(controller: TextEditingController(), textInputType: TextInputType.number , lable: "Barcode Number".tr() )),
                SizedBox(height: 60,),
                Container(
                  width: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton(width: 120,text:  "Add".tr() , radius: 20 ,onPressed: onPressed),
                      SizedBox(width: 30,),
                      CustomButton(width: 120,textColor:AppUI.mainColor ,color: AppUI.secondColor,text: "cancel".tr() , radius: 20 ,onPressed: () {
                        Navigator.pop(context, true); 
                      },),
                    ],
                  ),
                ),
                SizedBox(height: 30,),
                ],

                ),));
  }
}

class CustomDateTimeFormField extends StatelessWidget {
  final String? label ;
  final Function(DateTime)? onDateSelected ;
  const CustomDateTimeFormField({Key? key , required this.label , required this.onDateSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  DateTimeFormField(
          decoration:  InputDecoration(
          labelStyle: TextStyle(color: Color(0xFF006AD8)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: AppUI.errorColor)),
            enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: AppUI.shimmerColor)),
          suffixIcon: Icon(Icons.event_note),
          labelText: label,
         ),
          mode: DateTimeFieldPickerMode.date,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          initialEntryMode:DatePickerEntryMode.calendarOnly,
          validator: (e) => (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
          onDateSelected:onDateSelected,
        );
    
  }
}
class CustomButton extends StatelessWidget {
  final Color? color;
  final int radius;
  final String text;
  final Color? textColor,borderColor;
  final Function()? onPressed;
  final double? width,height;
  final Widget? child;
  final double fontSize;
  const CustomButton({Key? key,required this.text,this.onPressed,this.color,this.borderColor,this.radius = 8,this.textColor = Colors.white,this.width,this.child,this.height , this.fontSize = 16}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
          width: width,
          padding: EdgeInsets.symmetric(vertical: height??AppUtil.responsiveHeight(context)*0.016,horizontal: 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(double.parse("$radius")),
            color: color??AppUI.mainColor,
            border: borderColor==null?null:Border.all(color: borderColor!)
          ),
          alignment: Alignment.center,
          // width!=null?Alignment.center:null,
          child: child??CustomText(text: text, fontSize: fontSize,fontWeight: FontWeight.w600,color: textColor,)),
    );
  }
}

class CustomQrImage extends StatelessWidget {
  final String data;
  final double size;
  const CustomQrImage({Key? key , required this.data ,required this.size}) : super(key: key);
   
  @override
  Widget build(BuildContext context) {
    return  QrImage(
     data: data,
    version: QrVersions.auto,
    size: size,
);
  }
}
class CustomCard extends StatelessWidget {
  final Widget child;
  final double? height,width,radius,paddingHorizontal,paddingVertical;
  final Color? color;
  final double? elevation;
  final Color? border;
  final Function()? onTap;
  const CustomCard({Key? key,required this.child,this.height,this.width,this.paddingHorizontal=15,this.paddingVertical=7,this.color,this.elevation,this.border,this.onTap,this.radius}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius??15)
        ),
        elevation: elevation??7,
        child: Container(
          padding:  EdgeInsets.symmetric(horizontal: paddingHorizontal!,vertical: paddingVertical!),
          width: width==null?double.infinity:width==0?null:width,
          height: height,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius??15),
            border: border!=null?Border.all(color: border!):null,
            color: color??AppUI.whiteColor,
          ),
          child: child,
        ),
      ),
    );
  }
}
class SelectLocationContainer extends StatelessWidget {
  const SelectLocationContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
          decoration: BoxDecoration(
          color: AppUI.whiteColor,
          border: Border.all(color: AppUI.shimmerColor),
          borderRadius: BorderRadius.circular(8),),
          padding: EdgeInsets.all(8),
          child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
          Image.asset('${AppUI.imgPath}Mask Group 507.png',width: 24,height: 24,),
          SizedBox(width: 10,),
          Expanded(child: 
          CustomText(text: "Select your location".tr() , color: AppUI.blackColor, fontSize: 12,),),
          SizedBox(width: 10,),
          Image.asset('${AppUI.imgPath}AarrowE.png',width: 16,height: 16,),
         ],),);
  }
}
class  CustomAarrowContainer extends StatelessWidget {
  final String? title ;
  const CustomAarrowContainer({Key? key , required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
          decoration: BoxDecoration(
          color: AppUI.whiteColor,
          border: Border.all(color: AppUI.shimmerColor),
          borderRadius: BorderRadius.circular(8),),
          padding: EdgeInsets.all(8),
          child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
          Expanded(child: 
          CustomText(text: title?.tr() , color: AppUI.blackColor, fontSize: 12,),),
          SizedBox(width: 10,),
          Image.asset('${AppUI.imgPath}AarrowE.png',width: 16,height: 16,),
         ],),);
  }
}
class CustomeCompanyData extends StatelessWidget {
  final String? mainTitel;
  final String? subTitel;
  const CustomeCompanyData({Key? key , required this.mainTitel ,  this.subTitel }) : super(key: key);

  @override
  Widget build(BuildContext context) {
        return  Container(
          padding: EdgeInsets.all(4),
          margin:EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: AppUI.whiteColor,
    borderRadius: BorderRadius.circular(10),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withAlpha(100),
        blurRadius: 0.5, 
        spreadRadius: 0.5, 
        offset: Offset(
          0.5, 
          0.5,
        ),
      )
    ],
),
          child: Padding(
           padding: const EdgeInsets.all(8.0),
           child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              
              Image.asset('${AppUI.imgPath}Mask Group 377.png',width: 32,height: 32,),
              SizedBox(width: 15,),
              Expanded(
      child:
              Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: 
              [ 
               CustomText(text: mainTitel?.tr() , color: AppUI.blackColor , fontSize: 12,),
               SizedBox(height: 5,),
               CustomText(text: subTitel?.tr() ?? "Click to shoot or upload photos".tr() , color: AppUI.greyColor , fontSize: 10,)],))
            ],),
         ),);
  }
}


class CustomDropdownButtonFormField extends StatelessWidget {
  final String? label ;
  final List<DropdownMenuItem<String>>? items ;
  final Function(String?)? onChanged;
  const CustomDropdownButtonFormField({Key? key , required this.label , required this.items , required this.onChanged }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  DropdownButtonFormField(
            icon: Icon(Icons.keyboard_arrow_down_sharp),
            onChanged: onChanged,
            decoration: InputDecoration(
            border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: AppUI.mainColor)),
            enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: AppUI.shimmerColor)),
            labelText: label,
            labelStyle: TextStyle(color: AppUI.mainColor)
            ),
            items: items
            // [
            //   DropdownMenuItem(
            //     child: Text(
            //       "M",
            //     ),
            //     value: "MALE",
            //   ),
            //   DropdownMenuItem(
            //     child: Text(
            //       "Female",
            //     ),
            //     value: "F",
            //   ),
            // ],
          );
  }
}
class CustomInput extends StatelessWidget {
  final String? hint,lable ;
  final TextEditingController controller;
  final TextInputType textInputType;
  final Function()? onTap;
  final Function(String? v)? onChange,onFieldSubmitted;
  final bool obscureText,readOnly,autofocus,validation;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final int? maxLines , maxLength;
  final double radius;
  final TextAlign? textAlign;
  final Color? borderColor,fillColor;
  final bool border;
  final double fontSize;
  final String? initialValue;
  const CustomInput({Key? key,required this.controller,this.onFieldSubmitted,this.hint,this.lable,required this.textInputType,this.obscureText = false,this.prefixIcon,this.suffixIcon,this.onTap,this.onChange,this.maxLines,this.textAlign,this.readOnly = false,this.autofocus = false,this.radius = 8.0,this.maxLength,this.validation=true,this.borderColor,this.fillColor,this.border = false , this.fontSize = 14 , this.initialValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
     
      onTap: onTap,
      readOnly: readOnly,
      onFieldSubmitted: onFieldSubmitted,
      // maxLength: maxLength,
      textAlign: textAlign!=null?textAlign!:AppUtil.rtlDirection(context)?TextAlign.right:TextAlign.left,
      onChanged: onChange,
      validator: validation?(v){
        if(v!.isEmpty) {
          return "fieldRequired".tr();
        }
        return null;
      }:null,
      autofocus: autofocus,
      maxLines: maxLines??1,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: AppUI.greyColor , fontSize: fontSize),
        suffixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: suffixIcon,
        ),
        labelText: lable,
        labelStyle: TextStyle(color: AppUI.mainColor , fontSize: fontSize),
        filled: true,
        fillColor: fillColor??AppUI.whiteColor,
        suffixIconConstraints: const BoxConstraints(
            minWidth: 63
        ),
        prefixIcon: prefixIcon,
        contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: AppUtil.responsiveHeight(context)*0.0153),
        border: border?OutlineInputBorder(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(radius),bottomLeft: Radius.circular(radius),bottomRight: Radius.circular(radius),topRight: Radius.circular(radius) ),
            borderSide: BorderSide(color: borderColor??AppUI.mainColor),
        ):null,
        disabledBorder: border?OutlineInputBorder(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(radius),bottomLeft: Radius.circular(radius),bottomRight: Radius.circular(radius),topRight: Radius.circular(radius)),
            borderSide: BorderSide(color: borderColor??AppUI.mainColor)
        ):null,
        enabledBorder: border?OutlineInputBorder(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(radius),bottomLeft: Radius.circular(radius),bottomRight: Radius.circular(radius),topRight: Radius.circular(radius)),
            borderSide: BorderSide(color: borderColor??AppUI.mainColor)
        ):OutlineInputBorder(
          borderSide: BorderSide(color: AppUI.shimmerColor),
          borderRadius: BorderRadius.circular(radius)
        ),
        focusedBorder: border?OutlineInputBorder(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(radius),bottomLeft: Radius.circular(radius),bottomRight: Radius.circular(radius)),
            borderSide: BorderSide(color: borderColor??AppUI.blackColor)
        ):OutlineInputBorder(
          borderSide: BorderSide(color: AppUI.mainColor),
           borderRadius: BorderRadius.circular(radius)
        ),

      ),
    );
  }
}

class DoctorCard extends StatelessWidget {
  final Function()? onTap;
  final String? offer;
  final dynamic doctorData;
  const DoctorCard({Key? key,this.onTap,this.offer, this.doctorData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap??(){
        // AppUtil.mainNavigator(context, const DoctorDetailsScreen());
      },
      child: CustomCard(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: CachedNetworkImage(
                      imageUrl: "https://top10cairo.com/wp-content/uploads/2015/12/best-burger-restaurant-places-in-cairo.jpg",
                      //  doctorData!.profilePhoto!,
                      placeholder: (context, url) => Image.asset("${AppUI.imgPath}profile.png",height: 100,),
                      errorWidget: (context, url, error) => Image.asset("${AppUI.imgPath}profile.png",height: 100,),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  if(doctorData!.isOffer==1)
                    CustomButton(text: doctorData!.offerTitle!,borderColor: AppUI.offerColor,width: AppUtil.responsiveWidth(context)*0.3,height: 4,color: AppUI.whiteColor,textColor: AppUI.offerColor,)
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(height: 10,),
                  CustomText(text: doctorData!.clinicName== ""? "عيادة الأمل للعلاج الطبيعي":doctorData!.clinicName,fontWeight: FontWeight.bold,color: AppUI.blackColor,),
                  CustomText(text: doctorData!.name,fontWeight: FontWeight.bold,color: AppUI.blackColor),
                  CustomText(text: doctorData!.specialties!.isEmpty?"علاج طبيعي لحالات الأعصاب":doctorData!.specialties![0].title,color: AppUI.iconColor,),
                  Row(
                    children: [
                      CustomText(text: "(${doctorData!.clinicReviewsCount.toString()})",color: AppUI.iconColor,),
                      const SizedBox(width: 15,),
                      RatingBar(
                        initialRating: double.parse(doctorData!.rate!),
                        minRating: 1,
                        ignoreGestures: true,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 25,
                        unratedColor: AppUI.iconColor,
                        onRatingUpdate: (rating) {

                        }, ratingWidget: RatingWidget(
                          empty: const Icon(Icons.star_border,size: 30,color: Colors.amber,),
                        half: const Directionality(textDirection: ui.TextDirection.ltr,
                        child: Icon(Icons.star_half,size: 30,color: Colors.amber,)),
                        full: const Icon(Icons.star,size: 30,color: Colors.amber,)
                      ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}


class DoctorCardSimmer extends StatelessWidget {

  const DoctorCardSimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset("${AppUI.imgPath}profile.png",height: 100,),
              ),
              const SizedBox(height: 10,),
              // if(offer==null)
              CustomButton(text: "          ",borderColor: AppUI.offerColor,width: AppUtil.responsiveWidth(context)*0.3,height: 4,color: AppUI.whiteColor,textColor: AppUI.offerColor,)
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(width: AppUtil.responsiveWidth(context)*0.3,height: 15,color: AppUI.shimmerColor,),
              const SizedBox(height: 20,),
              Container(width: AppUtil.responsiveWidth(context)*0.35,height: 15,color: AppUI.shimmerColor,),
              const SizedBox(height: 20,),
              Container(width: AppUtil.responsiveWidth(context)*0.3,height: 15,color: AppUI.shimmerColor,),
              const SizedBox(height: 20,),
              Row(
                children: [
                  CustomText(text: "(100)",color: AppUI.iconColor,),
                  const SizedBox(width: 15,),
                  RatingBar(
                    initialRating: 3.5,
                    minRating: 1,
                    ignoreGestures: true,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 25,
                    unratedColor: AppUI.iconColor,
                    onRatingUpdate: (rating) {

                    }, ratingWidget: RatingWidget(
                      empty: const Icon(Icons.star_border,size: 30,color: Colors.amber,),
                    half: const Directionality(textDirection: ui.TextDirection.ltr,
                    child: Icon(Icons.star_half,size: 30,color: Colors.amber,)),
                    full: const Icon(Icons.star,size: 30,color: Colors.amber,)
                  ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

}


class ErrorFetchWidget extends StatelessWidget {
  const ErrorFetchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomText(text: "errorFetch".tr(),fontSize: 18,),
    );
  }
}

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomText(text: "noDataAvailable".tr(),fontSize: 18,),
    );
  }
}

// class ProductCard extends StatelessWidget {
//   final String? type,buttonText;
//   final Products? products;
//   final Function()? onFavTap,onAddToCart;
//   const ProductCard({Key? key,this.type = "grid",this.buttonText,this.products,this.onFavTap,this.onAddToCart}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: (){
//         AppUtil.mainNavigator(context, ProductDetailsScreen(product: products!,));
//       },
//       child: Container(
//         decoration: BoxDecoration(
//           border: Border.all(color: AppUI.shimmerColor,)
//         ),
//         child: type=="grid"?Column(
//           children: [
//             Expanded(
//               flex: 3,
//               child: CachedNetworkImage(imageUrl:products==null?"": products!.thumb!,height: 85,fit: BoxFit.fill,placeholder: (context, url) => Image.asset("${AppUI.imgPath}perfume.jpg",height: 85,fit: BoxFit.fill,),
//                 errorWidget: (context, url, error) => Image.asset("${AppUI.imgPath}perfume.jpg",height: 85,fit: BoxFit.fill,),),
//             ),
//             Expanded(
//               flex: 5,
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 3),
//                 child: Column(
//                   children: [
//                     Expanded(child: CustomText(text: products==null?"": products!.name!.length<20 ? products!.name : products!.name!.substring(0,20),color: AppUI.iconColor,)),
//                     const SizedBox(height: 6,),
//                     Expanded(
//                       flex: 2,
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Row(
//                             children: [
//                               CustomText(text: products==null?"": products!.price,color: AppUI.iconColor,textDecoration: TextDecoration.lineThrough,),
//                               const Spacer(),
//                               RatingBar(
//                                 initialRating: double.parse(products==null?"0.0": products!.rating.toString()),
//                                 direction: Axis.horizontal,
//                                 allowHalfRating: true,
//                                 itemCount: 5,
//                                 itemSize: 15,
//                                 ratingWidget: RatingWidget(
//                                   full: Icon(Icons.star,color: AppUI.offerColor,),
//                                   half: Icon(Icons.star_half,color: AppUI.offerColor,),
//                                   empty: Icon(Icons.star_border,color: AppUI.offerColor,),
//                                 ),
//                                 itemPadding: const EdgeInsets.symmetric(horizontal: 0),
//                                 onRatingUpdate: (rating) {},
//                               ),
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               CustomText(text: products==null?"": products!.price,color: AppUI.blackColor,),
//                               const Spacer(),
//                               InkWell(
//                                 onTap: onFavTap,
//                                   child: Icon(Icons.favorite,color: products==null?Colors.grey: products!.fav!?AppUI.errorColor:Colors.grey,))
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 10,),
//                     Expanded(
//                       flex: 2,
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             CustomButton(text: buttonText??"addToCart".tr(),color: AppUI.blackColor,height: 6,width: double.infinity,radius: 5,onPressed: onAddToCart,),
//                           ],
//                         ))
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ):Row(
//           children: [
//             Expanded(
//               flex: 2,
//               child: CachedNetworkImage(imageUrl: products!.thumb!,placeholder: (context, url) => Image.asset("${AppUI.imgPath}perfume.jpg",height: 170,fit: BoxFit.fill,),
//                 errorWidget: (context, url, error) => Image.asset("${AppUI.imgPath}perfume.jpg",height: 170,fit: BoxFit.fill,),),
//             ),
//             Expanded(
//               flex: 5,
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 3),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     CustomText(text: products!.name,color: AppUI.iconColor,),
//                     const SizedBox(height: 10,),
//                     Column(
//                       children: [
//                         Row(
//                           children: [
//                             CustomText(text: products!.price,color: AppUI.iconColor,textDecoration: TextDecoration.lineThrough,),
//                             const Spacer(),
//                             RatingBar(
//                               initialRating: double.parse(products!.rating.toString()),
//                               direction: Axis.horizontal,
//                               allowHalfRating: true,
//                               itemCount: 5,
//                               itemSize: 15,
//                               ratingWidget: RatingWidget(
//                                 full: Icon(Icons.star,color: AppUI.offerColor,),
//                                 half: Icon(Icons.star_half,color: AppUI.offerColor,),
//                                 empty: Icon(Icons.star_border,color: AppUI.offerColor,),
//                               ),
//                               itemPadding: const EdgeInsets.symmetric(horizontal: 0),
//                               onRatingUpdate: (rating) {},
//                             ),
//                           ],
//                         ),
//                         Row(
//                           children: [
//                             CustomText(text: products!.price,color: AppUI.blackColor,),
//                             const Spacer(),
//                             InkWell(
//                               onTap: onFavTap,
//                                 child: Icon(Icons.favorite,color:  products!.fav!?AppUI.errorColor:Colors.grey,))
//                           ],
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 10,),
//                     CustomButton(text: "addToCart".tr(),color: AppUI.blackColor,height: 6,width: double.infinity,radius: 5,onPressed: onAddToCart,)
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class WishlistCard extends StatelessWidget {
//   final Products product;
//   final Function()? onRemove,onAddToCart;
//   const WishlistCard({Key? key, required this.product, this.onRemove,this.onAddToCart}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           children: [
//             Expanded(
//               flex: 3,
//               child: CachedNetworkImage(imageUrl: "",placeholder: (context, url) => Image.asset("${AppUI.imgPath}perfume.jpg",height: 130,fit: BoxFit.fill,),
//                 errorWidget: (context, url, error) => Image.asset("${AppUI.imgPath}perfume.jpg",height: 130,fit: BoxFit.fill,),),
//             ),
//             const SizedBox(width: 7,),
//             Expanded(
//               flex: 6,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const SizedBox(height: 5,),
//                   CustomText(text: "Product Name",color: AppUI.blackColor,fontSize: 18,),
//                   const SizedBox(height: 15,),
//                   CustomText(text: "In Stock",color: AppUI.iconColor,),
//                   const SizedBox(height: 5,),
//                   Row(
//                     children: [
//                       CustomText(text: "${"price".tr()} : ",color: AppUI.iconColor,fontSize: 18,),
//                       CustomText(text: "210.00SAR",color: AppUI.iconColor,textDecoration: TextDecoration.lineThrough,),
//                       const SizedBox(width: 3,),
//                       CustomText(text: "115.00SAR",color: AppUI.activeColor,fontSize: 18,),
//                     ],
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//         SizedBox(height:1,child: Divider(thickness: 1,color: AppUI.greyColor,)),
//         SizedBox(
//           height: 45,
//           child: Row(
//             children: [
//               Expanded(
//                 child: InkWell(
//                   onTap: onRemove,
//                   child: Row(
//                     children: [
//                       Icon(Icons.delete,color: AppUI.greyColor,),
//                       const SizedBox(width: 7,),
//                       CustomText(text: "remove".tr(),color: AppUI.greyColor,)
//                     ],
//                   ),
//                 ),
//               ),
//               Container(
//                 height: 55,width: 1,color: AppUI.greyColor,
//               ),
//               const SizedBox(width: 7,),
//               Expanded(
//                 child: InkWell(
//                   onTap: onAddToCart,
//                   child: Row(
//                     children: [
//                       Icon(Icons.shopping_cart,color: AppUI.greyColor,),
//                       const SizedBox(width: 7,),
//                       CustomText(text: "addToCart".tr(),color: AppUI.greyColor,)
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         SizedBox(height:1,child: Divider(thickness: 1,color: AppUI.greyColor,)),
//       ],
//     );
//   }
// }

// class CartCard extends StatelessWidget {
//   final Function()? onIncrement,onDecrement,onFav,onRemove;
//   final int? qty;
//   final CustomerCart? product;
//   const CartCard({Key? key,this.onIncrement,this.onDecrement,this.qty,this.product,this.onFav,this.onRemove}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           children: [
//             Expanded(
//               flex: 3,
//               child: CachedNetworkImage(imageUrl: product!.productId!.image!,placeholder: (context, url) => Image.asset("${AppUI.imgPath}perfume.jpg",height: 180,fit: BoxFit.fill,),
//                 errorWidget: (context, url, error) => Image.asset("${AppUI.imgPath}perfume.jpg",height: 180,fit: BoxFit.fill,),),
//             ),
//             const SizedBox(width: 7,),
//             Expanded(
//               flex: 6,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const SizedBox(height: 5,),
//                   CustomText(text: product!.productId!.name??"",color: AppUI.blackColor,fontSize: 18,),
//                   const SizedBox(height: 10,),
//                   CustomText(text: product!.productId!.stockStatus,color: AppUI.iconColor,),
//                   const SizedBox(height: 5,),
//                   Row(
//                     children: [
//                       CustomText(text: "${"price".tr()} : ",color: AppUI.iconColor,fontSize: 18,),
//                       // if(product!.productId!.)
//                       // CustomText(text: "${product!.productId!.price} SAR",color: AppUI.iconColor,textDecoration: TextDecoration.lineThrough,),
//                       const SizedBox(width: 3,),
//                       CustomText(text: "${product!.productId!.price} SAR",color: AppUI.activeColor,fontSize: 18,),
//                     ],
//                   ),

//                   Row(
//                     children: [
//                       CustomText(text: "${"total".tr()} : ",color: AppUI.iconColor,fontSize: 18,),
//                       // CustomText(text: "${product!.productId!.price} SAR",color: AppUI.iconColor,textDecoration: TextDecoration.lineThrough,),
//                       const SizedBox(width: 3,),
//                       CustomText(text: "${double.parse(product!.productId!.price!)*qty!} SAR",color: AppUI.activeColor,fontSize: 18,),
//                     ],
//                   ),
//                   const SizedBox(height: 5,),
//                   Row(
//                     children: [
//                       InkWell(
//                         onTap: onDecrement,
//                         child: Container(
//                           height: 30,width: 30,
//                           color: AppUI.greyColor,
//                           alignment: Alignment.center,
//                           child: Icon(Icons.remove,color: AppUI.whiteColor,),
//                         ),
//                       ),
//                       const SizedBox(width: 7,),
//                       CustomText(text: "$qty",color: AppUI.activeColor,),
//                       const SizedBox(width: 7,),
//                       InkWell(
//                         onTap: onIncrement,
//                         child: Container(
//                           height: 30,width: 30,
//                           color: AppUI.greyColor,
//                           alignment: Alignment.center,
//                           child: Icon(Icons.add,color: AppUI.whiteColor,),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 5,),
//                 ],
//               ),
//             )
//           ],
//         ),
//         if(onRemove!=null)
//           SizedBox(height:1,child: Divider(thickness: 1,color: AppUI.greyColor,)),
//         if(onRemove!=null)
//         SizedBox(
//           height: 45,
//           child: Row(
//             children: [
//               Expanded(
//                 child: InkWell(
//                   onTap: onRemove,
//                   child: Row(
//                     children: [
//                       Icon(Icons.delete,color: AppUI.greyColor,),
//                       const SizedBox(width: 7,),
//                       CustomText(text: "remove".tr(),color: AppUI.greyColor,)
//                     ],
//                   ),
//                 ),
//               ),
//               Container(
//                 height: 55,width: 1,color: AppUI.greyColor,
//               ),
//               const SizedBox(width: 7,),
//               Expanded(
//                 child: InkWell(
//                   onTap: onFav,
//                   child: Row(
//                     children: [
//                       Icon(Icons.favorite,color: product!.productId!.fav! ? AppUI.errorColor : AppUI.greyColor,),
//                       const SizedBox(width: 7,),
//                       CustomText(text: "addToWishlist".tr(),color: AppUI.greyColor,)
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//           SizedBox(height:1,child: Divider(thickness: 1,color: AppUI.greyColor,)),
//       ],
//     );
//   }
// }

// class AddressBookCard extends StatelessWidget {
//   final CustomerAddress address;
//   final Function() onRemove;
//   const AddressBookCard({Key? key,required this.address,required this.onRemove}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               CustomText(text: address.firstname,color: AppUI.greyColor,),
//               // CustomText(text: address!.,color: AppUI.greyColor,),
//               CustomText(text: address.city,color: AppUI.greyColor,),
//               CustomText(text: address.countryId,color: AppUI.greyColor,),
//               CustomText(text: "${"phoneNumber".tr()}: ${address.address1}",color: AppUI.greyColor,),
//             ],
//           ),
//         ),
//         Divider(thickness: 1,color: AppUI.greyColor,),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             CustomButton(text: "edit".tr(),width: 80,borderColor: AppUI.mainColor,color: AppUI.whiteColor,textColor: AppUI.mainColor,height: 3,radius: 10,onPressed: (){
//               AppUtil.mainNavigator(context, EditAddressBook(address: address,));
//             },),
//             const SizedBox(width: 6,),
//             CustomButton(text: "remove".tr(),width: 80,borderColor: AppUI.mainColor,color: AppUI.whiteColor,textColor: AppUI.mainColor,height: 3,radius: 10,onPressed: onRemove,),
//           ],
//         ),
//         Divider(thickness: 1,color: AppUI.greyColor,),
//       ],
//     );
//   }
// }

// class BillingCard extends StatelessWidget {
//   final bool billing;
//   final CustomerAddress? address;
//   final bool? selectedAddress;
//   final Function(bool? v)? onChange;
//   const BillingCard({Key? key, this.billing = false,this.address,this.selectedAddress,this.onChange}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         CustomCard(
//           radius: 0,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       children: [
//                         CustomText(text: billing?"billingAddress".tr():"shippingAddress".tr(),fontSize: 22,fontWeight: FontWeight.w600,),
//                         const Spacer(),
//                         Checkbox(value: selectedAddress, onChanged: onChange!)
//                       ],
//                     ),
//                     const Divider(),
//                     CustomText(text: address!.firstname,color: AppUI.greyColor,),
//                     // CustomText(text: address!.,color: AppUI.greyColor,),
//                     CustomText(text: address!.city,color: AppUI.greyColor,),
//                     CustomText(text: address!.countryId,color: AppUI.greyColor,),
//                     CustomText(text: "${"phoneNumber".tr()}: ${address!.address1}",color: AppUI.greyColor,),
//                   ],
//                 ),
//               ),
//               Divider(thickness: 1,color: AppUI.greyColor,),
//               InkWell(
//                 onTap: (){
//                   AppUtil.mainNavigator(context, const AddressBookScreen());
//                 },
//                   child: CustomText(text: "editAddress".tr())),
//               Divider(thickness: 1,color: AppUI.greyColor,),
//             ],
//           ),
//         ),
//         // if(billing)
//         // Container(
//         //   color: AppUI.whiteColor,
//         //   margin: const EdgeInsets.symmetric(horizontal: 5),
//         //   child: Row(
//         //     children: [
//         //       Checkbox(value: false, onChanged: (v){}),
//         //       CustomText(text: "shipToAddress".tr())
//         //     ],
//         //   ),
//         // )
//       ],
//     );
//   }
// }

// class ShippingMethodCard extends StatelessWidget {
//   final ShippingMethods shippingMethod;
//   final int index,shippingValue;
//   final Function(int? v)? onChange;
//   const ShippingMethodCard({Key? key, required this.shippingMethod,required this.index,required this.shippingValue,this.onChange}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return CustomCard(
//       radius: 0,
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 Expanded(
//                   flex: 4,
//                   child: Row(
//                     children: [
//                       Radio(value: index, groupValue: shippingValue, onChanged: onChange,activeColor: AppUI.mainColor,),
//                       const SizedBox(width: 5,),
//                       CustomText(text: shippingMethod.type,color: AppUI.blackColor,),
//                       const SizedBox(width: 15,),
//                     ],
//                   ),
//                 ),
//                 // CustomText(text: "90.00SAR",color: AppUI.greyColor,fontSize: 16,),
//               ],
//             ),
//             // const SizedBox(height: 15,),
//             // SizedBox(height:50,child: CustomInput(controller: TextEditingController(), textInputType: TextInputType.text,hint: "comment".tr(),borderColor: AppUI.shimmerColor,radius: 6,))
//           ],
//         ),
//       ),
//     );
//   }
// }

// class PaymentMethodCard extends StatelessWidget {
//   final PaymentMethods paymentMethods;
//   final int index,paymentValue;
//   final Function(int? v)? onChange;
//   const PaymentMethodCard({Key? key,required this.paymentValue,required this.index,required this.paymentMethods,this.onChange}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return CustomCard(
//       radius: 0,
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // CustomText(text: "selectPaymentMethod".tr(),color: AppUI.greyColor,fontSize: 16,),
//             Row(
//               children: [
//                 Radio(value: 0, groupValue: 0, onChanged: onChange,activeColor: AppUI.mainColor,),
//                 const SizedBox(width: 5,),
//                 CustomText(text: paymentMethods.type,color: AppUI.blackColor,),
//               ],
//             ),
//             // const SizedBox(height: 15,),
//             // SizedBox(height:50,child: CustomInput(controller: TextEditingController(), textInputType: TextInputType.text,hint: "comment".tr(),borderColor: AppUI.shimmerColor,radius: 6,)),
//             // const SizedBox(height: 10,),
//             // Row(
//             //   children: [
//             //     Checkbox(value: true, onChanged: (v){
//             //
//             //     },activeColor: AppUI.mainColor,),
//             //     CustomText(text: "agree".tr(),color: AppUI.iconColor,),
//             //     const SizedBox(width: 3,),
//             //     CustomText(text: "privacy".tr(),fontWeight: FontWeight.w600,textDecoration: TextDecoration.underline,),
//             //   ],
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }
