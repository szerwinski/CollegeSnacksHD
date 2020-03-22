import 'dart:math';
import 'package:collegesnacks/Datas/CategoryData.dart';
import 'package:collegesnacks/Datas/EstablishmentData.dart';
import 'package:collegesnacks/Screens/FavoritesScreen.dart';
import 'package:collegesnacks/Utils/getCategories.dart';
import 'package:collegesnacks/Utils/getEstablishment.dart';
import 'package:collegesnacks/Widgets/BottomNavigationBar.dart';
import 'package:collegesnacks/Widgets/CustomAppBar.dart';
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

    final _screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
        appBar: customAppBar(_screenHeight),
        body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: SearchBar(),
          ),
          Padding(
              padding: EdgeInsets.only(left: 15.0, top: 20.0),
              child: Text("Categorias", style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),)
          ),
          Container(
            padding: EdgeInsets.only(left: 15.0, top: 10.0),
            height: 100.0,
            child: FutureBuilder<List<CategoryData>>(
              future: getCategoriesList(),
              builder: (context, snapshot){
                if(!snapshot.hasData){
                  return Center(child: CircularProgressIndicator(),);
                }
                else return ListView(
                  scrollDirection: Axis.horizontal,
                  children: snapshot.data.map((data){
                    return Row(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                color: Colors.pink,
                                boxShadow: [
                                  BoxShadow(color: Colors.grey, blurRadius: 2.0, spreadRadius: 1.0)
                                ]
                              ),
                              height: 65.0,
                              width: 110.0,
                            ),
                            SizedBox(height: 5.0,),
                            Text(data.nome, style: TextStyle(fontSize: 12.0,),)
                          ],
                        ),
                        SizedBox(width: 10.0,)
                      ],
                    );
                  }).toList()
                );
              }
            )
          ),
          Padding(
              padding: EdgeInsets.only(left: 15.0, top: 5.0),
              child: Text("Promoções", style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),)
          ),
          Container(
              padding: EdgeInsets.only(left: 15.0, top: 5.0),
              height: 100.0,
              child: FutureBuilder<List<CategoryData>>(
                  future: getCategoriesList(),
                  builder: (context, snapshot){
                    if(!snapshot.hasData){
                      return Center(child: CircularProgressIndicator(),);
                    }
                    else return ListView(
                        scrollDirection: Axis.horizontal,
                        children: snapshot.data.map((data){
                          return Row(
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                        color: UniqueColorGenerator.getColor(),
                                        boxShadow: [
                                          BoxShadow(color: Colors.grey, blurRadius: 2.0, spreadRadius: 1.0)
                                        ]
                                    ),
                                    height: 65.0,
                                    width: 110.0,
                                  ),
                                  SizedBox(height: 5.0,),
                                  Text(data.nome, style: TextStyle(fontSize: 12.0,),)
                                ],
                              ),
                              SizedBox(width: 10.0,)
                            ],
                          );
                        }).toList()
                    );
                  }
              )
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(left: 20.0, top: 10.0, bottom: 5.0),
                  child: Text("Restaurantes", style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),)
              ),
              GestureDetector(
                onTap: (){},
                child: Container(
                  margin: EdgeInsets.only(right: 20.0),
                  padding: EdgeInsets.symmetric(horizontal: 3.0),
                  height: 22.0,
                  width: 75.0,
                  child: InkWell(
                    onTap: (){
                      _onOrderButtonPressed();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Ordenar", style: TextStyle(fontSize: 12.0),),
                        VerticalDivider(width: 2.0, color: Colors.black, indent: 5.0, endIndent: 5.0,),
                        Icon(Icons.list, size: 16.0,)
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 1.0,
                        spreadRadius: 1.0
                      )
                    ]
                  ),
                ),
              )
            ],
          ),
          FutureBuilder<List<EstablishmentData>>(
            future: getEstablishments(),
            builder: (context, snapshot){
              if(!snapshot.hasData){
                return Center(child: CircularProgressIndicator(),);
              }
              else return Column(
                children: snapshot.data.map((data){
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 15.0),
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
          )
        ],
      ),
      bottomNavigationBar: bottomNavigationBar(_pageController, 0)
    );
  }

  void _onOrderButtonPressed(){
    showModalBottomSheet(
      backgroundColor: Colors.grey[850],
      elevation: 10.0,
      useRootNavigator: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0)
        )
      ),
      context: context,
      builder: (context){
        return Container(
          height: 170.0,
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
                height: 5.0,
                width: 100.0,
                decoration: BoxDecoration(
                    color: Colors.grey[600],
                    borderRadius: BorderRadius.all(Radius.circular(10.0))
                ),
              ),
              Text("Ordenar por:", style: TextStyle(fontSize: 14.0, color: Colors.grey[300]),),
              Container(
                margin: EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Colors.pink,
                          radius: 35.0,
                          child: Icon(Icons.list, size: 35.0,)
                        ),
                        SizedBox(height: 10.0,),
                        Text("Padrão", style: TextStyle(fontSize: 12.0, color: Colors.grey[300]),)
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Colors.pink,
                          radius: 35.0,
                          child: Icon(Icons.attach_money, size: 35.0,)
                        ),
                        SizedBox(height: 10.0,),
                        Text("Preço", style: TextStyle(fontSize: 12.0, color: Colors.grey[300]),)
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Colors.pink,
                          radius: 35.0,
                          child: Icon(Icons.star, size: 35.0,)
                        ),
                        SizedBox(height: 10.0,),
                        Text("Avaliação", style: TextStyle(fontSize: 12.0, color: Colors.grey[300]),)
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        );
      });
  }
}

class UniqueColorGenerator{
  static Random random = new Random();
  static Color getColor() {
    return Color.fromARGB(255, random.nextInt(255), random.nextInt(255), random.nextInt(255));
  }
}