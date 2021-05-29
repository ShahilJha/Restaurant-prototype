import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:summer_project/models/order.dart';
import 'package:summer_project/widgets/app_button.dart';
import 'package:summer_project/widgets/app_textfield.dart';

import '../../../../menu.dart';

class CustomerDetailDialog extends StatefulWidget {
  const CustomerDetailDialog({
    this.onValueChange,
  });

  final Function onValueChange;

  @override
  State createState() => new CustomerDetailDialogState();
}

class CustomerDetailDialogState extends State<CustomerDetailDialog> {
  int selectedTable;
  String name;
  String contactNumber;
  Order tempOrder;

  @override
  void initState() {
    super.initState();
    selectedTable = null;
  }

  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text(
        'Customer Information',
        textAlign: TextAlign.center,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.w)),
      children: <Widget>[
        Container(
          width: 900.w,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Table no.: ', style: TextStyle(fontSize: 60.w)),
                    DropdownButton<int>(
                      hint: Text('Pick Table'),
                      value: selectedTable,
                      items: TableNumberList.map((int value) {
                        return new DropdownMenuItem<int>(
                          value: value,
                          child: Text(value.toString()),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedTable = value;
                        });
                      },
                    )
                  ],
                ),
                Text('Customer Name: ', style: TextStyle(fontSize: 60.w)),
                AppTextField(
                  onChanged: (value) {
                    name = value;
                  },
                ),
                Text('Phone Number: ', style: TextStyle(fontSize: 60.w)),
                AppTextField(
                  onChanged: (value) {
                    contactNumber = value;
                    print(contactNumber);
                  },
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: AppButton(
                    text: 'PROCEED',
                    onPressed: () {
                      Navigator.pop(context);
                      widget.onValueChange(selectedTable, name, contactNumber);
                    },
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
