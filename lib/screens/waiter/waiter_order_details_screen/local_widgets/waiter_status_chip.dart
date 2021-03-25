import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WaiterStatusChip extends StatelessWidget {
  final String status;
  final Function onPressed;

  const WaiterStatusChip({
    Key key,
    @required this.status,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      label: Container(
        width: 210.w,
        child: Text(
          status,
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.green,
      labelPadding: EdgeInsets.symmetric(horizontal: 60.w),
      onPressed: onPressed,
    );
  }
}
