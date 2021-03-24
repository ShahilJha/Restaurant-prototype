import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColorCodeTile extends StatelessWidget {
  final Color color;

  const ColorCodeTile({Key key, this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: color ?? Colors.grey,
            borderRadius: BorderRadius.all(Radius.circular(50.w)),
          ),
          height: 100.w,
          width: 750.w,
        ),
      ],
    );
  }
}
