import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TableNumber extends StatelessWidget {
  final int tableNumber;
  const TableNumber({Key key, this.tableNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "#$tableNumber",
      style: TextStyle(
        fontSize: 100.ssp,
      ),
    );
  }
}
