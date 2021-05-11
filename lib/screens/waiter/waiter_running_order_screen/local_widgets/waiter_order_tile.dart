import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'file:///C:/Users/User/AndroidStudioProjects/summer_project/lib/screens/waiter/waiter_running_order_screen/local_widgets/order_progress.dart';
import 'package:summer_project/widgets/app_tile_container.dart';
import 'package:summer_project/widgets/color_code_tile.dart';
import 'package:summer_project/widgets/order_no.dart';
import 'package:summer_project/widgets/table_no.dart';

class WaiterOrderTile extends StatelessWidget {
  final int tableNumber;
  final String orderID;
  final Color color;
  final Function onPressed;
  const WaiterOrderTile({
    Key key,
    @required this.tableNumber,
    @required this.orderID,
    @required this.color,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppTileContainer(
      onPressed: onPressed,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TableNumber(tableNumber: tableNumber),
            ],
          ),
          OrderID(orderID: orderID),
          OrderProgress(
            ready: 1,
            notReady: 5,
            served: 2,
          ),
          ColorCodeTile(color: color),
        ],
      ),
    );
  }
}
