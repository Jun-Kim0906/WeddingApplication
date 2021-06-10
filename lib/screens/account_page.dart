
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_wedding_test/models/user/user_model.dart';
import 'package:my_wedding_test/repository/user_repository.dart';
import 'package:my_wedding_test/utils/user/user_util.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final _formKey = GlobalKey<FormState>();

  User _user = UserUtil.getUser();

  String password, confirmPassword, email, hp;

  bool checkFields() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  @override
  void initState() {
    super.initState();
    password = _user.pwd;
    confirmPassword = _user.pwd;
    email = _user.email;
    hp = _user.hp;
  }

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
          TextButton(
              onPressed: () {
                if (checkFields()) {
                  _showAlert(
                      title: '정보변경',
                      message: '변경 사항을 저장 하시겠습니까?',
                      onPressed1: () {
                        Navigator.pop(context);
                      },
                      onPressed2: () async {
                        await UserRepository().updateUser(
                            id: UserUtil.getUser().id,
                            password: password,
                            email: email,
                            hp: hp);
                        Navigator.pop(context);
                        UserUtil.setUserWithUser(User(
                          id: _user.id,
                          pwd: password,
                          hp: hp,
                          email: email,
                          name: _user.name
                        ));
                        _showAlert2(
                          title: '변경완료',
                          message: '정보 변경이 완료되었습니다!',
                          onPressed: (){
                            Navigator.pop(context);
                          }
                        );
                      });

                }
              },
              child: Text('변경하기')),
        ],
      ),
      body: Form(
        key: _formKey,
        child: Padding(
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
                                splashRadius: 17,
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
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          '@${UserUtil.getUser().id}',
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w400,
                              color: Color(0xa0000000)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: TextFormField(
                  initialValue: password,
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: '패스워드 변경',
                      labelText: '패스워드 변경',
                    ),
                    onChanged: (value) {
                      this.password = value;
                    },
                    validator: (value) =>
                        value.isEmpty ? '비밀번호를 입력해 주세요' : null),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: TextFormField(
                  initialValue: confirmPassword,
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: '패스워드 확인',
                      labelText: '패스워드 확인',
                    ),
                    onChanged: (value) {
                      this.confirmPassword = value;
                    },
                    validator: (value) => value.isEmpty
                        ? '비밀번호 확인 입력해 주세요 '
                        : value != password
                            ? '패스워드가 동일하지 않습니다'
                            : null),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: TextFormField(
                  initialValue: email,
                  decoration: const InputDecoration(
                    hintText: 'Email',
                    labelText: 'Email',
                  ),
                  onChanged: (value) {
                    this.email = value;
                  },
                  validator: (value) => value.isEmpty
                      ? '이메일 주소를 입력해 주세요'
                      : !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)
                          ? '올바른 이메일 형식이 아닙니다.'
                          : null,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: TextFormField(
                  initialValue: hp,
                    decoration: const InputDecoration(
                      hintText: '전화번호',
                      labelText: '전화번호',
                    ),
                    onChanged: (value) {
                      this.hp = value;
                    },
                    validator: (value) =>
                        value.isEmpty ? '휴대폰 번호를 입력해 주세요' : null),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showAlert(
      {String title,
        String message,
        VoidCallback onPressed1,
        VoidCallback onPressed2}) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              CupertinoDialogAction(
                  isDefaultAction: true,
                  child: Text("취소"),
                  onPressed: onPressed1),
              CupertinoDialogAction(
                  isDefaultAction: true,
                  child: Text("확인"),
                  onPressed: onPressed2)
            ],
          );
        });
  }

  void _showAlert2(
      {String title,
        String message,
        VoidCallback onPressed}) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              CupertinoDialogAction(
                  isDefaultAction: true,
                  child: Text("취소"),
                  onPressed: onPressed)
            ],
          );
        });
  }
}
