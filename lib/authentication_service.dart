import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter/services.dart';

class AuthenticationService{
  final FirebaseAuth _firebaseAuth;

  AuthenticationService(this._firebaseAuth);

  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signOut() async{
    await _firebaseAuth.signOut();
  }

  Future<String> signIn({String email, String password}) async{ //email: Kude@gmail.com password: qwerty1234
  
    try{
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return "You may proceed but there will be no next time";
    } on 
    //PlatformException catch (e){
    FirebaseException catch (e) {
      
      return e.message;
    }

  }

  Future<String> signUp({String email, String password}) async{
    try{
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      return "Succesfully sign up";
    } on FirebaseAuthException catch (e){
     
      return e.message;
    }
  }
}