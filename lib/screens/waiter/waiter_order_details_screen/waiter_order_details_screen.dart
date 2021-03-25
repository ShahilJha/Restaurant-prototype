import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:summer_project/widgets/app_app_bar.dart';
import 'package:summer_project/widgets/app_container.dart';
import 'package:summer_project/widgets/app_table_components.dart';
import 'package:summer_project/widgets/order_no.dart';
import 'package:summer_project/widgets/sub_titles.dart';
import 'package:summer_project/widgets/table_no.dart';

import 'local_widgets/waiter_status_chip.dart';

class WaiterOrderDetailsScreen extends StatelessWidget {
  Widget _buildPopupDialog(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.w)),
      title: const Text(
        'ITEM NAME',
        textAlign: TextAlign.center,
      ),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text('ITEM NAME'),
        ],
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
                  OrderNumber(orderNumber: 23),
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
                    WaiterStatusChip(
                      status: 'READY',
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              _buildPopupDialog(context),
                        );
                      },
                    ),
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
                    WaiterStatusChip(status: 'NOT READY', onPressed: () {}),
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
                    WaiterStatusChip(status: 'SERVED', onPressed: () {}),
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
                    WaiterStatusChip(status: 'READY', onPressed: () {}),
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
                    WaiterStatusChip(status: 'NOT READY', onPressed: () {}),
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
                    WaiterStatusChip(status: 'SERVED', onPressed: () {}),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
