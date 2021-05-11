import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:summer_project/widgets/app_tile_container.dart';
import 'package:summer_project/widgets/attribute_display.dart';
import 'package:summer_project/widgets/order_no.dart';
import 'package:summer_project/widgets/table_no.dart';

class ReceptionistOrderTile extends StatelessWidget {
  final int tableNumber;
  final String orderID;
  final String customerName;
  final String customerContact;
  final Function onPressed;
  const ReceptionistOrderTile({
    Key key,
    @required this.tableNumber,
    @required this.orderID,
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
          OrderID(
            orderID: orderID,
          ),
          AttributeDisplay(
            attribute: 'Customer Name',
            string: customerName,
          ),
          AttributeDisplay(
            attribute: 'Phone no.',
            string: customerContact,
          ),
        ],
      ),
    );
  }
}
