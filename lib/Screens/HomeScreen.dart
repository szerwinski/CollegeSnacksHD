import 'package:collegesnacks/Widgets/CustomDrawer.dart';
import 'package:collegesnacks/Widgets/SearchBar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {

  PageController _pageController;
  HomeScreen(this._pageController);

  @override
  _HomeScreenState createState() => _HomeScreenState(_pageController);
}

class _HomeScreenState extends State<HomeScreen> {

  PageController _pageController;
  _HomeScreenState(this._pageController);

  @override
  Widget build(BuildContext context){

    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      drawer: CustomDrawer(_pageController),
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, screenHeight/9.5),
        child: AppBar(
          backgroundColor: Colors.blue,
          elevation: 10.0,
          bottomOpacity: 10.0,
          /*flexibleSpace: Image(
            image: AssetImage('assets/HomeScreenLogo.jpeg'),
            fit: BoxFit.contain
          ),*/
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(25),
            ),
          ),
        )
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SearchBar(),
      ),
    );
  }
}

