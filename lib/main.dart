import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/screenutil_init.dart';
import 'package:summer_project/route_generator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(1080, 2280),
      allowFontScaling: false,
      builder: () => MaterialApp(
        title: 'Summer Project',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          dividerTheme: _getDividerThemeData(),
        ),
        initialRoute: '/kitchen_order_details',
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
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
