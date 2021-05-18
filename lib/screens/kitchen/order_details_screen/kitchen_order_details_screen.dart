import 'package:flutter/material.dart';
import 'package:summer_project/models/order.dart';
import 'package:summer_project/screens/kitchen/order_details_screen/local_widgets/kitchen_order_table.dart';
import 'package:summer_project/widgets/app_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:summer_project/widgets/app_button.dart';
import 'package:summer_project/widgets/app_container.dart';
import 'package:summer_project/widgets/app_table_components.dart';
import 'package:summer_project/widgets/order_no.dart';
import 'package:summer_project/widgets/sub_titles.dart';
import 'package:summer_project/widgets/table_no.dart';

import 'local_widgets/kitchen_status_chip.dart';

class KitchenOrderDetailsScreen extends StatelessWidget {
  final Order order;
  const KitchenOrderDetailsScreen({Key key, this.order}) : super(key: key);

  // dynamic _buildPopupDialog(BuildContext context) {
  //   print('METHOD CALLED');
  //   return showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       shape:
  //           RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.w)),
  //       title: const Text(
  //         'Select Status',
  //         textAlign: TextAlign.center,
  //       ),
  //       content: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         crossAxisAlignment: CrossAxisAlignment.center,
  //         children: <Widget>[
  //           KitchenStatusChip(status: 'READY', onPressed: () {}),
  //           KitchenStatusChip(status: 'NOT READY', onPressed: () {}),
  //           KitchenStatusChip(status: 'SERVED', onPressed: () {}),
  //         ],
  //       ),
  //     ),
  //   );
  // }

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
            KitchenOrderTable(list: order.orders),
            Divider(),
            Visibility(
              visible: order.additionalOrders.isEmpty ? false : true,
              child: Column(
                children: [
                  Subtitles(string: 'ADDITIONAL ORDERS'),
                  KitchenOrderTable(list: order.additionalOrders),
                  Divider(),
                ],
              ),
            ),
            AppButton(
              text: 'GO BACK',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
