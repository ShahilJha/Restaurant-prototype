import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTileContainer extends StatelessWidget {
  final Function onPressed;
  final Widget child;

  const AppTileContainer({
    Key key,
    @required this.onPressed,
    @required this.child,
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
        child: child,
      ),
    );
  }
}
