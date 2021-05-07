import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class FireBaseAuthService {
  FireBaseAuthService._privateConstructor();
  static final FireBaseAuthService instance =
      FireBaseAuthService._privateConstructor();

  static final _auth = FirebaseAuth.instance;

  Future createUser() async {
    try {
      print('LOG#1: -newUser--> START TO CREATE USER');
      final newUser = await _auth.createUserWithEmailAndPassword(
          email: 'shahil.jha@gmail.com', password: 'shahil');
      print('LOG#2: -newUser--> $newUser');
    } catch (e) {
      print('EXCEPTION: -create user--> $e');
    }
  }

  Future<UserCredential> signInUser({String email, String password}) async {
    UserCredential user;
    try {
      user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      print('LOG#!: -return of sign in--> $user');
    } catch (e) {
      print('EXCEPTION: -sign in user--> $e');
    }
    return user;
  }

  User get user => _auth.currentUser;
}
