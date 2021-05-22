import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_wedding_test/blocs/authentication/bloc.dart';
import 'package:my_wedding_test/blocs/my_bloc_observer.dart';
import 'package:my_wedding_test/repository/user_repository.dart';
import 'package:my_wedding_test/screens/home.dart';
import 'package:my_wedding_test/screens/login.dart';
import 'package:bloc/bloc.dart';
import 'package:my_wedding_test/screens/splash.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final UserRepository userRepository = UserRepository();
  AuthenticationBloc _authenticationBloc;

  @override
  void initState(){
    super.initState();
    _authenticationBloc = AuthenticationBloc(userRepository: userRepository);
    Timer(Duration(seconds: 5),(){
      _authenticationBloc.add(AuthenticationStarted());
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _authenticationBloc,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'MyWedding',
          theme: ThemeData(
            primarySwatch: Colors.teal,
          ),
          home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state){
              if(state is AuthenticationSuccess){
                return HomePage();
              }else if(state is AuthenticationInitial){
                return SplashScreen();
              }else{
                return LoginPage();
              }
            },
          )
      ),
    );
  }
}
