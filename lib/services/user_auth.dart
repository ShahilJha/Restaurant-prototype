import 'package:firebase_auth/firebase_auth.dart';
import 'package:summer_project/enumerators.dart';
import 'package:summer_project/services/database_service.dart';

class UserAuthService {
  UserAuthService._privateConstructor();
  static final UserAuthService instance = UserAuthService._privateConstructor();

  static final _auth = FirebaseAuth.instance;
  dynamic _user;
  dynamic get user => _user;

  //<<-----------TEST----------->>
  Future createUser() async {
    try {
      print('LOG#1: -newUser--> START TO CREATE USER');
      final newUser = await _auth.createUserWithEmailAndPassword(
          email: 'shahil.jha@gmail.com', password: 'shahil');
      print('LOG#2: -newUser--> authenticated  for email and password');
      print('LOG#3: -newUser--> $newUser');
      // DatabaseService.instance.

      DatabaseService.instance.addNewStaffMemberDetails(
        id: newUser.user.uid,
        registrationDate: DateTime.now(),
        address: 'Kalanki',
        gender: 'Male',
        contactNumber: '9849000000',
        userName: 'shahil jha',
        position: JobPosition.Receptionist,
      );
    } catch (e) {
      print('EXCEPTION: -create user--> $e');
    }
  }

  Future<dynamic> signInUser({String email, String password}) async {
    try {
      UserCredential user = await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password);
      final appUser =
          await DatabaseService.instance.getStaffDetailsByID(user.user.uid);
      _user = appUser;
      return appUser;
    } catch (e) {
      print('EXCEPTION: -signInUser--> $e');
    }
  }
}
