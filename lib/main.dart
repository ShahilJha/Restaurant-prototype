import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/screenutil_init.dart';
import 'package:summer_project/route_generator.dart';
import 'package:summer_project/theme_generator.dart';

void main() {
  runApp(MyApp());
}

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(
//     DevicePreview(
//       enabled: !kReleaseMode,
//       builder: (context) => MyApp(),
//     ),
//   );
// }

//TODO: use Future builder with splash screen and initilize Firebase.initializeApp() from login to here
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
