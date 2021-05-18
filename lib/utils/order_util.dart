import 'package:flutter/material.dart';
import 'package:summer_project/enumerators.dart';
import 'package:summer_project/screens/kitchen/order_details_screen/local_widgets/kitchen_status_chip.dart';
import 'package:summer_project/services/user_auth.dart';
import '../widgets/app_table_components.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../models/food_item.dart';
import 'enum_util.dart';

class OrderUtil {
  static dynamic _buildPopupDialog(BuildContext context) {
    print('METHOD CALLED');
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
              onPressed: () {},
            ),
            KitchenStatusChip(
              status: FoodItemStatus.NotReady,
              onPressed: () {},
            ),
            KitchenStatusChip(
              status: FoodItemStatus.NotAvailable,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  static List<TableRow> getTableRows(
      {BuildContext context, List<FoodItem> list}) {
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
                onPressed: () => _buildPopupDialog(context),
              ),
            ],
          ),
        );
      } else if (position == JobPosition.Waiter) {
        // orderList.add();
      }

      index += 1;
    }
    return orderList;
  }
}
