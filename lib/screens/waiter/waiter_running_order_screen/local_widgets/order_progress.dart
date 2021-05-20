import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final kOrderProgressTextStyle = TextStyle(fontSize: 50.w);

class OrderProgress extends StatelessWidget {
  final int ready, notReady, served, notAvailable;
  const OrderProgress({
    Key key,
    this.ready,
    this.notReady,
    this.served,
    this.notAvailable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 50.w),
      padding: EdgeInsets.symmetric(horizontal: 50.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'READY',
                style: kOrderProgressTextStyle,
              ),
              Text(ready.toString(), style: kOrderProgressTextStyle),
            ],
          ),
          SizedBox(height: 10.w),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('NOT READY', style: kOrderProgressTextStyle),
              Text(notReady.toString(), style: kOrderProgressTextStyle),
            ],
          ),
          SizedBox(height: 10.w),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('SERVED', style: kOrderProgressTextStyle),
              Text(served.toString(), style: kOrderProgressTextStyle),
            ],
          ),
          Visibility(
            visible: notAvailable == 0 ? false : true,
            child: Column(
              children: [
                SizedBox(height: 10.w),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('NOT AVAILABLE', style: kOrderProgressTextStyle),
                    Text(notAvailable.toString(),
                        style: kOrderProgressTextStyle),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
