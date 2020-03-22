import 'package:collegesnacks/Screens/FavoritesScreen.dart';
import 'package:collegesnacks/Screens/HomeScreen.dart';
import 'package:flutter/material.dart';

import 'Screens/PromotionsScreen.dart';

void main() => runApp(MyApp());

PageController _pageController = new PageController();

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
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          HomeScreen(_pageController),
          FavoritesScreen(_pageController),
          PromotionsScreen(_pageController),
        ],
      )
    );
  }
}

