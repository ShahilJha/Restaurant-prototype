import 'package:flutter/material.dart';
import 'package:summer_project/widgets/app_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:summer_project/widgets/app_button.dart';

class OrderDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KAppBar(
        title: 'ORDER DETAILS',
      ),
      body: ListView(
        children: [
          Text("#Table_no."),
          Text("#Order_no."),
          Text("ORDERS"),
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
                  AppButton(text: 'asdf'),
                ],
              ),
              TableRow(
                children: [
                  Text('2'),
                  Text('Food 2'),
                  Text('20'),
                  AppButton(text: 'asdf'),
                ],
              ),
            ],
          ),
          Text("ADDITIONAL ORDERS"),
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
                  AppButton(text: 'asdf'),
                ],
              ),
              TableRow(
                children: [
                  Text('2'),
                  Text('Food 2'),
                  Text('20'),
                  AppButton(text: 'asdf'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
