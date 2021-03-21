import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:summer_project/widgets/app_button.dart';
import 'package:summer_project/widgets/app_textfield.dart';

import 'local_widgets/occupation_chips.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/logo.png',
            height: 500.w,
            width: 500.w,
          ),
          AppTextField(),
          AppTextField(),
          OccupationChips(),
          AppButton()
        ],
      ),
    );
  }
}
