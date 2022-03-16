//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/config/app_router.dart';

import 'config/theme.dart';
import 'widgets/widgets.dart';
import 'screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JK SHOP',
      theme: theme(),
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: HomeScreen.routeName,
    );
  }
}