import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/screenutil_init.dart';
import 'package:summer_project/route_generator.dart';
import 'package:summer_project/theme_generator.dart';

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
        theme: ThemeGenerator().generateThemeData(),
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
