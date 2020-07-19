import 'package:firebase_auth/firebase_auth.dart';
import 'package:quiz/user.dart';

class Authservice{
  FirebaseAuth_auth = FirebaseAuth.instance;

  User _userFromFirebaseUser(FirebaseUser user){
    return user != null ? User(uid: user.uid) : null;
  }

  future signInEmailAndPass(String email,  String password)async{

    try{
      AuthResult authResult = await_auth.signInWithEmailAndPassword
      (email:email, password: password);
      FirebaseUser firebaseUser = authResult.user;
      return _userFromFirebaseUser(firebaseUser);

    }catch(e){
      print(e.toString());
    }
  }

  Future signUpWithEmailAndPassword(String email,  String password)async{

    try{
      AuthResult authResult = await_auth.createUserWithEmailAndPassword
      (email:email, password: password);
      FirebaseUser firebaseUser = authResult.user;
      return _userFromFirebaseUser(firebaseUser);

    }catch(e){
      print(e.toString());
    }

  }
  Future signOut() async{

    try{
      return await auth.signOut();

    }catch(e) {
      print(e.toString());
      return null;
    }
  }
}