import 'package:flutter/material.dart';
import 'package:summer_project/widgets/app_app_bar.dart';
import 'package:summer_project/widgets/app_container.dart';

import 'local_widgets/receptionist_order_tile.dart';

class ReceptionistOrderListScreen extends StatelessWidget {
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
              onPressed: () {
                Navigator.of(context).pushNamed('/receptionist_order_detail');
              },
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
