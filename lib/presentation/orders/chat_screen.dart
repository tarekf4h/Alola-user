import 'package:adelco_user/utilities/app_util.dart';
import 'package:bubble/bubble.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../shared/components.dart';
import '../../utilities/app_ui.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  static const styleSomebody = BubbleStyle(
    nip: BubbleNip.leftCenter,
    color: Colors.white,
    borderColor: Colors.blue,
    borderWidth: 1,
    elevation: 4,
    margin: BubbleEdges.only(top: 8, right: 50),
    alignment: Alignment.topLeft,
  );
   static const styleMe = BubbleStyle(
    nip: BubbleNip.rightCenter,
    color:  Color(0xff006AD8),
    // borderColor: Colors.blue,
    borderWidth: 1,
    elevation: 4,
    margin: BubbleEdges.only(top: 8, left: 50),
    alignment: Alignment.topRight,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "Name".tr(), elevation: 0.5, centerTitle: true),
      body: Container(
          child: 
          Column(
            children: [
              Expanded(child: 
              ListView.separated(
                        separatorBuilder: (context, index) {
                          return  Divider(
                            color: AppUI.shimmerColor.withOpacity(0),
                            thickness: 0,
                          );
                        },
                        scrollDirection: Axis.vertical,
                        itemCount: 20,
                        itemBuilder: (context, count) {
                          return  
                          
                          Row(
                            children: [
                              if (count%2 != 0)...[
                              Image.asset("${AppUI.imgPath}user.png",width: 50,height: 50,),
                              SizedBox(width: 5,),],
                              Expanded(child: 
                              Bubble(
                                padding: BubbleEdges.all(20),
                                radius: Radius.circular(20),
                    style: count%2 == 0 ? styleMe:styleSomebody,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      CustomText(color: count%2 == 0 ? AppUI.whiteColor : AppUI.blackColor,text: "Message to the customer Message to the customer Message to the customer Message to"),
                      SizedBox(height: 10,),
                      CustomText(fontSize: 10,color: count%2 == 0 ? AppUI.whiteColor : AppUI.blackColor,text: "1:03 pm")

                    ],),
                      ),),
                      if (count%2 == 0)...[
                             SizedBox(width: 5,),
                              Image.asset("${AppUI.imgPath}user.png",width: 50,height: 50,),
                              ],
                            ],
                          );
                    })),
                    Container(
              height: 70,
              width: AppUtil.responsiveWidth(context),
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                 border: Border.all(color: AppUI.shimmerColor ,width: 0.5),
                 ),
                 child: Row(children: [
                  Expanded(child: 
                  CustomInput(radius: 10,controller: TextEditingController(), textInputType: TextInputType.text , hint: "Enter a message...".tr(), )),
                  SizedBox(width: 10,),
                  InkWell(onTap: () {
                    
                  },
                  child:  Image.asset("${AppUI.imgPath}send.png",width: 50,height: 50,),)
                 ],),


            )
            ],
          )

            ),
    );
  }
}