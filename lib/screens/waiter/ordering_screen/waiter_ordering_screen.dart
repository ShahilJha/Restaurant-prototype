import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:summer_project/widgets/app_app_bar.dart';
import 'package:summer_project/widgets/app_button.dart';
import 'package:summer_project/widgets/app_textfield.dart';

class WaiterOrderingScreen extends StatefulWidget {
  @override
  _WaiterOrderingScreenState createState() => _WaiterOrderingScreenState();
}

class _WaiterOrderingScreenState extends State<WaiterOrderingScreen> {
  void _customerDetailForm(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.w)),
        title: const Text(
          'ITEM NAME',
          textAlign: TextAlign.center,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Table no.: ', style: TextStyle(fontSize: 60.w)),
                DropdownButton<int>(
                  hint: Text('Pick Table'),
                  items: <int>[1, 2, 3, 4, 5, 6].map((int value) {
                    return new DropdownMenuItem<int>(
                      value: value,
                      child: new Text(value.toString()),
                    );
                  }).toList(),
                  onChanged: (_) {},
                )
              ],
            ),
            Text('Customer Name: ', style: TextStyle(fontSize: 60.w)),
            AppTextField(padding: EdgeInsets.all(0)),
            Text('Phone Number: ', style: TextStyle(fontSize: 60.w)),
            AppTextField(padding: EdgeInsets.all(0)),
            Container(
              alignment: Alignment.bottomCenter,
              child: AppButton(
                text: 'PROCEED',
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    print('check #1');
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _customerDetailForm(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    print('check #3');

    return Scaffold(
      appBar: KAppBar(
        title: 'ORDERING MENU',
      ),
      body: ListView(
        children: [],
      ),
    );
  }
}
