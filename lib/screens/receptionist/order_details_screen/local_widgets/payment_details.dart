import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final kAttributeStyle = TextStyle(
  fontWeight: FontWeight.w600,
  fontSize: 65.w,
);

final kValueStyle = TextStyle(
  fontWeight: FontWeight.w500,
  fontSize: 65.w,
);

class PaymentDetails extends StatelessWidget {
  final int total, netTotal;
  final Function onDiscountChange;

  const PaymentDetails({
    Key key,
    this.total,
    this.netTotal,
    this.onDiscountChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 50.w, vertical: 50.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Table(
            children: [
              TableRow(
                children: [
                  Text(
                    "TOTAL",
                    style: kAttributeStyle,
                  ),
                  Text(
                    total.toString(),
                    textAlign: TextAlign.end,
                    style: kValueStyle,
                  ),
                ],
              ),
              TableRow(
                children: [
                  Container(
                    height: 150.h,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "DISCOUNT",
                      style: kAttributeStyle,
                      // textAlign: TextAlignVertical.center,
                    ),
                  ),
                  Container(
                    // width: 50.w,
                    padding: EdgeInsets.only(left: 250.w),
                    child: TextField(
                      style: kValueStyle,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        hintText: 'Discount',
                        hintStyle: TextStyle(fontSize: 35.w),
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) =>
                          onDiscountChange(int.tryParse(value) ?? 0),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Divider(
            endIndent: 25.w,
            indent: 25.w,
          ),
          Table(
            children: [
              TableRow(
                children: [
                  Text(
                    "NET TOTAL",
                    style: kAttributeStyle,
                  ),
                  Text(
                    netTotal.toString(),
                    textAlign: TextAlign.end,
                    style: kValueStyle,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
