import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared/components.dart';
import '../../../utilities/app_ui.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  customAppBar(title: "notification".tr() , centerTitle: true , elevation: 0.5),
        
      body:  Padding(padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            
            child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return  Divider(
                        color: AppUI.shimmerColor.withOpacity(0),
                        thickness: 0,
                      );
                    },
                    scrollDirection: Axis.vertical,
                    itemCount: 20,
                    itemBuilder: (context, count) {
                      return Padding(padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                      child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset("${AppUI.imgPath}Coffe.png",width: 40,height: 40,),
                          SizedBox(width: 10,),
                          Expanded(child: 
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Text('${cubit.notifications![count].body}'),
                                  // Text('${cubit.notifications![count].date} ${cubit.notifications![count].time}'),
                                CustomText(text: "Text" , color:  AppUI.blackColor,),
                                SizedBox(height: 5,),
                                CustomText(text: "Text"   , color: AppUI.greyColor,),
                              ],),
                               CustomText(text: "Text"   , color: AppUI.greyColor,fontSize: 10,),
                            ],
                          )),
                         

                      ]),);

                    })
            )
          ,
    );
  }
}