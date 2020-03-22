import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget customAppBar(final _screenHeight){
  return PreferredSize(
      preferredSize: Size(double.infinity, _screenHeight/12),
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.pink,
                      blurRadius: 2.0,
                      spreadRadius: 3.0
                  )
                ]
            ),
          ),
          AppBar(
              backgroundColor: Colors.grey[850],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15.0), bottomRight: Radius.circular(15.0))
              ),
              flexibleSpace: Align(
                alignment: Alignment(0.0, 0.4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("College ", style: GoogleFonts.eBGaramond(
                        textStyle: TextStyle(fontSize: 24.0, color: Colors.grey[100])
                    ),),
                    Container(
                      padding: EdgeInsets.only(top: 5.0),
                      height: 40.0,
                      width: 40.0,
                      child: Image.asset("assets/DonutLogo.png"),
                    ),
                    Text(" Snacks ", style: GoogleFonts.eBGaramond(
                        textStyle: TextStyle(fontSize: 24.0, color: Colors.grey[100])
                    ),),
                  ],
                ),
              )
          )
        ],
      )
  );
}
