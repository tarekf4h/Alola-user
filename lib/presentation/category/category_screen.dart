import 'package:adelco_user/utilities/app_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../shared/components.dart';
import '../../utilities/app_ui.dart';
import '../home/products_screen.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "Category" , centerTitle: true,elevation: 0.5),
      body: Padding(
        padding: const EdgeInsets.only(top: 20 , left: 20 , right:  20 ,bottom: 0),
        child: GridView.builder(
                  shrinkWrap: true ,
                  primary: false ,
                  itemCount: 17,
                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                   crossAxisCount: 3,
                   crossAxisSpacing : 0 ,
                   mainAxisSpacing: 0 ,
                   childAspectRatio  : 1/1.2
             ), itemBuilder: (BuildContext context, int index) { 
              return InkWell(
                onTap: () {
                  // BottomNavCubit.get(context).setWarehouseIndex(1);
                  AppUtil.mainNavigator(context, ProductsScreen());
                },

                       child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                             decoration: BoxDecoration(
                            color: AppUI.backgroundColor,
                            shape: BoxShape.circle
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset("${AppUI.imgPath}Coffe.png",height: 50,width: 50),
                              ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(text: "text" ,fontSize: 12, color: AppUI.blackColor,),
                               SizedBox(height: 5,),
                            ],
                          )
                        ],
                       ),

              );
              },
              ),
      ),
    );
  }
}