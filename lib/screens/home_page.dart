import 'package:flutter/material.dart';
import 'package:my_wedding_test/screens/home_screens/home_dress_page.dart';
import 'package:my_wedding_test/screens/home_screens/home_main_page.dart';
import 'package:my_wedding_test/screens/home_screens/home_make_up_page.dart';
import 'package:my_wedding_test/screens/home_screens/home_studio_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: new PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: new Container(
            child: new SafeArea(
              child: Column(
                children: <Widget>[
                  new Expanded(child: new Container()),
                  new TabBar(
                    isScrollable: true,
                    labelColor: Colors.black,
                    indicatorColor: Colors.black,
                    tabs: [
                      Tab(
                          icon: Icon(
                        Icons.home,
                        color: Colors.black,
                      )),
                      Tab(
                        text: 'Studio',
                      ),
                      Tab(text: 'Dress'),
                      Tab(text: 'Make up'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            HomeMainPage(),
            HomeStudioPage(),
            HomeDressPage(),
            HomeMakeUpPage(),
          ],
        ),
      ),
    );
  }
}
