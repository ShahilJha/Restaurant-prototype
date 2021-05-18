import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:summer_project/models/order.dart';
import 'package:summer_project/utils/enum_util.dart';
import 'package:summer_project/widgets/app_tile_container.dart';
import 'package:summer_project/widgets/attribute_display.dart';
import 'package:summer_project/widgets/color_code_tile.dart';
import 'package:summer_project/widgets/order_no.dart';
import 'package:summer_project/widgets/table_no.dart';

class KitchenOrderTile extends StatelessWidget {
  final Order order;
  final Function onPressed;
  const KitchenOrderTile({
    Key key,
    @required this.order,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppTileContainer(
      onPressed: onPressed,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TableNumber(
                tableNumber: order.tableNumber,
              ),
            ],
          ),
          OrderID(
            orderID: order.id,
          ),
          AttributeDisplay(
            attribute: 'Status',
            string: EnumUtil.orderStatusToString(order.status),
          ),
          Divider(),
          //TODO: change color according to status
          ColorCodeTile(color: Colors.grey),
        ],
      ),
    );
  }
}
