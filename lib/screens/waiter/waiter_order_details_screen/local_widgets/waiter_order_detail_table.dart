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
          children: [
            item.status == FoodItemStatus.Served
                ? Column(
                    children: [
                      Text(
                        'This item has already been served. Please add additional order if the order is to be repeated.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 50.w,
                      ),
                    ],
                  )
                : item.status == FoodItemStatus.NotAvailable
                    ? Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Item Not Available!!',
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          SizedBox(height: 30.w),
                          AppButton(
                            text: 'Remove Item',
                            color: Colors.red,
                            onPressed: onRemoveItem,
                          ),
                        ],
                      )
                    : item.status == FoodItemStatus.NotReady
                        ? Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Visibility(
                                visible: item.status != FoodItemStatus.Ready
                                    ? true
                                    : false,
                                child: Column(
                                  children: [
                                    AttributeDisplay(
                                      attribute: "Previous Order Quantity",
                                      string: item.quantity.toString(),
                                    ),
                                    SizedBox(height: 30.w),
                                  ],
                                ),
                              ),
                              Visibility(
                                visible: item.status != FoodItemStatus.Ready
                                    ? true
                                    : false,
                                child: Column(
                                  children: [
                                    AppQuantitySelector(
                                      quantity: item.quantity,
                                      onQuantityChange: (qty) {
                                        //don't change the qty if the item(s) has already been served
                                        if (item.status !=
                                            FoodItemStatus.Served) {
                                          item.quantity = qty;
                                          onItemChange(item);
                                        }
                                      },
                                    ),
                                    SizedBox(height: 30.w),
                                  ],
                                ),
                              ),
                              AttributeDisplay(
                                  attribute: 'Status',
                                  string: EnumUtil.foodItemStatusToString(
                                      item.status)),
                              Visibility(
                                visible: item.status != FoodItemStatus.Ready
                                    ? true
                                    : false,
                                child: AppButton(
                                  text: 'Remove Item',
                                  color: Colors.red,
                                  onPressed: onRemoveItem,
                                ),
                              ),
                            ],
                          )
                        : Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Visibility(
                                visible: item.status != FoodItemStatus.Ready
                                    ? true
                                    : false,
                                child: Column(
                                  children: [
                                    AttributeDisplay(
                                      attribute: "Previous Order Quantity",
                                      string: item.quantity.toString(),
                                    ),
                                    SizedBox(height: 30.w),
                                  ],
                                ),
                              ),
                              Visibility(
                                visible: item.status != FoodItemStatus.Ready
                                    ? true
                                    : false,
                                child: Column(
                                  children: [
                                    AppQuantitySelector(
                                      quantity: item.quantity,
                                      onQuantityChange: (qty) {
                                        //don't change the qty if the item(s) has already been served
                                        if (item.status !=
                                            FoodItemStatus.Served) {
                                          item.quantity = qty;
                                          onItemChange(item);
                                        }
                                      },
                                    ),
                                    SizedBox(height: 30.w),
                                  ],
                                ),
                              ),
                              AttributeDisplay(
                                  attribute: 'Status',
                                  string: EnumUtil.foodItemStatusToString(
                                      item.status)),
                              AppButton(
                                text: 'Mark Served',
                                color: Colors.green,
                                onPressed: () {
                                  item.status = FoodItemStatus.Served;
                                  onItemChange(item);
                                  Navigator.pop(context);
                                },
                              ),
                              Visibility(
                                visible: item.status != FoodItemStatus.Ready
                                    ? true
                                    : false,
                                child: AppButton(
                                  text: 'Remove Item',
                                  color: Colors.red,
                                  onPressed: onRemoveItem,
                                ),
                              ),
                            ],
                          ),
            AppButton(
              text: 'Go Back',
              color: item.status != FoodItemStatus.Served ? Colors.grey : null,
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
        onStatusSelect: (data) {
          setState(() {
            widget.onItemChange(widget.list);
          });
        },
      ),
    );
  }
}
