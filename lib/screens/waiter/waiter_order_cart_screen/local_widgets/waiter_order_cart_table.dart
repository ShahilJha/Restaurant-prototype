import 'package:flutter/material.dart';
import 'package:summer_project/models/food_item.dart';
import 'package:summer_project/widgets/app_quantity_selector.dart';
import 'package:summer_project/widgets/app_table_components.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WaiterOrderCartTable extends StatefulWidget {
  final List<FoodItem> list;
  final Function onItemChange;
  const WaiterOrderCartTable({Key key, this.list, this.onItemChange})
      : super(key: key);

  @override
  _WaiterOrderCartTableState createState() => _WaiterOrderCartTableState();
}

class _WaiterOrderCartTableState extends State<WaiterOrderCartTable> {
  List<TableRow> _getWaiterOrderCartTableRows(
      {List<FoodItem> list, Function onStatusSelect}) {
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
            AppQuantitySelector(
              iconHeight: 100.w,
              iconWidth: 100.w,
              quantity: list[index].quantity,
            ),
            IconButton(
              icon: Icon(
                Icons.highlight_off,
                color: Colors.red,
                size: 80.w,
              ),
              onPressed: () {
                print('There was an attempt to remove');
                list.remove(list[index]);
                onStatusSelect(list);
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
        0: FractionColumnWidth(0.1),
        1: FractionColumnWidth(0.4),
        2: FractionColumnWidth(0.3),
        3: FractionColumnWidth(0.2),
      },
      headerChildren: [
        AppHeaderCell(string: 'S.N'),
        AppHeaderCell(string: 'Name'),
        AppHeaderCell(string: 'Qty'),
        AppHeaderCell(string: 'Remove'),
      ],
      dataChildren: _getWaiterOrderCartTableRows(
        list: widget.list,
        onStatusSelect: (changedList) {
          setState(() {
            widget.onItemChange(changedList);
          });
        },
      ),
    );
  }
}
