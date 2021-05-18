import 'package:flutter/material.dart';
import 'package:summer_project/models/order.dart';
import 'package:summer_project/services/database_service.dart';
import 'package:summer_project/widgets/app_app_bar.dart';
import 'package:summer_project/widgets/app_button.dart';
import 'package:summer_project/widgets/app_container.dart';
import 'package:summer_project/widgets/order_no.dart';
import 'package:summer_project/widgets/sub_titles.dart';
import 'package:summer_project/widgets/table_no.dart';

import 'local_widgets/kitchen_order_table.dart';

class KitchenOrderDetailsScreen extends StatelessWidget {
  final Order order;
  const KitchenOrderDetailsScreen({Key key, this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KAppBar(
        title: 'ORDER DETAILS',
      ),
      body: AppContainer(
        child: ListView(
          children: [
            Align(
              child: Column(
                children: [
                  TableNumber(tableNumber: order.tableNumber),
                  OrderID(orderID: order.id),
                ],
              ),
              alignment: Alignment.center,
            ),
            Divider(),
            Subtitles(string: 'ORDERS'),
            KitchenOrderTable(
              list: order.orders,
              onStatusChange: (changedList) {
                order.orders = changedList;
              },
            ),
            Divider(),
            Visibility(
              visible: order.additionalOrders.isEmpty ? false : true,
              child: Column(
                children: [
                  Subtitles(string: 'ADDITIONAL ORDERS'),
                  KitchenOrderTable(
                    list: order.additionalOrders,
                    onStatusChange: (changedList) {
                      order.additionalOrders = changedList;
                    },
                  ),
                  Divider(),
                ],
              ),
            ),
            AppButton(
              text: 'NOTIFY',
              onPressed: () {
                Navigator.pop(context);
                DatabaseService.instance.updateOrder(order);
              },
            ),
          ],
        ),
      ),
    );
  }
}
