import 'package:flutter/material.dart';
import 'package:summer_project/screens/waiter/ordering_screen/waiter_ordering_screen.dart';
import 'screens/common/login/login_screen.dart';
import 'screens/kitchen/order_details_screen/kitchen_order_details_screen.dart';
import 'screens/kitchen/running_order_screen/kitchen_running_order_screen.dart';
import 'screens/receptionist/order_details_screen/receptionist_order_details_screen.dart';
import 'screens/receptionist/order_list_screen/receptionist_order_list_screen.dart';
import 'screens/waiter/waiter_order_details_screen/waiter_order_details_screen.dart';
import 'screens/waiter/waiter_running_order_screen/waiter_running_order_screen.dart';

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

      //RECEPTIONIST Routes
      case '/receptionist_order_detail':
        return MaterialPageRoute(
            builder: (_) => ReceptionistOrderDetailsScreen());

      case '/receptionist_running_orders':
        return MaterialPageRoute(builder: (_) => ReceptionistOrderListScreen());

      //KITCHEN Routes

      case '/kitchen_running_orders':
        return MaterialPageRoute(builder: (_) => KitchenOrderListScreen());

      case '/kitchen_order_details':
        return MaterialPageRoute(builder: (_) => KitchenOrderDetailsScreen());

      //WAITER Routes
      case '/waiter_running_order_screen':
        return MaterialPageRoute(builder: (_) => WaiterRunningOrderScreen());

      case '/waiter_order_details_screen':
        return MaterialPageRoute(builder: (_) => WaiterOrderDetailsScreen());

      case '/waiter_ordering_screen':
        return MaterialPageRoute(builder: (_) => WaiterOrderingScreen());

      //ERROR Route
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
