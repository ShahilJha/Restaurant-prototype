import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:summer_project/widgets/customer_name.dart';
import 'package:summer_project/widgets/order_no.dart';
import 'package:summer_project/widgets/table_no.dart';

class ReceptionistOrderTile extends StatelessWidget {
  final int tableNumber;
  final int orderNumber;
  final String customerName;
  final String customerContact;
  final Function onPressed;
  const ReceptionistOrderTile({
    Key key,
    @required this.tableNumber,
    @required this.orderNumber,
    @required this.customerName,
    @required this.customerContact,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.all(Radius.circular(50.w))),
        padding: EdgeInsets.all(50.w),
        margin: EdgeInsets.symmetric(vertical: 25.w),
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
      ),
    );
  }
}
