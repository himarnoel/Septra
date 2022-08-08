import 'package:ecom_app/nav/categories.dart';
import 'package:ecom_app/nav/profile.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class TabNavigator extends StatelessWidget {
  TabNavigator({required this.navigatorKey, required this.tabItem});
  final GlobalKey<NavigatorState> navigatorKey;
  final String tabItem;

  @override
  Widget build(BuildContext context) {
    Widget child = Categories();
    if (tabItem == "Page1")
      child = Categories();
    else if (tabItem == "Page2")
      child = Home();
    else if (tabItem == "Page3") child = Profile();

    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(builder: (context) => child);
      },
    );
  }
}
//  Navigator(
//       key: navigatorkey,
//       onGenerateRoute: (routeSettings) {
//         return MaterialPageRoute(builder: (context) => child);
//       },
//     );
