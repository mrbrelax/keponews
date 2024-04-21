import 'package:flutter/material.dart';
import 'package:newsapp/pages/categoripage.dart';
import 'package:newsapp/pages/home.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedTabIndex = 0;
  void _onNavBarTapped(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    final _listPage = <Widget>[
      const HomePage(),
      const CategoriPage(),
    ];

    // ignore: no_leading_underscores_for_local_identifiers
    final _bottomNavBarItems = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      const BottomNavigationBarItem(
          icon: Image(
            image: AssetImage("assets/images/category.png"),
            height: 22,
          ),
          label: 'Categori'),
    ];

    // ignore: no_leading_underscores_for_local_identifiers
    final _bottomNavBar = BottomNavigationBar(
      items: _bottomNavBarItems,
      currentIndex: _selectedTabIndex,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      onTap: _onNavBarTapped,
    );

    return Scaffold(
      body: _listPage[_selectedTabIndex],
      bottomNavigationBar: _bottomNavBar,
    );
  }
}
