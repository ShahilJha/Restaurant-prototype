import 'package:flutter/material.dart';
import 'package:summer_project/models/food_item.dart';
import 'package:summer_project/utils/order_util.dart';
import 'package:summer_project/widgets/app_table_components.dart';

class KitchenOrderTable extends StatelessWidget {
  final List<FoodItem> list;
  const KitchenOrderTable({Key key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppTable(
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
      dataChildren: OrderUtil.getTableRows(
        context: context,
        list: list,
      ),
    );
  }
}
