import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderNumber extends StatelessWidget {
  final int orderNumber;
  OrderNumber({this.orderNumber = 0});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        orderNumber != 0 ? '#$orderNumber' : '#order***',
        style: TextStyle(
          fontSize: 40.ssp,
          color: Colors.grey,
        ),
      ),
    );
  }
}
