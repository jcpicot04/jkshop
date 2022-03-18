import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/splash';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => SplashScreen(),
    );
  }


  const SplashScreen();

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 2), (() => Navigator.pushNamedAndRemoveUntil(context,'/',(Route<dynamic> route) => false)));

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image(
              image: AssetImage('assets/images/logo.png'),
              width: 500,
              height: 500,
            ),
          ),
          Container(
            color: Colors.black,
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
            child: Text(
              'Bienvenido!',
              style: Theme.of(context).textTheme.headline1!.copyWith(color: Colors.white),
            ),
          )
        ],
      )
    );
  } 
}