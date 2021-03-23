import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Subtitles extends StatelessWidget {
  final String string;
  Subtitles({this.string});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        string,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 80.ssp,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
