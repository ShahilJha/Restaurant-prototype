import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:summer_project/enumerators.dart';
import 'package:summer_project/services/user_auth.dart';
import 'package:summer_project/utils/utility.dart';
import 'package:summer_project/utils/validation_case.dart';
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
  bool _rememberMe = false;
  JobPosition jobPosition;
  SharedPreferences _pref;

  Future<void> checkRememberMe() async {
    _pref = await SharedPreferences.getInstance();
    String emailAddress = _pref.getString('email');
    if (emailAddress != null) {
      setState(() {
        emailController.text = emailAddress;
        _rememberMe = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    // Firebase.initializeApp().whenComplete(() {
    //   print("Flutter App Initialized");
    //   setState(() {});
    // });
    checkRememberMe();
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                          value: _rememberMe,
                          onChanged: (bool value) {
                            setState(() => _rememberMe = !_rememberMe);
                          },
                        ),
                        Text(
                          "Remember Me?",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              AppButton(
                text: 'Log-in',
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    Utility.showProcessingPopUp(context);
                    if (_rememberMe == true) {
                      _pref.setString('email', emailController.text);
                    } else {
                      _pref.setString('email', '');
                    }
                    await UserAuthService.instance.signInUser(
                      email: emailController.text,
                      password: passwordController.text,
                      jobPosition: jobPosition,
                      context: context,
                    );
                  }
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
        child: TextFormField(
          autofocus: true,
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.done,
          validator: ValidationCase.validateEmail,
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
          validator: ValidationCase.validatePassword,
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
