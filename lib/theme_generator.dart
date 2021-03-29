import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThemeGenerator {
  ThemeData generateThemeData() {
    return ThemeData(
      primaryColor: Color(0xFFD9443A),
      accentColor: Colors.blueGrey,
      scaffoldBackgroundColor: Color(0xFFF3F3F3),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      buttonTheme: _getButtonThemeData(),
      dividerTheme: _getDividerThemeData(),
    );
  }

  DividerThemeData _getDividerThemeData() {
    return DividerThemeData().copyWith(
      space: 50.w,
      thickness: 1.5,
      indent: 100.w,
      endIndent: 100.w,
      color: Colors.grey,
    );
  }

  ButtonThemeData _getButtonThemeData() {
    return ButtonThemeData().copyWith(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      textTheme: ButtonTextTheme.primary,
    );
  }
}
