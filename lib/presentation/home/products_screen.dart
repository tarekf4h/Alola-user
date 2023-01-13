import 'package:adelco_user/presentation/category/category_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';

import '../../shared/components.dart';
import '../../utilities/app_ui.dart';
import '../../utilities/app_util.dart';
import '../category/category_bottom_sheet.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  var select = 0 ;
  var selectSeb = -1 ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:customAppBar(
        // leading: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children:[
        //   CustomText(text: "Products".tr() , fontSize: 18.0,color: AppUI.blackColor,fontWeight: FontWeight.w100)],),
        centerTitle: true,
        actions: [Padding(
          padding: const EdgeInsets.only(right: 16 , left: 16),
          child: SvgPicture.asset("${AppUI.iconPath}cart.svg" ,),
        )],
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: SizedBox(
            width: 300, 
            child: CustomInput(suffixIcon:InkWell(onTap: () {
              
            },child:  Image.asset("${AppUI.imgPath}scannerIcon.png",height: 17,width: 25),),prefixIcon:Icon(Icons.search) ,controller: TextEditingController(), textInputType: TextInputType.name , hint: "search".tr() ),
          ),
        )
      ) ,
      body: Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16,),
          SizedBox(
            height: 50,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 20,),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 5, 10),
                    child: InkWell(onTap: () {
                    showModalBottomSheet(
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.only(topLeft: Radius.circular(20) , topRight: Radius.circular(20)),),
            context: context,
            builder: (BuildContext context) {
              return BottomSheet(
                shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.only(topLeft: Radius.circular(20) , topRight: Radius.circular(20)),),
              onClosing: () {},
              builder: (BuildContext context) {
              var type = 0 ;
          return StatefulBuilder(builder: (BuildContext context, StateSetter mystate) {
          return CategoryBottomSheet();
          });});});
                    },
                    child: Image.asset("${AppUI.imgPath}allCatIcon.png",height: 24,width: 24),
                    ),
                  ),
                  SizedBox(width: 10,),
                  SizedBox(
                            width: MediaQuery.of(context).size.width - 160 ,
                            height: 50,
                            child: 
                  ListView.builder(
                              padding: EdgeInsets.zero,
                                shrinkWrap: false,
                                // controller: cubit.productsScrollController,
                                scrollDirection: Axis.horizontal,
                                itemCount: 20  ,
                                itemBuilder: (context, index) {
                                  return Row(
                                    children: [
                                      TextButton(
                                        style: ButtonStyle(
                                          foregroundColor: MaterialStateProperty.all<Color>(
                                              AppUI.blackColor),
                                        ),
                                        onPressed: () {

                                        },
                                        child: InkWell(
                                          onTap: (){
                                            // cubit.selectedBranchCat = cubit.branchCategoriesModel!.data![index];
                                            // cubit.emit(BranchCategoriesLoadedState());
                                            // cubit.pageProducts = 1;
                                            // cubit.branchProducts();
                                            setState(() {
                                              select = index;
                                              print(select);
                                            });
                                            
                                            
                                          },
                                          child: Column(
                                            children: [
                                              CustomText(text: "${"Text"}",color: AppUI.blackColor,),
                                              SizedBox(height: 10,),
                                              if(index == select)
                                                Container(
                                                    height: 4,color: AppUI.mainColor,
                                                    child: CustomText(text: "-${"Text"}-",color: Colors.transparent,)
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10,)
                                    ],
                                  );
                    }),
                  )
                ],
              ),
            ),
          ),
          Expanded(child: 
          Container(
            color: AppUI.backgroundColor,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
              child: ListView(
                primary: true,
                shrinkWrap : true ,
                children: [
                SizedBox(
                          width: MediaQuery.of(context).size.width - 160 ,
                          height: 30,
                          child: 
                ListView.builder(
                            padding: EdgeInsets.zero,
                              shrinkWrap: false,
                              // controller: cubit.productsScrollController,
                              scrollDirection: Axis.horizontal,
                              itemCount: 20  ,
                              itemBuilder: (context, index) {
                                return Row(
                                  mainAxisAlignment:MainAxisAlignment.center,
                                  children: [
                                    TextButton(
                                      
                                      style:
                                      //  TextButton.styleFrom(
                                      //   primary: (selectSeb == index) ?
                                      // ),
                                       ButtonStyle(
                                        foregroundColor: (selectSeb == index) ? MaterialStateProperty.all<Color>(
                                            AppUI.blackColor) :  MaterialStateProperty.all<Color>(
                                            AppUI.backgroundColor) ,
                                          backgroundColor: (selectSeb == index) ? MaterialStateProperty.all<Color>(
                                            AppUI.mainColor) :  MaterialStateProperty.all<Color>(
                                            AppUI.whiteColor),
                                             shape: MaterialStateProperty.all(
                                             RoundedRectangleBorder(
                                             borderRadius: BorderRadius.circular(30.0)),
                                             ),      
                                      ),
                                      onPressed: () {
                                             setState(() {
                                            selectSeb = index;
                                            print(selectSeb);
                                          });
                                      },
                                      child: InkWell(
                                        onTap: (){
                                          // cubit.selectedBranchCat = cubit.branchCategoriesModel!.data![index];
                                          // cubit.emit(BranchCategoriesLoadedState());
                                          // cubit.pageProducts = 1;
                                          // cubit.branchProducts();
                                          setState(() {
                                            selectSeb = index;
                                            print(select);
                                          });
                                          
                                          
                                        },
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            if (index == selectSeb)...[
                                            CustomText(text: "${"Text"}",color: AppUI.whiteColor,fontSize: 10,),
                                            ]
                                            else...[
                                            CustomText(text: "${"Text"}",color: AppUI.greyColor,fontSize: 10,),
                                            ] ,
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10,)
                                  ],
                                );
                  }),
                ),
                // SizedBox(height: 24,),
                GridView.builder(
                shrinkWrap: true ,
                primary: false ,
                itemCount: 17,
                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                 crossAxisCount: 2,
                 crossAxisSpacing : 0 ,
                 mainAxisSpacing: 0 ,
                 childAspectRatio  : MediaQuery.of(context).size.width /
               (MediaQuery.of(context).size.width * 1.5 ),
                 
           ), itemBuilder: (BuildContext context, int index) { 
            return InkWell(
              onTap: () {
                // BottomNavCubit.get(context).setWarehouseIndex(1);
              },
              child:Container(
                        margin:EdgeInsets.fromLTRB(12, 12, 12, 12),
                        width: 100,
                        // height: 180,
                        decoration: BoxDecoration(
                        color: AppUI.whiteColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                        BoxShadow(
                        color: Colors.grey.withAlpha(100),
                        blurRadius: 0.5, 
                        spreadRadius: 0.5, 
                        offset: Offset(  0.5,  0.5,),) ],),
                        child: Stack(children: [
                         Padding(
                           padding: const EdgeInsets.all(12.0),
                           child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10,),
                              Center(child: Image.asset("${AppUI.imgPath}Coffe.png",height: 80,width: 80)),
                              SizedBox(height: 10,),
                              CustomText(text: "Text",color: AppUI.blackColor,),
                              SizedBox(height: 5,),
                              CustomText(text: "Text",color: AppUI.blackColor,fontSize: 12,),
                              SizedBox(height: 5,),
                              Row(children: [
                                CustomText(text: "Text",color: AppUI.blackColor,fontWeight: FontWeight.w600,),
                                SizedBox(width: 5,),
                                CustomText(text: "Text",color: AppUI.greyColor, textDecoration: TextDecoration.lineThrough)
                              ],),
                            SizedBox(height: 5,),
                            CustomButton(text: "Add".tr() ,fontSize: 12,)

                             

                            ],
                        ),
                         ),
                            Container(margin: EdgeInsets.only(top: 10 , right: 0), height: 20 , width: 80,
                             child: Row(
                              children: [
                              SizedBox(width: 5,),
                              Image.asset("${AppUI.imgPath}Mask Group 461.png",height: 10,width: 10),
                              SizedBox(width: 5,),
                              CustomText(text: "Save 20%".tr(), fontSize: 10,color: AppUI.errorColor,),
                              SizedBox(width: 5,)
                             ],),
                             decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(topRight: Radius.circular(5) , bottomRight:Radius.circular(5) ),
                                    color: AppUI.errorLiteColor)
                             ,)
                        ],)

                        )
               
            );
            },
            )


                ],
                
              ),
            ),
          )
          )
        ],
      )
    );
  }
}

