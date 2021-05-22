import 'package:flutter/material.dart';
import 'package:my_wedding_test/utils/user/user_util.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              UserUtil.getUser().name
            ),
            Text(
              UserUtil.getUser().hp
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.shopping_cart_outlined),
        onPressed: (){},
      ),
    );
  }
}
