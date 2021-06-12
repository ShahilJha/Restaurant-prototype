import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppActionChip extends StatelessWidget {
  final String string;
  final Color backgroundColor;
  final Function onPressed;
  final Color textColor;
  final EdgeInsetsGeometry padding;
  const AppActionChip({
    Key key,
    @required this.string,
    this.backgroundColor,
    this.textColor = Colors.black,
    @required this.onPressed,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      child: ActionChip(
        backgroundColor: backgroundColor ?? null,
        padding:
            padding ?? EdgeInsets.symmetric(vertical: 20.w, horizontal: 60.w),
        label: Text(
          string,
          style: TextStyle(color: textColor),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
