import 'package:adelco_user/shared/components.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../bloc/product/product_cubit.dart';
import '../../utilities/app_ui.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
      final cubit = ProductCubit.get(context);
      cubit.getFavorites();
  }
  final items = List<String>.generate(20, (i) => 'Item ${i + 1}');

  // int count = 20 ;
  @override
  Widget build(BuildContext context) {
          final cubit = ProductCubit.get(context);

    return Scaffold(
      appBar: customAppBar(title: "Favorite".tr() , centerTitle: true , elevation: 0.5),
      body: BlocBuilder< ProductCubit, ProductState>(
          buildWhen : (_,state) => state is  GetFavoriteLoadingState || state is GetFavoriteLoadedState || state is GetFavoriteErrorState,
          builder: (context, state) {
            if(state is GetFavoriteLoadingState){
              return const LoadingWidget();
            }
            if(state is  GetFavoriteErrorState){
              return const ErrorFetchWidget();
            }
            return ListView.separated(
                    separatorBuilder: (context, index) {
                      return  Divider(
                        color: AppUI.shimmerColor.withOpacity(0),
                        thickness: 0,
                      );
                    },
                    scrollDirection: Axis.vertical,
                    itemCount: cubit.favoritesModel?.data?.length ?? 0,
                    itemBuilder: (context, count) {
                      final item = cubit.favoritesModel?.data?[count].id;
                      return  Dismissible(
                        direction: DismissDirection.startToEnd,
              key: UniqueKey(),
              onDismissed: (direction) async {
                setState(() {
                  cubit.removeFavorite("${cubit.favoritesModel?.data?[count].id}");
                  cubit.favoritesModel?.data?.removeAt(count);
                });
                 
                
                // Then show a snackbar.
                // ScaffoldMessenger.of(context)
                //     .showSnackBar(SnackBar(content: Text('$item dismissed')));
              },
              // Show a red background as the item is swiped away.
              background: Container(color: Colors.red ,child: Row(children: [SizedBox(width: 5,),SvgPicture.asset("${AppUI.iconPath}trash.svg" , color: AppUI.whiteColor,),SizedBox(width: 10,) ,CustomText(text: "Delete".tr(),color: AppUI.whiteColor,),SizedBox(width: 10,)],),),
              child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
                          // margin: EdgeInsets.fromLTRB(0, 16, 0, 16),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12) , border:Border.all(color: AppUI.shimmerColor) ),
                          child: Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Image.asset("${AppUI.imgPath}Coffe.png",width: 80,height: 80,),
                              SetImage(width: 80, height: 80, img: cubit.favoritesModel?.data?[count].image, borderRadius: 0),
                              SizedBox(width: 10,),
                              Expanded(child: 
                              
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      // Text('${cubit.notifications![count].body}'),
                                      // Text('${cubit.notifications![count].date} ${cubit.notifications![count].time}'),
                                    CustomText(text: "${cubit.favoritesModel?.data?[count].productTitle}" , color:  AppUI.blackColor,),
                                    SizedBox(height: 8,),
                                    CustomText(text: "${cubit.favoritesModel?.data?[count].weight} ${cubit.favoritesModel?.data?[count].productUnit}"   , color: AppUI.greyColor,),
                                    SizedBox(height: 8,),
                                    CustomText(text: "${cubit.favoritesModel?.data?[count].discountPrice ?? cubit.favoritesModel?.data?[count].price} ${"SR".tr()}" , color:  AppUI.blackColor,fontWeight: FontWeight.bold,),
                                    // Row(
                                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    //       children: [
                                            
                                           
                                        //    SizedBox(width: 5,),
                                        //     Expanded(flex: 0,child: Container(
                                        //       padding: EdgeInsets.only(right: 10,left: 10),
                                        //       height: 50,
                                        //       decoration: BoxDecoration(borderRadius: BorderRadius.circular(12) , border:Border.all(color: AppUI.shimmerColor) ),
                                        //       child: Row(
                                        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        //         children: [SizedBox(width: 5,),SvgPicture.asset("${AppUI.iconPath}plus.svg"),SizedBox(width: 10,) ,CustomText(text: "1",color: AppUI.blackColor,),SizedBox(width: 10,), SvgPicture.asset("${AppUI.iconPath}minus.svg"),],
                                        //       ),
                                        //     )),

                                        //   ],

                                        //  )
                                    
                                  ],),
                                ),
                             

                          ]),),
                        ),
                      ));

                    }
                    );
          }
      )
      
    );
  }
}