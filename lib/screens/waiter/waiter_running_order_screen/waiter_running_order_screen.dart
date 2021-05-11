import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:summer_project/widgets/app_app_bar.dart';
import 'package:summer_project/widgets/app_button.dart';
import 'package:summer_project/widgets/app_container.dart';

import 'local_widgets/waiter_order_tile.dart';

class WaiterRunningOrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KAppBar(
        title: 'RUNNING ORDERS',
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context)
              .pushNamed('/waiter_ordering_screen', arguments: true);
        },
      ),
      body: AppContainer(
        child: ListView(
          children: [
            WaiterOrderTile(
              tableNumber: 14,
              orderID: '2342',
              color: Colors.grey,
              onPressed: () {
                Navigator.of(context).pushNamed('/waiter_order_details_screen');
              },
            ),
          ],
        ),
      ),
    );
  }
}
