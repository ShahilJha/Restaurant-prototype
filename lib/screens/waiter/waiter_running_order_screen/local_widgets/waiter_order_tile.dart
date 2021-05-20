import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:summer_project/models/order.dart';
import 'package:summer_project/utils/enum_util.dart';
import 'package:summer_project/widgets/attribute_display.dart';
import '../../../../enumerators.dart';
import 'file:///C:/Users/User/AndroidStudioProjects/summer_project/lib/screens/waiter/waiter_running_order_screen/local_widgets/order_progress.dart';
import 'package:summer_project/widgets/app_tile_container.dart';
import 'package:summer_project/widgets/color_code_tile.dart';
import 'package:summer_project/widgets/order_no.dart';
import 'package:summer_project/widgets/table_no.dart';

class WaiterOrderTile extends StatelessWidget {
  final Order order;
  final Function onPressed;
  const WaiterOrderTile({
    Key key,
    @required this.order,
    @required this.onPressed,
  }) : super(key: key);

  Color getStatusColor() {
    if (order.readyItems > 0) {
      return Colors.red;
    } else if (order.notAvailableItems > 0) {
      return Colors.black26;
    }
    return Colors.white38;
  }

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
              TableNumber(tableNumber: order.tableNumber),
            ],
          ),
          OrderID(orderID: order.id),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50.w),
            child: AttributeDisplay(
              attribute: 'Status',
              string: EnumUtil.orderStatusToString(order.status),
            ),
          ),
          OrderProgress(
            ready: order.readyItems,
            notReady: order.notReadyItems,
            served: order.servedItems,
            notAvailable: order.notAvailableItems,
          ),
          ColorCodeTile(color: Colors.white38),
        ],
      ),
    );
  }
}
