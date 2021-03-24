import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:summer_project/widgets/app_tile_container.dart';
import 'package:summer_project/widgets/attribute_display.dart';
import 'package:summer_project/widgets/color_code_tile.dart';
import 'package:summer_project/widgets/order_no.dart';
import 'package:summer_project/widgets/table_no.dart';

class KitchenOrderTile extends StatelessWidget {
  final int tableNumber;
  final int orderNumber;
  final Color colorCode;
  final String status;
  final Function onPressed;
  const KitchenOrderTile({
    Key key,
    @required this.tableNumber,
    @required this.orderNumber,
    @required this.colorCode,
    @required this.status,
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
                tableNumber: tableNumber,
              ),
            ],
          ),
          OrderNumber(
            orderNumber: orderNumber,
          ),
          AttributeDisplay(attribute: 'Status', string: status),
          Divider(),
          ColorCodeTile(color: colorCode),
        ],
      ),
    );
  }
}
