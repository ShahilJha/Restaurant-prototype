import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:summer_project/widgets/app_app_bar.dart';
import 'package:summer_project/widgets/app_button.dart';
import 'package:summer_project/widgets/app_container.dart';
import 'package:summer_project/widgets/app_textfield.dart';
import 'package:summer_project/widgets/attribute_display.dart';

class WaiterCustomerDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KAppBar(
        title: 'CUSTOMER DETAILS FILL UP',
      ),
      body: AppContainer(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 50.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
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
                  child: AppButton(text: 'PROCEED'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
