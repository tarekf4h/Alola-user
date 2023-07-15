import 'package:adelco_user/utilities/app_ui.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../bloc/auth/auth_cubit.dart';
import '../../shared/components.dart';

class SocialScreen extends StatefulWidget {
  const SocialScreen({Key? key}) : super(key: key);

  @override
  State<SocialScreen> createState() => _SocialScreenState();
}

class _SocialScreenState extends State<SocialScreen> {
  @override
  Widget build(BuildContext context) {
    final cubit = AuthCubit.get(context);
    return Scaffold(
    appBar: customAppBar(title: "Social media accounts".tr() , centerTitle: true , elevation: 0.5),
    body: Padding(padding: EdgeInsets.symmetric(horizontal: 20 , vertical: 20),
    child: Column(children: [
      CustomText(text: "You can contact us through:You can contact us through:".tr() ,color: AppUI.blackColor,fontSize: 18,),
      SizedBox(height: 30,),
      Center(child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         InkWell(child:  Image.asset(
                     '${AppUI.imgPath}facebook.png',
                     width: 50,
                     height: 50,),
                     onTap: () {
                      for(var item in cubit.socialMediaModel?.data ?? []){
                        if(item?.key == "facebook_link"){
                        var url = item?.value ??  "https://www.facebook.com/";
                        if(!url.contains("https")) {
                        launchUrl(Uri.parse("https://www.facebook.com/"));
                        }else{
                        launchUrl(Uri.parse("$url"));
                        }
                        }

                      }

                     },
         ),
                     SizedBox(width: 20,),
                    InkWell(child:  Image.asset(
                     '${AppUI.imgPath}twitter.png',
                     width: 50,
                     height: 50,),
                     onTap: () {
                        for(var item in cubit.socialMediaModel?.data ?? []){
                        if(item?.key == "twitter_link"){
                        var url = item?.value ??  "https://twitter.com/";
                        if(!url.contains("https")) {
                        launchUrl(Uri.parse("https://twitter.com/"));
                        }else{
                        launchUrl(Uri.parse("$url"));
                        }
                        }

                      }
                     },
                    ),
                     SizedBox(width: 20,),
                    InkWell(child:  Image.asset(
                     '${AppUI.imgPath}whatsapp.png',
                     width: 50,
                     height: 50,),
                     onTap: () {
                       for(var item in cubit.socialMediaModel?.data ?? []){
                        if(item?.key == "whats_up_link"){
                        var url = item?.value ??  "https://whatsapp.com/";
                        if(!url.contains("https")) {
                        launchUrl(Uri.parse("https://whatsapp.com/"));
                        }else{
                        launchUrl(Uri.parse("$url"));
                        }
                        }

                      }
                     },
                    )
                     
        ],
      ),)

    ],)
    ,),
    );
  }
}