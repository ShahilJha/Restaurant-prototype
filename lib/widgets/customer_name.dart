import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AttributeDisplay extends StatelessWidget {
  final String string, attribute;
  AttributeDisplay({
    @required this.string,
    @required this.attribute,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text(
            '$attribute : ',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 50.ssp,
            ),
          ),
          Text(
            string ?? '***',
            style: TextStyle(
              fontSize: 50.ssp,
            ),
          ),
        ],
      ),
    );
  }
}
