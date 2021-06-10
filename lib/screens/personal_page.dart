import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_wedding_test/blocs/authentication/authentication_bloc.dart';
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
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: ListView(
            children: <Widget>[
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(width: 15),
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(
                        "https://cloudfront-ap-northeast-1.images.arcpublishing.com/chosun/2TKUKXYMQF7ASZEUJLG7L4GM4I.jpg"),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          UserUtil.getUser().name,
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(height: 15.0,),
                        Text(
                          '@${UserUtil.getUser().id}',
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.w400, color: Color(0xa0000000)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Divider(
                height: 30,
                thickness: 1,
                indent: 20,
                endIndent: 20,
              ),
              TextButton(
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
                    MaterialPageRoute(builder: (context) => AccountPage()),
                  );
                },
              ),
              Divider(
                height: 20,
                thickness: 1,
                indent: 20,
                endIndent: 20,
              ),
              TextButton(
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
              Divider(
                height: 20,
                thickness: 1,
                indent: 20,
                endIndent: 20,
              ),
              TextButton(
                child: Text(
                  "Logout",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                      color: Colors.black),
                ),
                onPressed: () {
                  _showAlert(title: '로그아웃', message: '로그아웃 하시겠습니까?');
                },
              )
            ],
          ),
        ),
      ),
    );
    // );
  }
  void _showAlert({String title, String message}) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              CupertinoDialogAction(
                isDefaultAction: false,
                  child: Text("예"),
                  onPressed: () {
                    BlocProvider.of<AuthenticationBloc>(context).add(AuthenticationLoggedOut());
                    Navigator.pop(context);
                  }),
              CupertinoDialogAction(
                  isDefaultAction: true,
                  child: Text("아니오"),
                  onPressed: () {
                    Navigator.pop(context);
                  })
            ],
          );
        });
  }
}
