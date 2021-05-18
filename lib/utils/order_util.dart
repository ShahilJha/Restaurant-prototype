import 'package:flutter/material.dart';
import 'package:summer_project/enumerators.dart';
import 'package:summer_project/screens/kitchen/order_details_screen/local_widgets/kitchen_status_chip.dart';
import '../widgets/app_table_components.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../models/food_item.dart';

class OrderUtil {
  static dynamic _buildPopupDialog(BuildContext context) {
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
              onPressed: () => FoodItemStatus.Ready,
            ),
            KitchenStatusChip(
              status: FoodItemStatus.NotReady,
              onPressed: () => FoodItemStatus.NotReady,
            ),
            KitchenStatusChip(
              status: FoodItemStatus.NotAvailable,
              onPressed: () => FoodItemStatus.NotAvailable,
            ),
          ],
        ),
      ),
    );
  }

  static List<TableRow> getReceptionistTableRows(List<FoodItem> list) {
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

  static List<TableRow> getKitchenTableRows(
      {BuildContext context, List<FoodItem> list, Function function}) {
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
            AppDataCell(string: order.quantity.toString()),
            KitchenStatusChip(
              status: order.status,
              onPressed: function,
            ),
          ],
        ),
      );
      index += 1;
    }
    return orderList;
  }

  static List<TableRow> getWaiterTableRows({List<FoodItem> list}) {
    int index = 1;
    List<TableRow> orderList = [];
    for (var order in list) {
      // orderList.add();
      index += 1;
    }
    return orderList;
  }
}
