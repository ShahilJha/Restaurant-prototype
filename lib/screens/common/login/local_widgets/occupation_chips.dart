import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:summer_project/enumerators.dart';

class OccupationChips extends StatelessWidget {
  final onPressed;
  final JobPosition position;
  const OccupationChips({
    Key key,
    this.position,
    this.onPressed,
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
            label: Text(
              'Receptionist',
              style: TextStyle(
                color:
                    position == JobPosition.Receptionist ? Colors.white : null,
              ),
            ),
            backgroundColor: position == JobPosition.Receptionist
                ? Theme.of(context).primaryColor
                : null,
            onPressed: () {
              onPressed(JobPosition.Receptionist);
            },
          ),
          Spacer(),
          ActionChip(
            label: Text(
              'Waiter',
              style: TextStyle(
                color: position == JobPosition.Waiter ? Colors.white : null,
              ),
            ),
            backgroundColor: position == JobPosition.Waiter
                ? Theme.of(context).primaryColor
                : null,
            onPressed: () {
              onPressed(JobPosition.Waiter);
            },
          ),
          Spacer(),
          ActionChip(
            label: Text(
              'Kitchen Staff',
              style: TextStyle(
                color:
                    position == JobPosition.KitchenStaff ? Colors.white : null,
              ),
            ),
            backgroundColor: position == JobPosition.KitchenStaff
                ? Theme.of(context).primaryColor
                : null,
            onPressed: () {
              onPressed(JobPosition.KitchenStaff);
            },
          ),
          Spacer(),
        ],
      ),
    );
  }
}
