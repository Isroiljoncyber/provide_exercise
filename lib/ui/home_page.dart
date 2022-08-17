import 'package:flutter/material.dart';
import 'package:provide_exercise/ui/contact_page.dart';
import 'package:provide_exercise/ui/gallery_page.dart';
import 'package:provide_exercise/ui/news_page.dart';
import 'package:provide_exercise/ui/todo_page.dart';
import 'package:provide_exercise/utils/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedIndex = 0;
  static final List<Widget> _bottomNavPages = <Widget>[
    const NewsPage(),
    const GalleryPage(),
    const TodosPage(),
    const ContactPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainClr,
      body: _bottomNavPages[_selectedIndex],
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