import 'package:flutter/material.dart';
import 'package:my_wedding_test/utils/user/user_util.dart';

class Account_Page extends StatefulWidget {
  const Account_Page({Key key}) : super(key: key);

  @override
  _Account_PageState createState() => _Account_PageState();
}

class _Account_PageState extends State<Account_Page> {
  final TextEditingController idController = TextEditingController();
  final TextEditingController pswController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController hpController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text(
            'Account Detail',
            style: TextStyle(color: Colors.white),
          )),
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
                    onPressed: () {
                      // 출력 확인
                      print("Edit Button & print ID/PW/Email/hp");
                      print(idController.text);
                      print(pswController.text);
                      print(emailController.text);
                      print(hpController.text);


                      // clear 시키기
                      idController.clear();
                      pswController.clear();
                      emailController.clear();
                      hpController.clear();
                    },
                    child: const Text("Edit account"),
                  )
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 40, top: 20),
            child: TextFormField(
              controller: idController,
              decoration: const InputDecoration(
                hintText: 'ID',
                labelText: 'ID',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 40, top: 20),
            child: TextFormField(
              controller: pswController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'PassWord',
                labelText: 'PassWord',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 40, top: 20),
            child: TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: 'Email',
                labelText: 'Email',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 40, top: 20),
            child: TextFormField(
              controller: hpController,
              decoration: const InputDecoration(
                hintText: 'H.P',
                labelText: 'H.P',
              ),
            ),
          ),



        ],
      ),
    );
  }
}
