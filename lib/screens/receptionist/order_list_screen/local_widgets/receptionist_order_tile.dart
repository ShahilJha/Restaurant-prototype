import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:summer_project/models/order.dart';
import 'package:summer_project/widgets/app_tile_container.dart';
import 'package:summer_project/widgets/attribute_display.dart';
import 'package:summer_project/widgets/order_no.dart';
import 'package:summer_project/widgets/table_no.dart';

class ReceptionistOrderTile extends StatelessWidget {
  final Order order;
  final Function onPressed;
  const ReceptionistOrderTile({
    Key key,
    @required this.onPressed,
    @required this.order,
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
            attribute: 'Customer Name',
            string: order.customerName,
          ),
          AttributeDisplay(
            attribute: 'Phone no.',
            string: order.customerContact,
          ),
        ],
      ),
    );
  }
}
