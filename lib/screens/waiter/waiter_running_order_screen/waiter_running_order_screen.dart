import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:summer_project/widgets/app_app_bar.dart';
import 'package:summer_project/widgets/app_container.dart';

import 'local_widgets/waiter_order_tile.dart';

class WaiterRunningOrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KAppBar(
        title: 'RUNNING ORDERS',
      ),
      body: AppContainer(
        child: ListView(
          children: [
            WaiterOrderTile(
                tableNumber: null,
                orderNumber: null,
                customerName: null,
                customerContact: null,
                onPressed: null)
          ],
        ),
      ),
    );
    ;
  }
}
