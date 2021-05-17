import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:summer_project/enumerators.dart';
import 'package:summer_project/services/database_service.dart';
import 'package:summer_project/services/user_auth.dart';
import 'package:summer_project/utils/utility.dart';
import 'package:summer_project/utils/validator.dart';
import 'package:summer_project/widgets/app_button.dart';
import 'local_widgets/occupation_chips.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isPasswordVisible = true;
  JobPosition jobPosition;

  showProcessDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("Flutter App Initialized");
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
              Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildEmail(),
                    _buildPassword(),
                    OccupationChips(
                      position: jobPosition,
                      onPressed: (position) {
                        setState(() {
                          jobPosition = position;
                        });
                      },
                    ),
                  ],
                ),
              ),
              AppButton(
                text: 'Log-in',
                onPressed: () async {
                  // Utility.showSnackBar(context, message: 'THIS IS A TEST!');

                  //todo: make process disappear if not logging in
                  if (_formKey.currentState.validate()) {
                    Utility.showProcessingPopUp(context);
                    final user = await UserAuthService.instance.signInUser(
                        email: emailController.text,
                        password: passwordController.text);

                    if (user != null) {
                      if (jobPosition == null) {
                        Navigator.pop(context);
                        Utility.showSnackBar(context,
                            message: 'Please, choose a job position.');
                      } else if (jobPosition != user.jobPosition) {
                        Navigator.pop(context);
                        Utility.showSnackBar(context,
                            message: 'Incorrect Job Position Input.');
                      } else if (jobPosition == user.jobPosition) {
                        Navigator.pop(context); //pops circular indicator
                        // Navigator.pop(context); //pops login screen
                        Navigator.of(context)
                            .pushNamed(_getLoginRoute(user.jobPosition));
                      }
                    } else {
                      //todo: show login error message
                      Navigator.pop(context);
                      Utility.showSnackBar(context,
                          message:
                              'Error in Logging-in.\nPlease Check Input Details.');
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getLoginRoute(JobPosition position) {
    if (jobPosition == JobPosition.Waiter) {
      return '/waiter_running_order_screen';
    } else if (jobPosition == JobPosition.KitchenStaff) {
      return '/kitchen_running_orders';
    } else if (jobPosition == JobPosition.Receptionist) {
      return '/receptionist_running_orders';
    } else {
      return '/';
    }
  }

  Widget _buildEmail() => Container(
        padding: EdgeInsets.symmetric(horizontal: 100.w),
        margin: EdgeInsets.symmetric(vertical: 25.w),
        child: TextFormField(
          autofocus: true,
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.done,
          validator: Validator.validateEmail,
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
        child: TextFormField(
          controller: passwordController,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.done,
          validator: Validator.validatePassword,
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
