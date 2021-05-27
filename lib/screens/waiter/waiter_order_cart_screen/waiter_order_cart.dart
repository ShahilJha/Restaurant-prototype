import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:summer_project/models/food_item.dart';
import 'package:summer_project/models/order.dart';
import 'package:summer_project/screens/waiter/waiter_order_cart_screen/local_widgets/waiter_order_cart_table.dart';
import 'package:summer_project/services/database_service.dart';
import 'package:summer_project/widgets/app_app_bar.dart';
import 'package:summer_project/widgets/app_button.dart';
import 'package:summer_project/widgets/app_container.dart';
import 'package:summer_project/widgets/order_no.dart';
import 'package:summer_project/widgets/sub_titles.dart';
import 'package:summer_project/widgets/table_no.dart';

class WaiterOrderCartScreen extends StatefulWidget {
  final Order order;
  final bool newOrderFlag;
  final List<FoodItem> newOrdersList;
  const WaiterOrderCartScreen(
      {Key key, @required this.order, this.newOrderFlag, this.newOrdersList})
      : super(key: key);

  @override
  _WaiterOrderCartScreenState createState() => _WaiterOrderCartScreenState();
}

class _WaiterOrderCartScreenState extends State<WaiterOrderCartScreen> {
  void printAll() {
    for (var item in widget.newOrdersList) {
      print('${item.id}: ${item.name} and ${item.quantity}');
    }
  }

  Order tempOrder;
  List<FoodItem> tempOrdersList;

  @override
  void initState() {
    super.initState();
    tempOrder = widget.order;
    tempOrdersList = widget.newOrdersList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KAppBar(
        title: 'ORDER CART',
      ),
      body: AppContainer(
        child: ListView(
          children: [
            Align(
              child: Column(
                children: [
                  TableNumber(tableNumber: widget.order.tableNumber),
                  OrderID(orderID: widget.order.id),
                ],
              ),
              alignment: Alignment.center,
            ),
            Divider(),
            Subtitles(string: 'ORDERS'),
            WaiterOrderCartTable(
              list: tempOrdersList,
              onItemChange: (changedList) {
                widget.newOrderFlag == true
                    ? tempOrdersList = changedList
                    : tempOrdersList = changedList;
              },
            ),
            Divider(),
            AppButton(
              text:
                  widget.newOrderFlag == true ? 'Place Order' : 'Add to Order',
              onPressed: () {
                if (widget.newOrderFlag == true) {
                  //Todo: fix problem/BUG of taking to login screen
                  tempOrder.orders = tempOrdersList;
                  DatabaseService.instance.createNewOrder(
                    order: tempOrder,
                    context: context,
                  );
                  // Navigator.pop(context);
                  Navigator.pop(context);
                } else {
                  if (widget.newOrderFlag == false) {
                    tempOrder.additionalOrders = [
                      ...tempOrder.additionalOrders,
                      ...tempOrdersList
                    ];
                  } else {
                    tempOrder.additionalOrders = tempOrdersList;
                  }
                  DatabaseService.instance.updateOrder(
                    order: tempOrder,
                    context: context,
                  );
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.pop(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
