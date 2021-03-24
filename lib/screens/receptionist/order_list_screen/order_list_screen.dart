import 'package:flutter/material.dart';
import 'package:summer_project/widgets/app_app_bar.dart';
import 'package:summer_project/widgets/app_container.dart';

import 'local_widgets/receptionist_order_tile.dart';

class OrderListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KAppBar(
        title: 'RUNNING ORDERS',
      ),
      body: AppContainer(
        child: ListView(
          children: [
            ReceptionistOrderTile(
              tableNumber: 14,
              orderNumber: 1341,
              customerName: 'Shahil Jha',
              customerContact: '98********',
              onPressed: () {},
            ),
            ReceptionistOrderTile(
              tableNumber: 14,
              orderNumber: 1341,
              customerName: 'Shahil Jha',
              customerContact: '98********',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
