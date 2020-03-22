import 'package:collegesnacks/Screens/FavoritesScreen.dart';
import 'package:collegesnacks/Screens/HomeScreen.dart';
import 'package:collegesnacks/Screens/PromotionsScreen.dart';
import 'package:collegesnacks/Widgets/CustomAppBar.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavBar(),
    )
  );
}

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _initialPage = 0;

  HomeScreen _homeScreen = new HomeScreen();
  FavoritesScreen _favoritesScreen = new FavoritesScreen();
  PromotionsScreen _promotionsScreen = new PromotionsScreen();

  Widget _showPage = new HomeScreen();

  Widget _pageChooser(int page){
    switch(page){
      case 0:
        return _homeScreen;
        break;
      case 1:
        return _favoritesScreen;
        break;
      case 2:
        return _promotionsScreen;
        break;
    }
  }

  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {

    final _screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: customAppBar(_screenHeight),
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: _initialPage,
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
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.grey[350],
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 200),
          onTap: (index) {
            setState(() {
              _showPage = _pageChooser(index);
            });
          },
        ),
        body: _showPage
    );
  }
}