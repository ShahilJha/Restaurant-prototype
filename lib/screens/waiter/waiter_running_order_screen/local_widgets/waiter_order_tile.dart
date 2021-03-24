import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:summer_project/widgets/app_tile_container.dart';
import 'package:summer_project/widgets/color_code_tile.dart';
import 'package:summer_project/widgets/order_no.dart';
import 'package:summer_project/widgets/table_no.dart';

class WaiterOrderTile extends StatelessWidget {
  final int tableNumber;
  final int orderNumber;
  final String customerName;
  final String customerContact;
  final Function onPressed;
  const WaiterOrderTile({
    Key key,
    @required this.tableNumber,
    @required this.orderNumber,
    @required this.customerName,
    @required this.customerContact,
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
          ColorCodeTile(),
        ],
      ),
    );
  }
}
