import 'package:flutter/material.dart';
import 'package:summer_project/models/food_item.dart';
import 'package:summer_project/utils/order_util.dart';
import 'package:summer_project/widgets/app_table_components.dart';

class ReceptionistOrderTable extends StatelessWidget {
  final List<FoodItem> list;
  const ReceptionistOrderTable({Key key, this.list}) : super(key: key);

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
      dataChildren: OrderUtil.getReceptionistTableRows(list),
    );
  }
}
