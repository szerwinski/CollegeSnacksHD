import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class UserModel extends ChangeNotifier{

  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser firebaseUser;

  bool isLoading = false;

  @override
  void addListener(VoidCallback listener) {
    super.addListener(listener);
    loadUser();
  }

  bool isLoggedIn(){
    return firebaseUser != null;
  }

  Future<Null> signUp({@required String email, @required String password, @required VoidCallback onSuccess, @required VoidCallback onFail}){
    isLoading = true;
    notifyListeners();

    _auth.createUserWithEmailAndPassword(
        email: email,
        password: password
    ).then((newUser) async {
      firebaseUser = newUser.user;

      onSuccess();

      isLoading = false;
      notifyListeners();
    }).catchError((e){
      onFail();

      isLoading = false;
      notifyListeners();
    });
  }

  Future<Null> signIn({@required String email, @required String pass, VoidCallback onSuccess, VoidCallback onFailed}) async{
    isLoading = true;
    notifyListeners();

    await _auth.signInWithEmailAndPassword(email: email, password: pass).then((user) async{
      firebaseUser = user.user;

      onSuccess();

      isLoading = false;
      notifyListeners();
    }).catchError((e){
      onFailed();

      isLoading = false;
      notifyListeners();
    });
  }

  Future<Null> signOut() async {
    await _auth.signOut();

    firebaseUser = null;
    notifyListeners();
  }

  Future<Null> loadUser() async{ // Function to recover a logged user from Firebase (when it closes the app, for example)
    if(firebaseUser == null){
      isLoading = true;
      notifyListeners();
      firebaseUser = await  _auth.currentUser();
      isLoading = false;
      notifyListeners();
      print("Sem usuário");
    }
    else print("Usuário carregado");
  }
}