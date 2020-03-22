import 'package:collegesnacks/Widgets/BottomNavigationBar.dart';
import 'package:collegesnacks/Widgets/CustomAppBar.dart';
import 'package:flutter/material.dart';

class PromotionsScreen extends StatefulWidget {

  PageController _pageController;
  PromotionsScreen(this._pageController);

  @override
  _PromotionsScreenState createState() => _PromotionsScreenState(_pageController);
}

class _PromotionsScreenState extends State<PromotionsScreen> {

  PageController _pageController;
  _PromotionsScreenState(this._pageController);

  @override
  Widget build(BuildContext context) {

    final _screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(_screenHeight),
      bottomNavigationBar: bottomNavigationBar(_pageController, 2),
    );
  }
}
