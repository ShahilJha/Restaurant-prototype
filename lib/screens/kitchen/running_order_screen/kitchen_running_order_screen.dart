import 'package:flutter/material.dart';
import 'package:summer_project/screens/kitchen/running_order_screen/local_widgets/kitchen_order_tile.dart';
import 'package:summer_project/widgets/app_app_bar.dart';
import 'package:summer_project/widgets/app_container.dart';

class KitchenOrderListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KAppBar(
        title: 'RUNNING ORDERS',
      ),
      body: AppContainer(
        child: ListView(
          children: [
            KitchenOrderTile(
              tableNumber: 14,
              orderNumber: 1231,
              colorCode: Colors.red,
              status: 'New',
              onPressed: () {},
            ),
            KitchenOrderTile(
              tableNumber: 15,
              orderNumber: 1232,
              colorCode: Colors.green,
              status: 'completed',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
