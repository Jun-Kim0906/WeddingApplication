import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_wedding_test/repository/user_repository.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  String id, password, confirmPassword, name, email;
  String hp1 = '010';
  String hp2 = '';
  String hp3 = '';

  Color greenColor = Color(0xFF00AF19);

  TextStyle _labelTextStyle =
      TextStyle(fontSize: 12.0, color: Colors.grey.withOpacity(0.9));

  //To check fields during submit
  checkFields() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Form(key: _formKey, child: _buildSignupForm())));
  }

  _buildSignupForm() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.0),
        child: ListView(children: [
          SizedBox(height: 75.0),
          Container(
              height: 125.0,
              width: 200.0,
              child: Stack(
                children: [
                  Text('Sign up',
                      style: TextStyle(fontFamily: 'Trueno', fontSize: 60.0)),
                  //Dot placement
                  Positioned(
                      top: 62.0,
                      left: 220.0,
                      child: Container(
                          height: 10.0,
                          width: 10.0,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context).primaryColor)))
                ],
              )),
          SizedBox(height: 25.0),
          TextFormField(
              decoration: InputDecoration(
                  labelText: '?????????',
                  labelStyle: _labelTextStyle,
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor),
                  )),
              onChanged: (value) {
                this.id = value;
              },
              validator: (value) => value.isEmpty ? 'ID??? ????????? ?????????' : null),
          TextFormField(
              decoration: InputDecoration(
                  labelText: '????????????',
                  labelStyle: _labelTextStyle,
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor),
                  )),
              obscureText: true,
              onChanged: (value) {
                this.password = value;
              },
              validator: (value) => value.isEmpty ? '??????????????? ????????? ?????????' : null),
          TextFormField(
              decoration: InputDecoration(
                  labelText: '???????????? ??????',
                  labelStyle: _labelTextStyle,
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor),
                  )),
              obscureText: true,
              onChanged: (value) {
                this.confirmPassword = value;
              },
              validator: (value) => value.isEmpty
                  ? '???????????? ?????? ????????? ????????? '
                  : value != password
                      ? '??????????????? ???????????? ????????????'
                      : null),
          TextFormField(
              decoration: InputDecoration(
                  labelText: '??????',
                  labelStyle: _labelTextStyle,
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor),
                  )),
              onChanged: (value) {
                this.name = value;
              },
              validator: (value) => value.isEmpty ? '????????? ????????? ?????????' : null),
          TextFormField(
            decoration: InputDecoration(
                labelText: '?????????',
                labelStyle: _labelTextStyle,
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                )),
            onChanged: (value) {
              this.email = value;
            },
            validator: (value) => value.isEmpty
                ? '????????? ????????? ????????? ?????????'
                : !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value)
                    ? '????????? ????????? ????????? ????????????.'
                    : null,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                flex: 1,
                child: TextFormField(
                    initialValue: '010',
                    decoration: InputDecoration(
                        labelText: '?????????',
                        labelStyle: _labelTextStyle,
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Theme.of(context).primaryColor),
                        )),
                    onChanged: (value) {
                      this.hp1 = value;
                    },
                    validator: (value) {
                      if (value.isEmpty || hp2.isEmpty || hp3.isEmpty) {
                        return '????????? ????????? ????????? ?????????';
                      } else {
                        return null;
                      }
                    }),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0, bottom: 8.0, right: 10.0),
                child: Text('-'),
              ),
              Expanded(
                flex: 1,
                child: TextFormField(onChanged: (value) {
                  this.hp2 = value;
                }, validator: (value) {
                  if (hp1.isEmpty || hp2.isEmpty || hp3.isEmpty) {
                    return '';
                  } else {
                    return null;
                  }
                }),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0, bottom: 8.0, right: 10.0),
                child: Text('-'),
              ),
              Expanded(
                flex: 1,
                child: TextFormField(onChanged: (value) {
                  this.hp3 = value;
                }, validator: (value) {
                  if (hp1.isEmpty || hp2.isEmpty || hp3.isEmpty) {
                    return '';
                  } else {
                    return null;
                  }
                }),
              ),
            ],
          ),
          SizedBox(height: 50.0),
          GestureDetector(
            onTap: () async {
              if (checkFields()) {
                await UserRepository().checkUser(id).then((isExist) {
                  !isExist
                      ? _showAlert(
                          title: '????????? ?????????',
                          message: '?????? ???????????? ?????? ?????? ?????????.',
                          onPressed: () {
                            Navigator.pop(context);
                          })
                      : successLogin();
                });
              }
            },
            child: Container(
                height: 50.0,
                child: Material(
                    borderRadius: BorderRadius.circular(25.0),
                    shadowColor: Colors.tealAccent,
                    color: Theme.of(context).primaryColor,
                    elevation: 7.0,
                    child: Center(
                        child: Text('SIGN UP',
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'Trueno'))))),
          ),
          SizedBox(height: 20.0),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Text('Go back',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontFamily: 'Trueno',
                        decoration: TextDecoration.underline)))
          ])
        ]));
  }

  void successLogin() async {
    _showAlert(
        title: '???????????? ??????',
        message: '?????? ???????????? ????????? ????????????.',
        onPressed: () {
          Navigator.pop(context);
          Navigator.pop(context);
        });
    await UserRepository()
        .signUp(id: id, password: password, name: name, hp: '$hp1-$hp2-$hp3', email: email);
  }

  void _showAlert({String title, String message, VoidCallback onPressed}) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              CupertinoDialogAction(
                  isDefaultAction: true,
                  child: Text("??????"),
                  onPressed: onPressed)
            ],
          );
        });
  }
}
