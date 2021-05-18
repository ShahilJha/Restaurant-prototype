import 'package:flutter/material.dart';
import 'package:summer_project/models/food_item.dart';
import 'package:summer_project/widgets/app_table_components.dart';

class ReceptionistOrderTable extends StatelessWidget {
  final List<FoodItem> list;
  const ReceptionistOrderTable({Key key, this.list}) : super(key: key);

  List<TableRow> _getReceptionistTableRows(List<FoodItem> list) {
    int index = 1;
    List<TableRow> orderList = [];
    for (var order in list) {
      orderList.add(
        TableRow(
          decoration: BoxDecoration(
            color: Colors.grey[100],
          ),
          children: [
            AppDataCell(string: index.toString()),
            AppDataCell(string: order.name),
            AppDataCell(string: order.price.toString()),
            AppDataCell(string: order.quantity.toString()),
            AppDataCell(string: order.total.toString()),
          ],
        ),
      );
      index += 1;
    }
    return orderList;
  }

  @override
  Widget build(BuildContext context) {
    return AppTable(
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
      dataChildren: _getReceptionistTableRows(list),
    );
  }
}
