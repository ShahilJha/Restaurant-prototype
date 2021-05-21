import 'package:flutter/material.dart';
import 'package:summer_project/models/food_item.dart';
import 'package:summer_project/utils/enum_util.dart';
import './waiter_status_chip.dart';
import 'package:summer_project/widgets/app_button.dart';
import 'package:summer_project/widgets/app_quantity_selector.dart';
import 'package:summer_project/widgets/app_table_components.dart';
import 'package:summer_project/widgets/attribute_display.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../enumerators.dart';

class WaiterOrderDetailTable extends StatefulWidget {
  final List<FoodItem> list;
  final Function onItemChange;
  const WaiterOrderDetailTable({Key key, this.list, this.onItemChange})
      : super(key: key);

  @override
  _WaiterOrderDetailTableState createState() => _WaiterOrderDetailTableState();
}

class _WaiterOrderDetailTableState extends State<WaiterOrderDetailTable> {
  dynamic _showItemInformation({
    BuildContext context,
    FoodItem item,
    Function onItemChange,
    Function onRemoveItem,
  }) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.w)),
        title: Column(
          children: [
            Text(
              item.name,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25),
            ),
            Divider(),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AttributeDisplay(
                attribute: "Previous Order Quantity",
                string: item.quantity.toString()),
            SizedBox(height: 30.w),
            AppQuantitySelector(
              quantity: item.quantity,
              onQuantityChange: (qty) {
                item.quantity = qty;
                onItemChange(item);
              },
            ),
            SizedBox(height: 30.w),
            AttributeDisplay(
                attribute: 'Status',
                string: EnumUtil.foodItemStatusToString(item.status)),
            AppButton(
              text: 'Mark Served',
              color: Colors.green,
              onPressed: () {
                item.status = FoodItemStatus.Served;
                onItemChange(item);
                Navigator.pop(context);
              },
            ),
            AppButton(
              text: 'Remove Item',
              color: Colors.red,
              onPressed: onRemoveItem,
            ),
            AppButton(
              text: 'Go Back',
              color: Colors.grey,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  List<TableRow> _getWaiterOrderDetailTableRows(
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
            AppDataCell(string: list[index].quantity.toString()),
            WaiterStatusChip(
              status: EnumUtil.foodItemStatusToString(list[index].status),
              onPressed: () => _showItemInformation(
                context: context,
                item: list[index],
                onItemChange: (item) {
                  setState(() {
                    widget.list[index] = item;
                  });
                },
                onRemoveItem: () {
                  setState(() {
                    widget.list.remove(widget.list[index]);
                  });
                  Navigator.pop(context);
                },
              ),
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
      dataChildren: _getWaiterOrderDetailTableRows(
        list: widget.list,
        onStatusSelect: () {
          setState(() {
            widget.onItemChange(widget.list);
          });
        },
      ),
    );
  }
}
