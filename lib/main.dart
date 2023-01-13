import 'package:adelco_user/presentation/auth/signup_company_screen.dart';
import 'package:adelco_user/presentation/bottom_nav/bottom_nav_tabs_screen.dart';
import 'package:adelco_user/presentation/home/product_details_screen.dart';
import 'package:adelco_user/presentation/onboarding/onboarding_screen.dart';
import 'package:adelco_user/presentation/orders/cancel_order_screen.dart';
import 'package:adelco_user/presentation/orders/chat_screen.dart';
import 'package:adelco_user/presentation/orders/current_order_screen.dart';
import 'package:adelco_user/presentation/orders/previous_order_screen.dart';
import 'package:adelco_user/presentation/orders/rating_bottom_sheet.dart';
import 'package:adelco_user/presentation/orders/statuses_screen.dart';
import 'package:adelco_user/presentation/payment/add_card_screen.dart';
import 'package:adelco_user/presentation/payment/all_card_screen.dart';
import 'package:adelco_user/presentation/splash/splash_screen.dart';
import 'package:adelco_user/shared/components.dart';
import 'package:adelco_user/utilities/app_ui.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:status_stepper/status_stepper.dart';

import 'bloc/auth/auth_cubit.dart';
import 'bloc/onboarding/onboarding_cubit.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
     runApp(
    EasyLocalization(
        supportedLocales: const [Locale('ar'), Locale('en')],
        path: 'lang',
        fallbackLocale: const Locale('ar'),
        child: const MyApp()),
  );
  
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
      return MultiBlocProvider(
      providers: [
      BlocProvider(create: (context) => AuthCubit(),),
      // BlocProvider(create: (context) => BottomNavCubit(),),
      // BlocProvider(create: (context) => PreparationCubit(),),
       BlocProvider(create: (context) => OnboardingCubit(),),
      
      ],
      child: MaterialApp(
        title: 'adelco',
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: ThemeData(
          scaffoldBackgroundColor: AppUI.whiteColor,
          appBarTheme:  AppBarTheme(color: Colors.white,iconTheme: IconThemeData(color: AppUI.blackColor)),
          primarySwatch: AppUI.mainColor,
          textTheme: GoogleFonts.tajawalTextTheme(Theme.of(context).textTheme).copyWith(
            bodyText1: GoogleFonts.tajawal(textStyle: Theme.of(context).textTheme.bodyText1)
            // (textStyle: Theme.of(context).textTheme.bodyText1),
          ),
        ),
        home:  SplashScreen(),
      ),
    );
  }
}


// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Status Stepper Example',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Status Stepper Example'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int curIndex = -1;
//   int lastIndex = -1;
//   late TabController tabController;




//   @override
//   Widget build(BuildContext context) {
//       var statuses = List.generate(
//     5,
//     (index) => SizedBox.square(
//       dimension: 32,
//       child: Center(child: Text(this.curIndex >= index ?'$index':'Lo'))),
//     );
  
//     return DefaultTabController(length:2 ,
//    child: Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: StatusStepper(
//                 connectorCurve: Curves.easeIn,
//                 itemCurve: Curves.easeOut,
//                 activeColor: Colors.amber,
//                 disabledColor: Colors.grey,
//                 animationDuration: const Duration(milliseconds: 500),
//                 children: statuses,
//                 lastActiveIndex: lastIndex,
//                 currentIndex: curIndex,
//                 connectorThickness: 6,
//               ),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 setState(() {
//                   curIndex = -1;
//                   lastIndex = -1;
//                 });
//               },
//               child: const Text(
//                 'Reset',
//               ),
//             ),
//             Expanded(
//               child: TabBarView(
//                 physics: const NeverScrollableScrollPhysics(),
//                 controller: tabController ,
//                 children: [
//                 ElevatedButton(
//                     onPressed: 0 > curIndex
//                         ? () {
//                             setState(() {
//                               lastIndex = curIndex;
//                               curIndex = 0;
//                             });
//                           }
//                         : null,
//                     child: Text(
//                       '0',
//                     ),
//                   ) ,
//                    ElevatedButton(
//                     onPressed: 1 > curIndex
//                         ? () {
//                             setState(() {
//                               lastIndex = curIndex;
//                               curIndex = 1;
//                             });
//                           }
//                         : null,
//                     child: Text(
//                       '1',
//                     ),
//                   )
//               ],)

