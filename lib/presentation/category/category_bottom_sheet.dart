// CategoryBottomSheet
import 'package:adelco_user/presentation/home/widget/category_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../bloc/product/product_cubit.dart';
import '../../shared/components.dart';
import '../../utilities/app_ui.dart';
import '../../utilities/app_util.dart';

class CategoryBottomSheet extends StatefulWidget {
  const CategoryBottomSheet({Key? key}) : super(key: key);

  @override
  State<CategoryBottomSheet> createState() => _CategoryBottomSheetState();
}

class _CategoryBottomSheetState extends State<CategoryBottomSheet> {
  @override
  Widget build(BuildContext context) {
    final cubit = ProductCubit.get(context);
    return SizedBox(
                height: AppUtil.responsiveHeight(context)*0.9,
                child: Scaffold(
                backgroundColor: Colors.transparent,
                  appBar: AppBar(
                   backgroundColor: Colors.transparent,
                   centerTitle: true,
                  title: CustomText(text: "Category".tr() , color: AppUI.blackColor , fontSize: 20,), 
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
      body: Padding(
        padding: const EdgeInsets.only(top: 20 , left: 20 , right:  20 ,bottom: 0),
        child: GridView.builder(
                  shrinkWrap: true ,
                  primary: false ,
                  itemCount: cubit.categoryModel?.category?.length ?? 0,
                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                   crossAxisCount: 3,
                   crossAxisSpacing : 0 ,
                   mainAxisSpacing: 0 ,
                   childAspectRatio  : 1/1.2
             ), itemBuilder: (BuildContext context, int index) { 
              return InkWell(
                onTap: () {
                cubit.getSubCategory(cubit.categoryModel?.category?[index].id ?? 0);
                cubit.products(1, "${cubit.categoryModel?.category?[index].id}" , null, null, null);
                Navigator.pop(context, true); 
                },

                       child: CategoryWidget(data: cubit.categoryModel?.category?[index],)
                       
                      //  Column(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   crossAxisAlignment: CrossAxisAlignment.center,
                      //   children: [
                      //     Container(
                      //        decoration: BoxDecoration(
                      //       color: AppUI.backgroundColor,
                      //       shape: BoxShape.circle
                      //       ),
                      //       child: Row(
                      //         mainAxisAlignment: MainAxisAlignment.center,
                      //         children: [
                      //         Padding(
                      //           padding: const EdgeInsets.all(8.0),
                      //           child: Image.asset("${AppUI.imgPath}Coffe.png",height: 50,width: 50),
                      //         ),
                      //         ],
                      //       ),
                      //     ),
                      //     SizedBox(height: 10,),
                      //     Column(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: [
                      //         CustomText(text: "text" ,fontSize: 12, color: AppUI.blackColor,),
                      //          SizedBox(height: 5,),
                      //       ],
                      //     )
                      //   ],
                      //  ),

              );
              },
              ),
      ),
    ));
  }
}