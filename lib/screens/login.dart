import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_wedding_test/blocs/authentication/bloc.dart';
import 'package:my_wedding_test/screens/home_nav.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController idController = TextEditingController();
  final TextEditingController pswController = TextEditingController();
  AuthenticationBloc _authenticationBloc;

  @override
  void initState() {
    super.initState();
    _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
        cubit: _authenticationBloc,
        listener: (context, state){
          if (state is AuthenticationFailure) {
            _showAlert(
                title: "로그인 실패", message: "다시 시도해주세요");
            _authenticationBloc.add(AuthenticationStarted());
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('assets/logo/logo_transparent.png',
                        height: 300),
                    TextFormField(
                      controller: idController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xffffffff),
                        hintText: '아이디',
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.primary)),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      controller: pswController,
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xffffffff),
                        hintText: '비밀번호',
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.primary)),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeNav()),
                              );
                            },
                            child: Text(
                              '회원가입',
                              style: TextStyle(color: Colors.grey),
                            )),
                        SizedBox(
                          width: 15.0,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              _authenticationBloc.add(
                                  AuthenticationLoggedIn(
                                      id: idController.text,
                                      pwd: pswController.text));
                            },
                            child: Text('Login')),
                        SizedBox(width: 15.0)
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
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
                  isDefaultAction: true,
                  child: Text("확인"),
                  onPressed: () {
                    Navigator.pop(context);
                  })
            ],
          );
        });
  }
}