//           //     GridView.builder(
//           //       //  shrinkWrap : true,
//           //       //   primary: false,
//           //        itemCount: statuses.length,
//           //        scrollDirection: Axis.horizontal ,
//           //        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           //        crossAxisCount: 1,
//           //        crossAxisSpacing : 0 ,
//           //        mainAxisSpacing: 0 ,
//           //        childAspectRatio  : 1
//           //         // MediaQuery.of(context).size.width /
//           //     // (MediaQuery.of(context).size.height ),
//           //  ), itemBuilder: (BuildContext context, int index) => 

//           //   Container(
//           //     width: double.infinity,
//           //     child: ElevatedButton(
//           //           onPressed: index > curIndex
//           //               ? () {
//           //                   setState(() {
//           //                     lastIndex = curIndex;
//           //                     curIndex = index;
//           //                   });
//           //                 }
//           //               : null,
//           //           child: Text(
//           //             '$index',
//           //           ),
//           //         ),
//           //   )
           
//           //     ),
//               //  ListView.builder(
//               //   itemCount: statuses.length,
//               //   itemBuilder: (context, index) => ElevatedButton(
//               //     onPressed: index > curIndex
//               //         ? () {
//               //             setState(() {
//               //               lastIndex = curIndex;
//               //               curIndex = index;
//               //             });
//               //           }
//               //         : null,
//               //     child: Text(
//               //       '$index',
//               //     ),
//               //   ),
//               // ),
//             ),
//             Container(height: 100,color: AppUI.errorColor,),
//                         Container(height: 100,color: AppUI.mainColor,
//                      child: Center(child:  Row(
//                            mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                         //   CustomButton(width: 140,text:  "Reason" , radius: 20 ,onPressed: (() {
//                         //  }),),
//                         InkWell(onTap: () {
//                           print("x");
//                           tabController.index = 1;
//                         },child: Text("Reason"),),
                         
//                          SizedBox(width: 30,),
//                         // CustomButton(width: 140,textColor:AppUI.mainColor , color: AppUI.secondColor,text: "next"  , radius: 20 , onPressed: () {
//                         //   AppUtil.mainNavigator(context, const LoginScreen());
//                         // },),
//                       ],
//                     ),),)
//           ],
//         ),
//       ),
//    )
//     );
//   }
// }



















// import 'package:flutter/material.dart';
// void main() {
//   runApp(const MyApp());
// }
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Status Stepper Example',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home:  HomePage(),
//     );
//   }
// }
// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   int _currentIndex = 2;
//   final List<Widget> _pages = <Widget>[];

