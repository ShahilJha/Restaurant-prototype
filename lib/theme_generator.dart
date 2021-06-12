import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:summer_project/constants.dart';

class ThemeGenerator {
  static const kPrimaryColor = Color(0xFFD9443A);
  static ThemeData generateThemeData() {
    return ThemeData(
      primaryColor: kPrimaryColor,
      accentColor: Colors.blueGrey,
      scaffoldBackgroundColor: Color(0xFFF3F3F3),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      buttonTheme: _getButtonThemeData(),
      dividerTheme: _getDividerThemeData(),
      checkboxTheme: _getCheckboxThemeData(),
    );
  }

  static DividerThemeData _getDividerThemeData() {
    return DividerThemeData().copyWith(
      space: 50.w,
      thickness: 1.5,
      indent: 100.w,
      endIndent: 100.w,
      color: Colors.grey,
    );
  }

  static ButtonThemeData _getButtonThemeData() {
    return ButtonThemeData().copyWith(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      textTheme: ButtonTextTheme.primary,
    );
  }

  static CheckboxThemeData _getCheckboxThemeData() {
    return CheckboxThemeData().copyWith(
      fillColor: MaterialStateColor.resolveWith(
        (states) {
          if (states.contains(MaterialState.selected)) {
            return kPrimaryColor; // the color when checkbox is selected;
          }
          return kPrimaryColor; //the color when checkbox is unselected;
        },
      ),
    );
  }
}
