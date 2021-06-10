import 'package:flutter/material.dart';
import 'package:my_wedding_test/utils/user/user_util.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final TextEditingController pswController =
      TextEditingController(text: UserUtil.getUser().pwd);
  final TextEditingController emailController = TextEditingController(
    text: UserUtil.getUser().email
  );
  final TextEditingController hpController =
      TextEditingController(text: UserUtil.getUser().hp);
  final TextEditingController pswConfirmController =
  TextEditingController(text: UserUtil.getUser().pwd);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          '내 정보',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          TextButton(onPressed: () {}, child: Text('변경하기')),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(width: 20),
                Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 8.0, right: 8.0),
                      child: CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.white,
                        backgroundImage: NetworkImage(
                            "https://cloudfront-ap-northeast-1.images.arcpublishing.com/chosun/2TKUKXYMQF7ASZEUJLG7L4GM4I.jpg"),
                      ),
                    ),
                    Positioned(
                      bottom: 5.0,
                      right: 5.0,
                      child: Material(
                          color: Colors.pinkAccent,
                          borderRadius: BorderRadius.circular(25),
                          child: IconButton(
                              visualDensity: VisualDensity(
                                  horizontal: -4.0, vertical: -4.0),
                              padding: EdgeInsets.all(4.0),
                              splashRadius: 100,
                              iconSize: 17.0,
                              onPressed: () {},
                              icon: Icon(
                                Icons.add_a_photo_outlined,
                              ))),
                    ),
                  ],
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
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: TextFormField(
                controller: pswController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: '패스워드 변경',
                  labelText: '배스워드 변경',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: TextFormField(
                controller: pswConfirmController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: '패스워드 확인',
                  labelText: '패스워드 확인',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: 'Email',
                  labelText: 'Email',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: TextFormField(
                controller: hpController,
                decoration: const InputDecoration(
                  hintText: '전화번호',
                  labelText: '전화번호',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
