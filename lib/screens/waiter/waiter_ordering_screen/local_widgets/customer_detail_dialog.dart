import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:summer_project/widgets/app_button.dart';
import 'package:summer_project/widgets/app_textfield.dart';

import '../../../../menu.dart';

class CustomerDetailDialog extends StatefulWidget {
  const CustomerDetailDialog(
      {this.onValueChange,
      this.initialValue,
      this.onNameChange,
      this.onContactChange});

  final int initialValue;
  final void Function(int) onValueChange;
  final void Function(String) onNameChange;
  final void Function(String) onContactChange;

  @override
  State createState() => new CustomerDetailDialogState();
}

class CustomerDetailDialogState extends State<CustomerDetailDialog> {
  int _selectedTable;

  @override
  void initState() {
    super.initState();
    _selectedTable = widget.initialValue;
  }

  Widget build(BuildContext context) {
    return new SimpleDialog(
      title: Text(
        'ITEM NAME',
        textAlign: TextAlign.center,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.w)),
      children: <Widget>[
        Container(
          width: 900.w,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Table no.: ', style: TextStyle(fontSize: 60.w)),
                    DropdownButton<int>(
                      hint: Text('Pick Table'),
                      value: _selectedTable,
                      items: TableNumberList.map((int value) {
                        return new DropdownMenuItem<int>(
                          value: value,
                          child: Text(value.toString()),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedTable = value;
                        });
                        widget.onValueChange(value);
                      },
                    )
                  ],
                ),
                Text('Customer Name: ', style: TextStyle(fontSize: 60.w)),
                AppTextField(
                  onChanged: widget.onNameChange,
                ),
                Text('Phone Number: ', style: TextStyle(fontSize: 60.w)),
                AppTextField(
                  onChanged: widget.onContactChange,
                ),
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
        )
      ],
    );
  }
}
