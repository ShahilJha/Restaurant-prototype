import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:summer_project/enumerators.dart';
import 'package:summer_project/utils/enum_util.dart';

class WaiterStatusChip extends StatelessWidget {
  final String status;
  final Function onPressed;

  const WaiterStatusChip({
    Key key,
    @required this.status,
    @required this.onPressed,
  }) : super(key: key);

  Color getChipStatusColor() {
    switch (EnumUtil.stringToFoodItemStatus(status)) {
      case FoodItemStatus.Ready:
        return Colors.red;

      case FoodItemStatus.NotReady:
        return Colors.grey;

      case FoodItemStatus.Served:
        return Colors.green;

      case FoodItemStatus.NotAvailable:
        return Colors.black26;

      default:
        return Colors.white38;
    }
  }

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
      backgroundColor: getChipStatusColor(),
      labelPadding: EdgeInsets.symmetric(horizontal: 60.w),
      onPressed: onPressed,
    );
  }
}
