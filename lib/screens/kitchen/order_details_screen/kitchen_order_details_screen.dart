import 'package:flutter/material.dart';
import 'package:summer_project/models/order.dart';
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

  dynamic _buildPopupDialog(BuildContext context) {
    print('METHOD CALLED');
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.w)),
        title: const Text(
          'Select Status',
          textAlign: TextAlign.center,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            KitchenStatusChip(status: 'READY', onPressed: () {}),
            KitchenStatusChip(status: 'NOT READY', onPressed: () {}),
            KitchenStatusChip(status: 'SERVED', onPressed: () {}),
          ],
        ),
      ),
    );
  }

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
                  TableNumber(tableNumber: 12),
                  OrderID(orderID: '23'),
                ],
              ),
              alignment: Alignment.center,
            ),
            Divider(),
            Subtitles(string: 'ORDERS'),
            AppTable(
              columnWidths: {
                0: FractionColumnWidth(0.15),
                1: FractionColumnWidth(0.4),
                2: FractionColumnWidth(0.1),
                3: FractionColumnWidth(0.35),
              },
              headerChildren: [
                AppHeaderCell(string: 'S.N'),
                AppHeaderCell(string: 'NAME'),
                AppHeaderCell(string: 'QTY'),
                AppHeaderCell(string: 'STATUS'),
              ],
              dataChildren: [
                TableRow(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                  ),
                  children: [
                    AppDataCell(string: '1'),
                    AppDataCell(string: 'Food 1'),
                    AppDataCell(string: '2'),
                    KitchenStatusChip(
                      status: 'READY',
                      onPressed: () => _buildPopupDialog(context),
                    ),
                  ],
                ),
              ],
            ),
            Divider(),
            Subtitles(string: 'ADDITIONAL ORDERS'),
            AppTable(
              columnWidths: {
                0: FractionColumnWidth(0.15),
                1: FractionColumnWidth(0.4),
                2: FractionColumnWidth(0.1),
                3: FractionColumnWidth(0.35),
              },
              headerChildren: [
                AppHeaderCell(string: 'S.N'),
                AppHeaderCell(string: 'NAME'),
                AppHeaderCell(string: 'QTY'),
                AppHeaderCell(string: 'STATUS'),
              ],
              dataChildren: [
                TableRow(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                  ),
                  children: [
                    AppDataCell(string: '1'),
                    AppDataCell(string: 'Food 1'),
                    AppDataCell(string: '2'),
                    KitchenStatusChip(status: 'READY', onPressed: () {}),
                  ],
                ),
                TableRow(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                  ),
                  children: [
                    AppDataCell(string: '1'),
                    AppDataCell(string: 'Food 1'),
                    AppDataCell(string: '2'),
                    KitchenStatusChip(status: 'NOT READY', onPressed: () {}),
                  ],
                ),
                TableRow(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                  ),
                  children: [
                    AppDataCell(string: '1'),
                    AppDataCell(string: 'Food 1'),
                    AppDataCell(string: '2'),
                    KitchenStatusChip(status: 'SERVED', onPressed: () {}),
                  ],
                ),
              ],
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
