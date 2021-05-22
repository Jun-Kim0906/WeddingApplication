import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool trans = false;

  @override
  void initState() {
    super.initState();
    Timer(Duration(microseconds: 1),(){
      setState(() {
        trans = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        AnimatedPositioned(
            left: trans ? -700.0 : -10.0,
            curve: Curves.easeInOutCubic,
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Image.asset('assets/wedding/wedding1.webp'),
            ),
            duration: Duration(milliseconds: 4500)),
        Positioned(
            right: 0.0,
            left: 0.0,
            bottom: 50.0,
            child: Image.asset(
              'assets/logo/logo_transparent.png',
              height: 300.0,
            )),
      ],
    )
        // Center(
        //   child: Image.asset('assets/logo/logo_transparent.png', height: 300),
        // ),
        );
  }
}
