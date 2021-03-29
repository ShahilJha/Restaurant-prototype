import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextField extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final String hint;
  const AppTextField({
    Key key,
    this.padding,
    this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.symmetric(horizontal: 100.w),
      margin: EdgeInsets.symmetric(vertical: 25.w),
      child: TextField(
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          // prefixIcon: Icon(
          //   Icons.assignment_ind_rounded,
          //   color: Colors.grey,
          //   size: 75.w,
          // ),
          hintText: hint,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100.w),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100.w),
          ),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
