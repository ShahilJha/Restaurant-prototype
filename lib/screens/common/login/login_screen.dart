import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:summer_project/enumerators.dart';
import 'package:summer_project/services/database_service.dart';
import 'package:summer_project/services/user_auth.dart';
import 'package:summer_project/widgets/app_button.dart';
import 'local_widgets/occupation_chips.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isPasswordVisible = true;
  JobPosition jobPosition;

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
    emailController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: 2280.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                height: 500.w,
                width: 500.w,
              ),
              _buildEmail(),
              _buildPassword(),
              OccupationChips(
                position: jobPosition,
                onPressed: (position) {
                  setState(() {
                    jobPosition = position;
                  });
                  ;
                },
              ),
              AppButton(
                text: 'Log-in',
                onPressed: () async {
                  String route;

                  if (jobPosition == JobPosition.Waiter) {
                    route = '/waiter_running_order_screen';
                  } else if (jobPosition == JobPosition.KitchenStaff) {
                    route = '/kitchen_running_orders';
                  } else if (jobPosition == JobPosition.Receptionist) {
                    route = '/receptionist_running_orders';
                  } else {
                    route = '/';
                  }

                  print('${JobPosition.KitchenStaff}');

                  final user = await FireBaseAuthService.instance.signInUser(
                      email: emailController.text,
                      password: passwordController.text);
                  // if (user != null) {
                  //   Navigator.pop(context);
                  //   if (route != null) {
                  //     print('ROUTE : $route');
                  //     Navigator.of(context).pushNamed(route);
                  //   }
                  // }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmail() => Container(
        padding: EdgeInsets.symmetric(horizontal: 100.w),
        margin: EdgeInsets.symmetric(vertical: 25.w),
        child: TextField(
          autofocus: true,
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.done,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            hintText: 'Email',
            prefixIcon: Icon(Icons.mail),
            suffixIcon: emailController.text.isEmpty
                ? Container(width: 0)
                : IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () => emailController.clear(),
                  ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100.w),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100.w),
            ),
          ),
        ),
      );

  Widget _buildPassword() => Container(
        padding: EdgeInsets.symmetric(horizontal: 100.w),
        margin: EdgeInsets.symmetric(vertical: 25.w),
        child: TextField(
          controller: passwordController,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.done,
          textAlign: TextAlign.center,
          obscureText: isPasswordVisible,
          decoration: InputDecoration(
            hintText: 'Password',
            prefixIcon: Icon(Icons.vpn_key),
            suffixIcon: IconButton(
              icon: isPasswordVisible
                  ? Icon(Icons.visibility_off)
                  : Icon(Icons.visibility),
              onPressed: () =>
                  setState(() => isPasswordVisible = !isPasswordVisible),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100.w),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100.w),
            ),
          ),
        ),
      );
}
