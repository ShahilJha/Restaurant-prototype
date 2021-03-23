import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppActionChip extends StatelessWidget {
  final String string;
  const AppActionChip({Key key, this.string}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      label: Text(string),
      onPressed: () {},
    );
  }
}
