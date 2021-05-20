import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:summer_project/models/order.dart';
import 'package:summer_project/widgets/app_app_bar.dart';
import 'package:summer_project/widgets/app_button.dart';
import 'package:summer_project/widgets/app_container.dart';
import 'package:summer_project/widgets/app_quantity_selector.dart';
import 'package:summer_project/widgets/app_table_components.dart';
import 'package:summer_project/widgets/attribute_display.dart';
import 'package:summer_project/widgets/order_no.dart';
import 'package:summer_project/widgets/sub_titles.dart';
import 'package:summer_project/widgets/table_no.dart';

import 'local_widgets/waiter_status_chip.dart';

class WaiterOrderDetailsScreen extends StatelessWidget {
  final Order order;
  const WaiterOrderDetailsScreen({Key key, this.order}) : super(key: key);

  Widget _showItemInformation(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.w)),
      title: const Text(
        'ITEM NAME',
        textAlign: TextAlign.center,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          AttributeDisplay(attribute: "Previous Order Quantity", string: '2'),
          SizedBox(height: 30.w),
          AppQuantitySelector(quantity: 2),
          SizedBox(height: 30.w),
          AttributeDisplay(attribute: 'Status', string: 'READY'),
          AppButton(text: 'MARK SERVED', color: Colors.lightGreen),
          AppButton(
            text: 'REMOVE ITEM',
            color: Colors.red,
          ),
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
                children: [
                  TableNumber(tableNumber: order.tableNumber),
                  OrderID(orderID: order.id),
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
                              _showItemInformation(context),
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
