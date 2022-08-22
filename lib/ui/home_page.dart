import 'package:flutter/material.dart';
import 'package:notification_permissions/notification_permissions.dart';
import 'package:provide_exercise/ui/contact_page.dart';
import 'package:provide_exercise/ui/gallery_page.dart';
import 'package:provide_exercise/ui/news_page.dart';
import 'package:provide_exercise/ui/todo_page.dart';
import 'package:provide_exercise/utils/constants.dart';

import '../utils/notification.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController(keepPage: false);
  final List<Widget> _bottomNavPages = <Widget>[
    NewsPage(),
    const GalleryPage(),
    const TodosPage(),
    const ContactPage()
  ];

  void _onItemTapped(int index) {
    _pageController.jumpToPage(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainClr,
      body: PageView(
        controller: _pageController,
        children: _bottomNavPages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white24,
        backgroundColor: mainClr,
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded), label: "News"),
          BottomNavigationBarItem(
              icon: Icon(Icons.image_rounded), label: "Gallery"),
          BottomNavigationBarItem(
              icon: Icon(Icons.check_box_rounded), label: "Todo"),
          BottomNavigationBarItem(
              icon: Icon(Icons.contacts_rounded), label: "Contacts")
        ],
      ),
    );
  }
}
