import 'package:flutter/material.dart';
import 'package:summer_project/screens/common/login/login.dart';

/*
  To Navigate to another screen:
    Navigator.of(context).pushNamed(
      '/route_name',
      arguments : data_arguents,
     );
*/

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    //Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      default:
        //If there is no route that has been redirected to.
        return _errorRoute();
    }
  }

  //ERROR Screen Message for illegal route call
  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Center(
            child: Text('ERROR ROUTE'),
          ),
        ),
      );
    });
  }
}
