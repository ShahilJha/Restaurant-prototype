import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:summer_project/screens/common/login/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Error!'),
              centerTitle: true,
            ),
            body: Center(
              child: Text('Some Error Occurred.\nPlease Try Again Later.'),
            ),
          );
        }

        if (snapshot.hasData) {
          return LoginScreen();
        }

        return Scaffold(
          body: Center(
            child: Image.asset(
              'assets/images/logo.png',
              height: 500,
              width: 500,
            ),
          ),
        );
      },
    );
  }
}
