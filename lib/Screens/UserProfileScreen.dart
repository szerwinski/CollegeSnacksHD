import 'package:collegesnacks/Models/UserModel.dart';
import 'package:collegesnacks/Screens/SignUpScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UserProfileScreen extends StatefulWidget {
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 30.0, left: 20.0),
          child: Text("Meu perfil", style: GoogleFonts.nunito(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.grey[900],
          )),
        ),
        Divider(thickness: 2.0, color: Colors.grey[350], endIndent: 20.0, indent: 20.0,),
        Consumer<UserModel>(
          builder: (context, user, child){
            return Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  height: 190.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.pink[400],
                      borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.0, left: 20.0, right: 30.0),
                  height: 190.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(234, 205, 168, 1),
                      borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.0, left: 20.0, right: 40.0),
                  height: 190.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.grey[850],
                      borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 40.0, left: 40.0, right: 40.0),
                    height: 190.0,
                    width: double.infinity,
                    color: Colors.transparent,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Bem-Vindo!", style: TextStyle(fontSize: 30.0, color: Colors.white),),
                        SizedBox(height: 5.0,),
                        Text("Para continuar, faça login \nou cadastre-se.", style: TextStyle(fontSize: 14.0, color: Colors.white),),
                        SizedBox(height: 5.0,),
                        Divider(thickness: .5, color: Colors.grey[350], endIndent: 20.0,),
                        SizedBox(height: 10.0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            InkWell(
                              onTap: (){},
                              child: Container(
                                  height: 40.0,
                                  width: 70.0,
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(234, 205, 168, 1),
                                      borderRadius: BorderRadius.all(Radius.circular(10.0))
                                  ),
                                  child: Center(
                                    child: Text("Entrar", style: GoogleFonts.bungeeShade(
                                        fontSize: 12.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500
                                    )),
                                  )
                              ),
                            ),
                            SizedBox(width: 20.0,),
                            InkWell(
                              onTap: (){
                                Navigator.push((context), MaterialPageRoute(builder: (context) => SignUpScreen()));
                              },
                              child: Container(
                                  height: 40.0,
                                  width: 120.0,
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(234, 205, 168, 1),
                                      borderRadius: BorderRadius.all(Radius.circular(10.0))
                                  ),
                                  child: Center(
                                    child: Text("Criar Conta", style: GoogleFonts.bungeeShade(
                                        fontSize: 12.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500
                                    )),
                                  )
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                ),
              ],
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.credit_card, color: Colors.grey[800]),
          title: Text("Meios de pagamento", style: GoogleFonts.nunito(
            color: Colors.grey[850]
          )),
          contentPadding: EdgeInsets.only(left: 20.0),
        ),
        ListTile(
          leading: Icon(Icons.local_offer, color: Colors.grey[800]),
          title: Text("Promoções", style: GoogleFonts.nunito(
              color: Colors.grey[850]
          )),
          contentPadding: EdgeInsets.only(left: 20.0),
        ),
        ListTile(
          leading: Icon(Icons.help_outline, color: Colors.grey[800]),
          title: Text("Ajuda", style: GoogleFonts.nunito(
              color: Colors.grey[850]
          )),
          contentPadding: EdgeInsets.only(left: 20.0),
        ),
        ListTile(
          leading: Icon(Icons.info_outline, color: Colors.grey[800]),
          title: Text("Sobre", style: GoogleFonts.nunito(
              color: Colors.grey[850]
          )),
          contentPadding: EdgeInsets.only(left: 20.0),
        )
      ],
    );
  }
}

/*
if(user.isLoading){
              return Center(child: CircularProgressIndicator(),);
            }
            else if(!user.isLoading && !user.isLoggedIn()){
              return Center(child: Icon(Icons.not_interested),);
            }
            else{
              return Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    height: 190.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.pink[400],
                        borderRadius: BorderRadius.all(Radius.circular(10.0))
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.0, left: 20.0, right: 30.0),
                    height: 190.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(234, 205, 168, 1),
                        borderRadius: BorderRadius.all(Radius.circular(10.0))
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.0, left: 20.0, right: 40.0),
                    height: 190.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.grey[850],
                        borderRadius: BorderRadius.all(Radius.circular(10.0))
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 30.0, left: 40.0, right: 40.0),
                      height: 190.0,
                      width: double.infinity,
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Bem-Vindo!", style: TextStyle(fontSize: 30.0, color: Colors.white),),
                          SizedBox(height: 5.0,),
                          Text("Para continuar, faça login \nou cadastre-se.", style: TextStyle(fontSize: 14.0, color: Colors.white),),
                          SizedBox(height: 5.0,),
                          Divider(thickness: .5, color: Colors.grey[350], endIndent: 20.0,),
                          SizedBox(height: 10.0,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              InkWell(
                                onTap: (){},
                                child: Container(
                                    height: 40.0,
                                    width: 70.0,
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(234, 205, 168, 1),
                                        borderRadius: BorderRadius.all(Radius.circular(10.0))
                                    ),
                                    child: Center(
                                      child: Text("Entrar", style: GoogleFonts.bungeeShade(
                                          fontSize: 12.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500
                                      )),
                                    )
                                ),
                              ),
                              SizedBox(width: 20.0,),
                              InkWell(
                                onTap: (){},
                                child: Container(
                                    height: 40.0,
                                    width: 120.0,
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(234, 205, 168, 1),
                                        borderRadius: BorderRadius.all(Radius.circular(10.0))
                                    ),
                                    child: Center(
                                      child: Text("Criar Conta", style: GoogleFonts.bungeeShade(
                                          fontSize: 12.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500
                                      )),
                                    )
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                  ),
                ],
              );
            }
 */
