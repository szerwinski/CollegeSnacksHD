import 'dart:math';
import 'package:collegesnacks/Datas/EstablishmentData.dart';
import 'package:collegesnacks/Utils/getEstablishment.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatefulWidget {
  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<EstablishmentData>>(
      future: getEstablishments(),
      builder: (context, snapshot){
        if(!snapshot.hasData){
          return Center(child: CircularProgressIndicator(),);
        }
        else return Column(
          children: snapshot.data.map((data){
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              height: 100.0,
              width: double.infinity,
              child: Card(
                  elevation: 5.0,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          flex: 1,
                          child: Container(
                              color: UniqueColorGenerator.getColor()
                          )
                      ),
                      VerticalDivider(width: 2.0, color: Colors.black87,),
                      Expanded(
                          flex: 2,
                          child: Column(
                            children: <Widget>[
                              Text(data.nome),
                            ],
                          )
                      )
                    ],
                  )
              ),
            );
          }).toList(),
        );
      },
    );
  }
}

class UniqueColorGenerator{
  static Random random = new Random();
  static Color getColor() {
    return Color.fromARGB(255, random.nextInt(255), random.nextInt(255), random.nextInt(255));
  }
}