import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OccupationChips extends StatelessWidget {
  const OccupationChips({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 25.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(),
          ActionChip(
            label: Text('Receptionist'),
            onPressed: () {},
          ),
          Spacer(),
          ActionChip(
            label: Text('Waiter'),
            onPressed: () {},
          ),
          Spacer(),
          ActionChip(
            label: Text('Kitchen Staff'),
            onPressed: () {},
          ),
          Spacer(),
        ],
      ),
    );
  }
}
