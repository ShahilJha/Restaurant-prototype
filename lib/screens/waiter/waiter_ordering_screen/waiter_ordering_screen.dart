import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:summer_project/widgets/app_action_chip.dart';
import 'package:summer_project/widgets/app_app_bar.dart';
import 'package:summer_project/widgets/app_button.dart';
import 'package:summer_project/widgets/app_container.dart';
import 'package:summer_project/widgets/app_textfield.dart';
import 'package:summer_project/widgets/sub_titles.dart';

import 'local_widgets/app_food_item_tile.dart';

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
        content: SingleChildScrollView(
          child: Column(
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
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _customerDetailForm(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KAppBar(
        title: 'ORDERING MENU',
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.table_rows),
        onPressed: () {
          Navigator.of(context).pushNamed('/waiter_order_cart_screen');
        },
      ),
      body: AppContainer(
        child: ListView(
          children: [
            Subtitles(string: 'CATEGORY'),
            Container(
              height: 150.w,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return AppActionChip(
                    string: 'null',
                    onPressed: () {},
                  );
                },
              ),
            ),
            Subtitles(string: 'ITEMS'),
            SizedBox(height: 25.h),
            Container(
              // color: Colors.red,
              height: 1600.h,
              child: ListView.builder(
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: AppFoodItemTile(
                      itemName: 'ITEM',
                      itemPrice: 3000,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
