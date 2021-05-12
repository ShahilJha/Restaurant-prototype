import 'package:flutter/material.dart';
import '../widgets/app_table_components.dart';
import '../models/food_item.dart';

class OrderUtil {
  static List<TableRow> getTableRows(List<FoodItem> list) {
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
}
