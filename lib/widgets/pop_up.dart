import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopUp extends StatelessWidget {
  final String title;
  final String message;

  const PopUp({Key key, this.title, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.w)),
      elevation: 10,
      title: Text(title, textAlign: TextAlign.center),
      children: [
        Text(message, textAlign: TextAlign.center),
        ElevatedButton(
          child: Text(
            'Close',
            textAlign: TextAlign.center,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
    );
  }
}
