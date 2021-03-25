import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Color color;
  final Function onPressed;

  const AppButton({Key key, @required this.text, this.color, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 25.w, horizontal: 25.w),
      child: RaisedButton(
        padding: EdgeInsets.symmetric(vertical: 50.w),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        onPressed: onPressed,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.w),
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 60.w,
            ),
          ),
        ),
        color: color ?? Theme.of(context).primaryColor,
      ),
    );
  }
}
