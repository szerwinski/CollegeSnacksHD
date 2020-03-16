import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {

  final PageController pageController;
  CustomDrawer(this.pageController);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: <Widget>[
          ListView(
            padding: EdgeInsets.only(left: 24.0,top: 16.0),
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 8.0),
                padding: EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 8.0),
                height: 170.0,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                        top: 8.0,
                        left: 0.0,
                        child: Container(
                          height: 90,
                          width: 160,
                          child: Container()//Image.asset("assets/LogoCSapp2.png", fit: BoxFit.contain),
                        )
                    ),
                    Positioned(
                      left: 0.0,
                      bottom: 0.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Olá, ",
                            style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          GestureDetector(
                            child: Text(
                              "Entre ou cadastre-se",
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onTap: (){},
                          )
                        ],
                      )
                    )
                  ],
                ),
              ),
              Divider(),
              //DrawerTile(Icons.home,"Início", pageController, 0),
              //DrawerTile(Icons.shopping_cart,"Carrinho", pageController, 1),
              //DrawerTile(Icons.playlist_add_check,"Meus Pedidos", pageController, 2),
              //DrawerTile(Icons.settings, "Preferências", pageController, 3)
            ],
          )
        ],
      ),
    );
  }
}
