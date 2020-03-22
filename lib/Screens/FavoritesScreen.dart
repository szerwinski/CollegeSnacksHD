import 'package:collegesnacks/Widgets/BottomNavigationBar.dart';
import 'package:collegesnacks/Widgets/CustomAppBar.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatefulWidget {

  final PageController _pageController;
  FavoritesScreen(this._pageController);

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState(_pageController);
}

class _FavoritesScreenState extends State<FavoritesScreen> {

  final PageController _pageController;
  _FavoritesScreenState(this._pageController);

  @override
  Widget build(BuildContext context) {

    final _screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(_screenHeight),
      bottomNavigationBar: bottomNavigationBar(_pageController, 1),
    );
  }
}
