import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppActionChip extends StatelessWidget {
  final String string;
  final Color backgroundColor;
  final Function onPressed;
  const AppActionChip({
    Key key,
    @required this.string,
    this.backgroundColor,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      backgroundColor: backgroundColor ?? null,
      padding: EdgeInsets.symmetric(vertical: 20.w, horizontal: 60.w),
      label: Text(string),
      onPressed: onPressed,
    );
  }
}
