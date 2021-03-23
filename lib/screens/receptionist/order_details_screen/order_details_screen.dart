import 'package:flutter/material.dart';
import 'package:summer_project/widgets/app_action_chip.dart';
import 'package:summer_project/widgets/app_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:summer_project/widgets/app_button.dart';
import 'package:summer_project/widgets/customer_name.dart';
import 'package:summer_project/widgets/order_no.dart';
import 'package:summer_project/widgets/sub_titles.dart';

import 'local_widgets/payment_details.dart';

class OrderDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KAppBar(
        title: 'ORDER DETAILS',
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 25.w),
        child: ListView(
          children: [
            Text(
              "#Table_no.",
              style: TextStyle(
                fontSize: 100.ssp,
              ),
            ),
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
            Subtitles(
              string: 'ORDERS',
            ),
            Table(
              border: TableBorder.symmetric(
                outside: BorderSide(color: Colors.black),
                inside: BorderSide(color: Colors.grey),
              ),
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              columnWidths: {
                0: FractionColumnWidth(0.1),
                1: FractionColumnWidth(0.4),
                2: FractionColumnWidth(0.1),
                3: FractionColumnWidth(0.3),
              },
              children: [
                TableRow(
                  children: [
                    Text('S.N.', textAlign: TextAlign.center),
                    Text('Name', textAlign: TextAlign.center),
                    Text('Qty', textAlign: TextAlign.center),
                    Text('Status', textAlign: TextAlign.center),
                  ],
                ),
                TableRow(
                  children: [
                    Text('1'),
                    Text('Food 1'),
                    Text('2'),
                    AppActionChip(string: 'status'),
                  ],
                ),
                TableRow(
                  children: [
                    Text('2'),
                    Text('Food 2'),
                    Text('20'),
                    AppActionChip(string: 'status'),
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
