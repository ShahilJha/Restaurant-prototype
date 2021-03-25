import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppQuantitySelector extends StatefulWidget {
  final int quantity;

  const AppQuantitySelector({
    Key key,
    this.quantity,
  }) : super(key: key);

  @override
  _AppQuantitySelectorState createState() => _AppQuantitySelectorState();
}

class _AppQuantitySelectorState extends State<AppQuantitySelector> {
  int count;
//TODO: make use of function(x) voidCallBack to relay count data
  @override
  void initState() {
    super.initState();
    count = widget.quantity;
    print(count);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          CounterButton(
            icon: Icons.remove,
            onPressed: () {
              setState(() {
                count--;
              });
            },
          ),
          Spacer(),
          Text(
            count.toString(),
            style: TextStyle(fontSize: 75.w),
          ),
          Spacer(),
          CounterButton(
            icon: Icons.add,
            onPressed: () {
              setState(() {
                count++;
              });
            },
          ),
          Spacer(),
        ],
      ),
    );
  }
}

class CounterButton extends StatelessWidget {
  final IconData icon;
  final onPressed;
  const CounterButton({
    Key key,
    @required this.icon,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[400],
        borderRadius: BorderRadius.all(Radius.circular(90.w)),
      ),
      child: IconButton(
        icon: Icon(
          icon,
          size: 70.w,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
