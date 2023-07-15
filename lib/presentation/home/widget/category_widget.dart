import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../models/product/category_model.dart';
import '../../../shared/components.dart';
import '../../../utilities/app_ui.dart';

class CategoryWidget extends StatefulWidget {
  final Category?  data;
  const CategoryWidget({super.key , required this.data});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
                              padding: const EdgeInsets.all(12.0),
                              child: SetImage(width: 50, height: 50, img: widget.data?.image, borderRadius: 0)

                              // Image.asset("${AppUI.imgPath}Coffe.png",height: 50,width: 50),
                            ),
                            ],
                          ),
                        ),
                        SizedBox(height: 2,),
                        CustomTextCenter(text: widget.data?.name ,fontSize: 12, color: AppUI.blackColor,),
                      ],
                     );
  }
}