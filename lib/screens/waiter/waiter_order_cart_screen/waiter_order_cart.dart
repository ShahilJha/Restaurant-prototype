import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:summer_project/screens/kitchen/order_details_screen/local_widgets/kitchen_status_chip.dart';
import 'package:summer_project/screens/kitchen/running_order_screen/local_widgets/kitchen_order_tile.dart';
import 'package:summer_project/widgets/app_app_bar.dart';
import 'package:summer_project/widgets/app_button.dart';
import 'package:summer_project/widgets/app_container.dart';
import 'package:summer_project/widgets/app_quantity_selector.dart';
import 'package:summer_project/widgets/app_table_components.dart';
import 'package:summer_project/widgets/order_no.dart';
import 'package:summer_project/widgets/sub_titles.dart';
import 'package:summer_project/widgets/table_no.dart';

class WaiterOrderCartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KAppBar(
        title: 'ORDER CART',
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
                0: FractionColumnWidth(0.1),
                1: FractionColumnWidth(0.4),
                2: FractionColumnWidth(0.3),
                3: FractionColumnWidth(0.2),
              },
              headerChildren: [
                AppHeaderCell(string: 'S.N'),
                AppHeaderCell(string: 'NAME'),
                AppHeaderCell(string: 'QTY'),
                AppHeaderCell(string: 'REMOVE'),
              ],
              dataChildren: [
                TableRow(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                  ),
                  children: [
                    AppDataCell(string: '1'),
                    AppDataCell(string: 'Food 1'),
                    AppQuantitySelector(
                      iconHeight: 100.w,
                      iconWidth: 100.w,
                      quantity: 2,
                    ),
                    IconButton(
                        icon: Icon(
                          Icons.highlight_off,
                          color: Colors.red,
                          size: 80.w,
                        ),
                        onPressed: null)
                  ],
                ),
              ],
            ),
            Divider(),
            AppButton(text: 'PLACE ORDER'),
          ],
        ),
      ),
    );
  }
}