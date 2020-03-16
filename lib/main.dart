import 'package:collegesnacks/Screens/HomeScreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

PageController pageController = new PageController();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'College Snacks HD',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PageView(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          HomeScreen(pageController)
        ],
      )
    );
  }
}

