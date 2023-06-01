import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../../../Constant/const_methods.dart';


class FirebaseAuthHelper{
  static FirebaseAuthHelper instance=FirebaseAuthHelper();
  final FirebaseAuth _auth=FirebaseAuth.instance;
  Stream<User?> get getAuthChange => _auth.authStateChanges();

  Future<bool> login(String email,String pass,BuildContext context) async{
    try{
      showLoaderDialog(context);
      await _auth.signInWithEmailAndPassword(email: email, password: pass);
      Navigator.pop(context);
      return true;
    }
    on FirebaseAuthException catch(error){
      Navigator.pop(context);
      showMessages(error.code);
      return false;
    }
  }

  Future<bool> signUp(String email,String pass,BuildContext context) async{
    try{
      showLoaderDialog(context);
      await _auth.createUserWithEmailAndPassword(email: email, password: pass);
      Navigator.pop(context);
      return true;
    }
    on FirebaseAuthException catch(error){
      Navigator.pop(context);
      showMessages(error.code);
      return false;
    }
  }

}