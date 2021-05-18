import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:summer_project/enumerators.dart';
import 'package:summer_project/utils/enum_util.dart';

class KitchenStatusChip extends StatelessWidget {
  final FoodItemStatus status;
  final Function onPressed;

  const KitchenStatusChip({
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
          EnumUtil.foodItemStatusToString(status),
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
