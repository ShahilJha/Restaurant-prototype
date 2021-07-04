import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:summer_project/enumerators.dart';
import 'package:summer_project/services/database_service.dart';
import 'package:summer_project/utils/utility.dart';

class UserAuthService {
  UserAuthService._privateConstructor();
  static final UserAuthService instance = UserAuthService._privateConstructor();

  static final _auth = FirebaseAuth.instance;
  dynamic _user;
  dynamic get user => _user;

  //TODO: <<-----------TEST----------->>
  Future createUser({
    String email,
    String gender,
    String name,
    JobPosition position,
  }) async {
    try {
      print('LOG#1: -newUser--> START TO CREATE USER');
      final newUser = await _auth.createUserWithEmailAndPassword(
          email: email, password: '123456');
      print('LOG#2: -newUser--> authenticated  for email and password');
      print('LOG#3: -newUser--> $newUser');
      // DatabaseService.instance.

      DatabaseService.instance.addNewStaffMemberDetails(
        id: newUser.user.uid,
        registrationDate: DateTime.now(),
        address: 'Nepal',
        gender: gender,
        contactNumber: '9849000000',
        userName: name,
        position: position,
      );
    } catch (e) {
      print('EXCEPTION: -create user--> $e');
    }
  }

  //TODO: <<-----------TEST----------->>
  final List<Map<String, dynamic>> dummyUserList = [
    {
      'email': 'sabin@gmail.com',
      'gender': 'male',
      'name': 'saw ben',
      'position': JobPosition.Waiter,
    },
    {
      'email': 'ananda@gmail.com',
      'gender': 'male',
      'name': 'ananda',
      'position': JobPosition.KitchenStaff,
    },
    {
      'email': 'prashant@gmail.com',
      'gender': 'male',
      'name': 'prashant',
      'position': JobPosition.KitchenStaff,
    },
    {
      'email': 'sangin@gmail.com',
      'gender': 'male',
      'name': 'sagnin',
      'position': JobPosition.Receptionist,
    },
  ];

  //TODO: <<-----------TEST----------->>
  void makeDummyUser() async {
    for (var user in dummyUserList) {
      await createUser(
        email: user['email'],
        gender: user['gender'],
        name: user['name'],
        position: user['position'],
      );
    }
  }

  Future<void> logOutUser() async {
    await _auth.signOut();
  }

  Future<dynamic> signInUser(
      {String email,
      String password,
      JobPosition jobPosition,
      BuildContext context}) async {
    try {
      UserCredential user = await _auth
          .signInWithEmailAndPassword(
              email: email.trim().toLowerCase(), password: password)
          .catchError((err) {
        Navigator.pop(context);
        Utility.showSnackBar(context, message: err.message.toString());
      });
      final appUser =
          await DatabaseService.instance.getStaffDetailsByID(user.user.uid);
      _user = appUser;

      // print('LOG CHECK: $_user');
      if (_user != null) {
        if (jobPosition == null) {
          Navigator.pop(context);
          Utility.showSnackBar(context,
              message: 'Please, choose a job position.');
        } else if (jobPosition != _user.jobPosition) {
          Navigator.pop(context);
          Utility.showSnackBar(context,
              message: 'Incorrect Job Position Input.');
        } else if (jobPosition == _user.jobPosition) {
          Navigator.pop(context); //pops circular indicator
          Navigator.pop(context); //pops login screen
          Navigator.of(context).pushNamed(_getLoginRoute(_user.jobPosition));
        }
      } else {
        Navigator.pop(context);
        Utility.showSnackBar(context,
            message: 'Error in Logging-in.\nPlease Check Input Details.');
      }

      return appUser;
    } catch (e) {
      print('EXCEPTION: -signInUser--> $e');
    }
  }

  String _getLoginRoute(JobPosition jobPosition) {
    if (jobPosition == JobPosition.Waiter) {
      return '/waiter_running_order_screen';
    } else if (jobPosition == JobPosition.KitchenStaff) {
      return '/kitchen_running_orders';
    } else if (jobPosition == JobPosition.Receptionist) {
      return '/receptionist_running_orders';
    } else {
      return '/';
    }
  }
}
