import 'package:flutter/material.dart';
import 'package:summer_project/enumerators.dart';
import 'package:summer_project/services/user_auth.dart';
import '../widgets/app_table_components.dart';
import '../models/food_item.dart';

class OrderUtil {
  static List<TableRow> getTableRows(List<FoodItem> list) {
    int index = 1;
    List<TableRow> orderList = [];
    JobPosition position = UserAuthService.instance.user.jobPosition;
    for (var order in list) {
      if (position == JobPosition.Receptionist) {
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
      } else if (position == JobPosition.KitchenStaff) {
        // orderList.add();
      } else if (position == JobPosition.Waiter) {
        // orderList.add();
      }

      index += 1;
    }
    return orderList;
  }
}
