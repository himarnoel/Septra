import 'package:ecom_app/nav/categories.dart';
import 'package:ecom_app/nav/home.dart';
import 'package:ecom_app/nav/profile.dart';
import 'package:flutter/material.dart';

class Nav extends StatefulWidget {
  static String id = "nav";
  const Nav({Key? key}) : super(key: key);

  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  int i = 0;
  int _currentIndex = 0;
  int _selectedIndex = 0;
  List<Widget> page = [const Categories(), const Home(), const Profile()];
  String currentPage = "";
  void selectTab(String tabItem, int index) {
    setState(() {
      _currentIndex = page[index] as int;
      _selectedIndex = index;
    });
  }

  final _page1 = GlobalKey<NavigatorState>();
  final _page2 = GlobalKey<NavigatorState>();
  final _page3 = GlobalKey<NavigatorState>();
  List pages = [Home(), Home(), Home()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[i],
      bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.black,
          selectedIconTheme: IconThemeData(size: 35),
          selectedFontSize: 17,
          onTap: (index) {
            setState(() {
              i = index;
            });
          },
          currentIndex: i,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.menu), label: "Categories"),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
          ]),
    );
  }
}
