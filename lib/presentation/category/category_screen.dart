import 'package:adelco_user/utilities/app_util.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../bloc/product/product_cubit.dart';
import '../../shared/components.dart';
import '../../utilities/app_ui.dart';
import '../home/products_screen.dart';
import '../home/widget/category_widget.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    final cubit = ProductCubit.get(context);
    return Scaffold(
      appBar: customAppBar(title: "Category".tr() , centerTitle: true,elevation: 0.5),
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
                 AppUtil.mainNavigator(context, ProductsScreen());
                },
                 child: CategoryWidget(data: cubit.categoryModel?.category?[index],)

              );
              },
              ),
      ),
    );
  }
}