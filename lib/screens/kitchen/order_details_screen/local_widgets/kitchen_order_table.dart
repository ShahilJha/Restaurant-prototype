import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:summer_project/models/food_item.dart';
import 'package:summer_project/widgets/app_table_components.dart';

import '../../../../enumerators.dart';
import 'kitchen_status_chip.dart';

class KitchenOrderTable extends StatefulWidget {
  final List<FoodItem> list;
  final Function function, onStatusChange;
  const KitchenOrderTable(
      {Key key, this.list, this.function, this.onStatusChange})
      : super(key: key);

  @override
  _KitchenOrderTableState createState() => _KitchenOrderTableState();
}

class _KitchenOrderTableState extends State<KitchenOrderTable> {
  dynamic _buildPopupDialog({BuildContext context, Function onStatusSelect}) {
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
            KitchenStatusChip(
              status: FoodItemStatus.Ready,
              onPressed: () {
                Navigator.pop(context);
                onStatusSelect(FoodItemStatus.Ready);
              },
            ),
            KitchenStatusChip(
              status: FoodItemStatus.NotReady,
              onPressed: () {
                Navigator.pop(context);
                onStatusSelect(FoodItemStatus.NotReady);
              },
            ),
            KitchenStatusChip(
              status: FoodItemStatus.NotAvailable,
              onPressed: () {
                Navigator.pop(context);
                onStatusSelect(FoodItemStatus.NotAvailable);
              },
            ),
          ],
        ),
      ),
    );
  }

  List<TableRow> _getKitchenTableRows(
      {List<FoodItem> list, Function onPressed, onStatusSelect}) {
    List<TableRow> orderList = [];
    for (int index = 0; index < list.length; index++) {
      orderList.add(
        TableRow(
          decoration: BoxDecoration(
            color: Colors.grey[100],
          ),
          children: [
            AppDataCell(string: index.toString()),
            AppDataCell(string: list[index].name),
            AppDataCell(string: list[index].quantity.toString()),
            KitchenStatusChip(
              status: list[index].status,
              onPressed: () {
                _buildPopupDialog(
                  context: context,
                  onStatusSelect: (FoodItemStatus status) =>
                      onStatusSelect(status, index),
                );
              },
            ),
          ],
        ),
      );
    }
    return orderList;
  }

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
      dataChildren: _getKitchenTableRows(
        list: widget.list,
        onPressed: () {},
        onStatusSelect: (FoodItemStatus status, int index) {
          print('$status with i=$index');
          setState(() {
            widget.list[index].status = status;
          });
        },
      ),
    );
  }
}
