import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:summer_project/widgets/app_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:summer_project/widgets/app_button.dart';
import 'package:summer_project/widgets/app_container.dart';
import 'package:summer_project/widgets/app_table_components.dart';
import 'package:summer_project/widgets/customer_name.dart';
import 'package:summer_project/widgets/order_no.dart';
import 'package:summer_project/widgets/sub_titles.dart';
import 'package:summer_project/widgets/table_no.dart';

import 'local_widgets/payment_details.dart';

class OrderDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KAppBar(
        title: 'ORDER DETAILS',
      ),
      body: AppContainer(
        child: ListView(
          children: [
            TableNumber(tableNumber: 12),
            OrderNumber(
              orderNumber: 23,
            ),
            AttributeDisplay(
              attribute: 'Customer Name',
              string: 'Shahil Jha',
            ),
            AttributeDisplay(
              attribute: 'Phone no.',
              string: '98********',
            ),
            Divider(),
            Subtitles(string: 'ORDERS'),
            AppTable(
              columnWidths: {
                0: FractionColumnWidth(0.15),
                1: FractionColumnWidth(0.35),
                2: FractionColumnWidth(0.15),
                3: FractionColumnWidth(0.1),
                4: FractionColumnWidth(0.25),
              },
              headerChildren: [
                AppHeaderCell(string: 'S.N'),
                AppHeaderCell(string: 'NAME'),
                AppHeaderCell(string: 'PRICE'),
                AppHeaderCell(string: 'QTY'),
                AppHeaderCell(string: 'TOTAL'),
              ],
              dataChildren: [
                TableRow(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                  ),
                  children: [
                    AppDataCell(string: '1'),
                    AppDataCell(string: 'Food 1'),
                    AppDataCell(string: '2000'),
                    AppDataCell(string: '2'),
                    AppDataCell(string: '400'),
                  ],
                ),
                TableRow(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                  ),
                  children: [
                    AppDataCell(string: '1'),
                    AppDataCell(string: 'Food 1'),
                    AppDataCell(string: '2000'),
                    AppDataCell(string: '2'),
                    AppDataCell(string: '400'),
                  ],
                ),
                TableRow(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                  ),
                  children: [
                    AppDataCell(string: '1'),
                    AppDataCell(string: 'Food 1'),
                    AppDataCell(string: '2000'),
                    AppDataCell(string: '2'),
                    AppDataCell(string: '400'),
                  ],
                ),
              ],
            ),
            PaymentDetails(
              total: 111,
              discount: 11,
              netTotal: 100,
            ),
            AppButton(
              text: 'CLOSE ORDER',
            ),
          ],
        ),
      ),
    );
  }
}
