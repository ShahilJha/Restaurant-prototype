import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppQuantitySelector extends StatelessWidget {
  final int quantity;

  const AppQuantitySelector({
    Key key,
    this.quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.all(Radius.circular(90.w)),
            ),
            child: IconButton(
              icon: Icon(Icons.remove, size: 70.w),
              onPressed: () {},
            ),
          ),
          Spacer(),
          Text(
            quantity.toString(),
            style: TextStyle(fontSize: 70.w),
          ),
          Spacer(),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.all(Radius.circular(90.w)),
            ),
            child: IconButton(
              icon: Icon(Icons.add, size: 70.w),
              onPressed: () {},
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
