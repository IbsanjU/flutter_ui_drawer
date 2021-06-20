// https://www.github.com/@IbsanjU

import 'package:flutter/material.dart';
import 'package:flutter_ui_drawer/DrawerScreen/DrawerScreen.dart';
import 'package:flutter_ui_drawer/HomeScreen/HomeScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter UI',
        theme: ThemeData(fontFamily: 'Circular'),
        home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 600),
          child: Stack(
            children: [
              DrawerScreen(),
              HomeScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
