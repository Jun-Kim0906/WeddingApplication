import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:my_wedding_test/utils/user/user_util.dart';

import 'account_page.dart';

class PersonalPage extends StatefulWidget {
  const PersonalPage({Key key}) : super(key: key);

  @override
  _PersonalPageState createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> {
  @override
  Widget build(BuildContext context) {
    return
      // SafeArea(
      // child:

        Scaffold(
        resizeToAvoidBottomInset: false,

        appBar: AppBar(
          centerTitle: true,
          title: const Text('My account',
          style: TextStyle(color: Colors.white),
          )
        ),
        body: ListView(
          children: <Widget>[
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(width: 20),
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage(
                      "https://cloudfront-ap-northeast-1.images.arcpublishing.com/chosun/2TKUKXYMQF7ASZEUJLG7L4GM4I.jpg"),
                ),
                Column(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                        child: Text(
                          UserUtil.getUser().name,
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.w400),
                        )),
                    ElevatedButton(
                      style: ButtonStyle(backgroundColor:  MaterialStateProperty.all<Color>(Colors.grey)),

                      onPressed: () {
                        print("Edit Button");

                      },
                      child: const Text("Edit account"),
                    )
                  ],
                ),
              ],
            ),

            Divider(
              height: 30,
              thickness: 1,
              indent: 20,
              endIndent: 20,
              // color: Colors.black,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
              child: TextButton(
                child: Text(
                  "Account details",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                      color: Colors.black),
                ),
                onPressed: () {
                  print("Account details");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Account_Page()),
                  );
                },
              ),
            ),
            Divider(
              height: 20,
              thickness: 1,
              indent: 20,
              endIndent: 20,
              // color: Colors.black,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
              child: TextButton(
                child: Text(
                  "My Orders",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                      color: Colors.black),
                ),
                onPressed: () {
                  print("My Orders");
                },
              ),
            ),
            Divider(
              height: 20,
              thickness: 1,
              indent: 20,
              endIndent: 20,
              // color: Colors.black,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
              child: TextButton(
                child: Text(
                  "Logout",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                      color: Colors.black),
                ),
                onPressed: () {
                  print("Logout Button");
                },
              ),
            )
          ],
        ),
      );
    // );
  }
}
