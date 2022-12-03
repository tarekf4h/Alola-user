import 'package:adelco_user/presentation/account/account_screen.dart';
import 'package:adelco_user/presentation/cart/cart_screen.dart';
import 'package:adelco_user/presentation/category/category_screen.dart';
import 'package:adelco_user/presentation/home/home_screen.dart';
import 'package:adelco_user/presentation/orders/orders_screen.dart';
import 'package:adelco_user/utilities/app_util.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utilities/app_ui.dart';

class BottomNavTabsScreen extends StatefulWidget {
  @override
  _BottomNavTabsScreenState createState() => _BottomNavTabsScreenState();
}

class _BottomNavTabsScreenState extends State<BottomNavTabsScreen> {
  int _currentIndex = 0;
  final List<Widget> _pages = <Widget>[];

  @override
  void initState() {
    _pages.add(HomeScreen());
    _pages.add(CategoryScreen());
    _pages.add(CartScreen());
    _pages.add(OrdersScreen());
    _pages.add(AccountsScreen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 0,
        clipBehavior: Clip.antiAlias,
        child: Container(
          height: kBottomNavigationBarHeight + 5,
          child: Container(
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
                currentIndex: _currentIndex,
                selectedFontSize: 12,
                backgroundColor: Colors.white,
                selectedItemColor: AppUI.mainColor,
                unselectedItemColor: AppUI.greyColor,
                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                items: [
                  BottomNavigationBarItem(
                      icon: Center(
                       child: 
                       Container(
                        padding:EdgeInsets.fromLTRB(10, 3, 10, 3),
                        child: Image.asset('${AppUI.imgPath}homeIcon.png', width: 20,height: 20,))),
                        activeIcon: Center(
                       child: 
                       Container(
                        padding:EdgeInsets.fromLTRB(10, 3, 10, 3),
                       decoration: BoxDecoration(
                       color: AppUI.mainColor.withAlpha(300),
                       borderRadius: BorderRadius.all(Radius.circular(20))),
                        child:  Image.asset('${AppUI.imgPath}homeIconS.png', width: 20,height: 20,))), 
                        label: 'Home'.tr()),
                       BottomNavigationBarItem(
                      icon: Center(
                       child: 
                       Container(
                        padding:EdgeInsets.fromLTRB(10, 2, 10, 2),
                        child: Image.asset('${AppUI.imgPath}categoryIcon.png', width: 20,height: 20,))),
                        activeIcon: Center(
                       child: 
                       Container(
                        padding:EdgeInsets.fromLTRB(10, 3, 10, 3),
                       decoration: BoxDecoration(
                       color: AppUI.mainColor.withAlpha(300),
                       borderRadius: BorderRadius.all(Radius.circular(20))),
                        child: Image.asset('${AppUI.imgPath}categoryIconS.png', width: 20,height: 20,))), 
                        label: 'Category'.tr()),
                  BottomNavigationBarItem(icon: Icon(Icons.home , color: Colors.white,) , label: ''),
                   BottomNavigationBarItem(
                      icon: Center(
                       child: 
                       Container(
                        padding:EdgeInsets.fromLTRB(10, 3, 10, 3),
                        child: Image.asset('${AppUI.imgPath}ordersIcon.png', width: 20,height: 20,))),
                        activeIcon: Center(
                       child: 
                       Container(
                        padding:EdgeInsets.fromLTRB(10, 3, 10, 3),
                       decoration: BoxDecoration(
                       color: AppUI.mainColor.withAlpha(300),
                       borderRadius: BorderRadius.all(Radius.circular(20))),
                        child: Image.asset('${AppUI.imgPath}ordersIconS.png', width: 20,height: 20,))), 
                        label: 'Orders'.tr()),
                      BottomNavigationBarItem(
                      icon: Center(
                       child: 
                       Container(
                        padding:EdgeInsets.fromLTRB(10, 3, 10, 3),
                        child: Image.asset('${AppUI.imgPath}accountIcon.png', width: 20,height: 20,))),
                        activeIcon: Center(
                       child: 
                       Container(
                        padding:EdgeInsets.fromLTRB(10, 2, 10, 2),
                       decoration: BoxDecoration(
                       color: AppUI.mainColor.withAlpha(300),
                       borderRadius: BorderRadius.all(Radius.circular(20))),
                        child: Image.asset('${AppUI.imgPath}accountIconS.png', width: 20,height: 20,))), 
                        label: 'Account'.tr()),
                ]),
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          backgroundColor: _currentIndex == 2 ? Colors.blue : Colors.blue,
          child: Image.asset('${AppUI.imgPath}cartIcon.png', width: 20,height: 20,),
          onPressed: () => setState(() {
            // _currentIndex = 2;
            AppUtil.mainNavigator(context, CartScreen());
          }),
        ),
      ),
    );
  }
}