//   @override
//   void initState() {
//     _pages.add(CategoryScreen());
//     _pages.add(CategoryScreen());
//     _pages.add(HomeScreen());
//     _pages.add(SettingScreen());
//     _pages.add(SettingScreen());
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('BottomNavigationBar')),
//       body: _pages[_currentIndex],
//       bottomNavigationBar: BottomAppBar(
//         shape: CircularNotchedRectangle(),
//         notchMargin: 0,
//         clipBehavior: Clip.antiAlias,
//         child: Container(
//           height: kBottomNavigationBarHeight + 5,
//           child: Container(
//             // decoration: BoxDecoration(
//             //   color: Colors.black,
//               // border: Border(
//               //   top: BorderSide(
//               //     width: 0.5,
//               //   ),
//               // ),
//             // ),
//             child: BottomNavigationBar(
//               type: BottomNavigationBarType.fixed,
//                 currentIndex: _currentIndex,
//                 selectedFontSize: 12,
//                 backgroundColor: Colors.white,
//                 selectedItemColor: AppUI.mainColor,
//                 unselectedItemColor: AppUI.greyColor,
//                 onTap: (index) {
//                   setState(() {
//                     _currentIndex = index;
//                   });
//                 },
//                 items: [
//                   BottomNavigationBarItem(
//                       icon: Center(
//                        child: 
//                        Container(
//                         padding:EdgeInsets.fromLTRB(10, 2, 10, 2),
//                         child: Icon(Icons.category,))),
//                         activeIcon: Center(
//                        child: 
//                        Container(
//                         padding:EdgeInsets.fromLTRB(10, 2, 10, 2),
//                        decoration: BoxDecoration(
//                        color: AppUI.mainColor.withAlpha(300),
//                        borderRadius: BorderRadius.all(Radius.circular(20))),
//                         child: Icon(Icons.category,))), 
//                         label: 'Category'),
//                        BottomNavigationBarItem(
//                       icon: Center(
//                        child: 
//                        Container(
//                         padding:EdgeInsets.fromLTRB(10, 2, 10, 2),
//                         child: Icon(Icons.category,))),
//                         activeIcon: Center(
//                        child: 
//                        Container(
//                         padding:EdgeInsets.fromLTRB(10, 2, 10, 2),
//                        decoration: BoxDecoration(
//                        color: AppUI.mainColor.withAlpha(300),
//                        borderRadius: BorderRadius.all(Radius.circular(20))),
//                         child: Icon(Icons.category,))), 
//                         label: 'Category'),
//                   BottomNavigationBarItem(icon: Icon(Icons.home , color: Colors.white,) , label: ''),
//                    BottomNavigationBarItem(
//                       icon: Center(
//                        child: 
//                        Container(
//                         padding:EdgeInsets.fromLTRB(10, 2, 10, 2),
//                         child: Icon(Icons.settings_outlined,))),
//                         activeIcon: Center(
//                        child: 
//                        Container(
//                         padding:EdgeInsets.fromLTRB(10, 2, 10, 2),
//                        decoration: BoxDecoration(
//                        color: AppUI.mainColor.withAlpha(300),
//                        borderRadius: BorderRadius.all(Radius.circular(20))),
//                         child: Icon(Icons.settings_outlined,))), 
//                         label: 'Setting'),
//                       BottomNavigationBarItem(
//                       icon: Center(
//                        child: 
//                        Container(
//                         padding:EdgeInsets.fromLTRB(10, 2, 10, 2),
//                         child: Icon(Icons.settings_outlined,))),
//                         activeIcon: Center(
//                        child: 
//                        Container(
//                         padding:EdgeInsets.fromLTRB(10, 2, 10, 2),
//                        decoration: BoxDecoration(
//                        color: AppUI.mainColor.withAlpha(300),
//                        borderRadius: BorderRadius.all(Radius.circular(20))),
//                         child: Icon(Icons.settings_outlined,))), 
//                         label: 'Setting'),
//                 ]),
//           ),
//         ),
//       ),
//       floatingActionButtonLocation:
//           FloatingActionButtonLocation.miniCenterDocked,
//       floatingActionButton: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: FloatingActionButton(
//           backgroundColor: _currentIndex == 2 ? Colors.blue : Colors.blue,
//           child: Icon(Icons.home),
//           onPressed: () => setState(() {
//             _currentIndex = 2;
//           }),
//         ),
//       ),
//     );
//   }
// }

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: double.infinity,
//       child: Center(child: Text('Home')),
//     );
//   }
// }

// class CategoryScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: double.infinity,
//       child: Center(child: Text('Category')),
//     );
//   }
// }

// class SettingScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: double.infinity,
//       child: Center(child: Text('Settings')),
//     );
//   }
// }


