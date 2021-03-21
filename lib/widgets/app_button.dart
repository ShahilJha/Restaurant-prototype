import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 25.w),
      child: FlatButton(
        onPressed: () {},
        child: Text('BUTTON'),
        color: Colors.grey,
      ),
    );
  }
}
