import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';

import '../../main.dart';
import '../../shared/cash_helper.dart';
import '../../shared/components.dart';
import '../../utilities/app_ui.dart';
import '../../utilities/app_util.dart';

class LanguageScreen extends StatefulWidget {
  
  const LanguageScreen({Key? key}) : super(key: key );

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String? lang;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
                height: 260,
                // AppUtil.responsiveHeight(context)*0.33,
                child: Scaffold(
                backgroundColor: Colors.transparent,
                  appBar: AppBar(
                   backgroundColor: Colors.white,
                   centerTitle: true,
                  title: CustomText(text: "Language".tr() , color: AppUI.blackColor , fontSize: 20,), 
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
      body: Container(
        color: AppUI.whiteColor,
        child: Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: 
              ListView.separated(
                          separatorBuilder: (context, index) {
                            return  Divider(
                              color: AppUI.shimmerColor.withOpacity(0),
                              thickness: 0,
                            );
                          },
                          scrollDirection: Axis.vertical,
                          itemCount: 2,
                          itemBuilder: (context, count) {
                            final item = count;
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                        height: 45,
                      decoration: BoxDecoration(
                       color: AppUI.whiteColor,
                       border: Border.all(color: AppUI.shimmerColor),
                       borderRadius: BorderRadius.circular(8),),
                        padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: item == 0 ? "عربي": "English" , color: AppUI.blackColor, fontSize: 12,),
                      Radio(
                        activeColor: AppUI.mainColor,
                          value: "$item", 
                          groupValue: lang, 
                          onChanged: (value){
                            setState(() {
                                lang = value.toString();
                            });
                          },
                      ),              
                
               ],),);
              })),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: CustomButton(text: "Confirm".tr(), onPressed: (() {
                  if (lang == "1") {
                    AppUtil.Lang = "en";
                    print("${AppUtil.Lang} splashhhhhhh2" );
                       CashHelper.setSavedString("lang", "en");
                          context.setLocale(const Locale("en"));
                          Navigator.of(context,rootNavigator: true).pop();
                          AppUtil.removeUntilNavigator(context, const MyApp());

                  }else if (lang == "0"){
                    AppUtil.Lang = "ar";
                    print("${AppUtil.Lang} splashhhhhhh2" );
                       CashHelper.setSavedString("lang", "ar");
                          context.setLocale(const Locale("ar"));
                          Navigator.of(context,rootNavigator: true).pop();
                          AppUtil.removeUntilNavigator(context, const MyApp());
                  }
                }),),
              ),
          ],
        ),
        ),
      ),
    ));
  }
}