import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppQuantitySelector extends StatefulWidget {
  final int quantity;
  final double quantityFontSize;
  final double iconHeight, iconWidth;

  const AppQuantitySelector({
    Key key,
    this.quantity,
    this.quantityFontSize,
    this.iconHeight,
    this.iconWidth,
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
            height: widget.iconHeight,
            width: widget.iconWidth,
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
            style: TextStyle(fontSize: widget.quantityFontSize ?? 75.w),
          ),
          Spacer(),
          CounterButton(
            height: widget.iconHeight,
            width: widget.iconWidth,
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
  final double iconSize;
  final Function onPressed;
  final double height, width;
  const CounterButton({
    Key key,
    @required this.icon,
    this.iconSize,
    @required this.onPressed,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(0.0),
        height: height ?? 125.w,
        width: width ?? 125.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.grey[400],
          borderRadius: BorderRadius.all(Radius.circular(90.w)),
        ),
        child: Icon(icon),
      ),
    );
  }
}
