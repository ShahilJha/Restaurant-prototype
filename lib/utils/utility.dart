import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../services/user_auth.dart';

class Utility {
  static Future<dynamic> showSnackBar(BuildContext context,
      {String message}) async {
    Timer timer = Timer(Duration(milliseconds: 2000), () {
      Navigator.of(context, rootNavigator: true).pop();
    });
    return showGeneralDialog(
      barrierLabel: "Label",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0),
      transitionDuration: Duration(milliseconds: 700),
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: EdgeInsets.only(bottom: 50.h),
            height: 0.07.sh,
            width: 0.8.sw,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              border: Border.all(color: Theme.of(context).primaryColor),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
              child: Text(
                message,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(color: Colors.white),
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position:
              Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim1),
          child: child,
        );
      },
    ).then((value) {
      // dispose the timer in case something else has triggered the dismiss.
      timer?.cancel();
      timer = null;
    });
  }

  static Future<dynamic> showProcessingPopUp(BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
          child: Container(
            padding: EdgeInsets.all(25),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            width: 300.w,
            height: 300.w,
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }

  static Widget logOutFromApp(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.exit_to_app),
      onPressed: () {
        UserAuthService.instance.logOutUser();
        Navigator.pop(context);
        Navigator.of(context).pushNamed('/login');
      },
    );
  }
}
