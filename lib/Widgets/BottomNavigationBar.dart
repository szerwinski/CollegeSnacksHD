import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

Widget bottomNavigationBar(PageController _pageController, int index){
  return CurvedNavigationBar(
    index: index,
    color: Colors.white,
    backgroundColor: Colors.grey[350],
    buttonBackgroundColor: Colors.white,
    height: 47.0,
    items: <Widget>[
      Icon(
        Icons.home,
        size: 20.0, color:
      Colors.black,
      ),
      Icon(
        Icons.favorite_border,
        size: 20.0, color:
      Colors.black,
      ),
      Icon(
        Icons.list,
        size: 20.0, color:
      Colors.black,
      ),
      Icon(
        Icons.person,
        size: 20.0, color:
      Colors.black,
      ),
    ],
    animationDuration: Duration(milliseconds: 200),
    animationCurve: Curves.bounceInOut,
    onTap: (index){
      _pageController.jumpToPage(index);
      print(index);
    },
  );
}