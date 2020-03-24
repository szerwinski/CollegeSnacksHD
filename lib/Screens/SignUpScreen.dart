import 'package:collegesnacks/Models/UserModel.dart';
import 'package:collegesnacks/Widgets/CustomAppBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _emailController = new TextEditingController();
  final _passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    final _screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      key: _scaffoldKey,
      appBar: customAppBar(_screenHeight),
      body: Consumer<UserModel>(
        builder: (context, user, child){
          return Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      labelText: "Email"
                  ),
                  validator: (text){
                    if(text.isEmpty) return "Email inválido!";
                    else return null;
                  },
                ),
                SizedBox(height: 10.0,),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                      labelText: "Senha"
                  ),
                  validator: (text){
                    if(text.isEmpty) return "Senha inválida!";
                    else return null;
                  },
                ),
                SizedBox(height: 10.0,),
                RaisedButton(
                  onPressed: (){
                    if(_formKey.currentState.validate()){
                      print(_emailController.text);
                      user.signUp(email: _emailController.text, password: _passwordController.text, onSuccess: null, onFail: null);
                    }
                  },
                  child: Center(child: Text("Criar conta"),),
                )
              ],
            )
          );
        },
      )
    );
  }

  void _onSuccess() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text("Usuário criado com sucesso!"), duration: Duration(seconds: 2),)
    );
    Future.delayed(Duration(seconds: 2)).then((exit){
      Navigator.of(context).pop();
    });
  }

  void _onFail() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text("Usuário criado com sucesso!"),
      duration: Duration(seconds: 2),
    ));
  }
}
