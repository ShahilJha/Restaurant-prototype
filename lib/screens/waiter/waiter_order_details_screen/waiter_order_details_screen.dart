import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:summer_project/models/order.dart';
import 'package:summer_project/services/database_service.dart';
import 'package:summer_project/widgets/app_app_bar.dart';
import 'package:summer_project/widgets/app_button.dart';
import 'package:summer_project/widgets/app_container.dart';
import 'package:summer_project/widgets/order_no.dart';
import 'package:summer_project/widgets/sub_titles.dart';
import 'package:summer_project/widgets/table_no.dart';

import 'local_widgets/waiter_order_detail_table.dart';

class WaiterOrderDetailsScreen extends StatelessWidget {
  final Order order;
  const WaiterOrderDetailsScreen({Key key, this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KAppBar(
        title: 'ORDER DETAILS',
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_circle_outline_rounded),
        onPressed: () {
          Navigator.of(context)
              .pushNamed('/waiter_ordering_screen', arguments: false);
        },
      ),
      body: AppContainer(
        child: ListView(
          children: [
            Align(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TableNumber(tableNumber: order.tableNumber),
                  OrderID(orderID: order.id),
                ],
              ),
              alignment: Alignment.center,
            ),
            Divider(),
            Subtitles(string: 'ORDERS'),
            WaiterOrderDetailTable(
              list: order.orders,
              onItemChange: (changedList) {
                order.orders = changedList;
              },
            ),
            Divider(),
            Visibility(
              visible: order.additionalOrders.isEmpty ? false : true,
              child: Column(
                children: [
                  Subtitles(string: 'ADDITIONAL ORDERS'),
                  WaiterOrderDetailTable(
                    list: order.additionalOrders,
                    onItemChange: (changedList) {
                      order.additionalOrders = changedList;
                    },
                  ),
                  Divider(),
                ],
              ),
            ),
            AppButton(
              text: 'GO BACK',
              onPressed: () {
                //TODO: update the order in the DB
                // DatabaseService.instance.updateOrder(order);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
