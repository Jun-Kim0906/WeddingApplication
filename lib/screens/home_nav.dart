import 'package:flutter/material.dart';
import 'package:my_wedding_test/models/user/user_model.dart';
import 'package:my_wedding_test/screens/cart_page.dart';
import 'package:my_wedding_test/screens/detail_page.dart';
import 'package:my_wedding_test/screens/home_page.dart';
import 'package:my_wedding_test/screens/personal_page.dart';
import 'package:my_wedding_test/screens/search_page.dart';
import 'package:my_wedding_test/utils/user/user_util.dart';

class HomeNav extends StatefulWidget {
  const HomeNav({Key key}) : super(key: key);

  @override
  _HomeNavState createState() => _HomeNavState();
}

class _HomeNavState extends State<HomeNav> {
  User user = UserUtil.getUser();
  String name = UserUtil.getUser().name;
  String hp = UserUtil.getUser().hp;

  int _selectedIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _selectedIndex = index);
          },
          children: <Widget>[
            SearchPage(),
            DetailPage(),
            HomePage(),
            CartPage(),
            PersonalPage(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              label: 'Search',
              icon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
            label: 'Detail',
            icon: Icon(Icons.apps),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.apps),
            label: ''
          ),
          BottomNavigationBarItem(
            label: 'Cart',
            icon: Icon(Icons.settings),
          ),
          BottomNavigationBarItem(
            label: 'Personal',
            icon: Icon(Icons.settings),
          ),
        ],
      ),
    );
  }


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.easeOut);
    });
  }
}
