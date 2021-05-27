import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:summer_project/models/order.dart';
import 'package:summer_project/utils/enum_util.dart';
import 'package:summer_project/utils/utility.dart';
import 'package:summer_project/widgets/app_button.dart';
import 'package:summer_project/widgets/app_textfield.dart';

import '../../../../menu.dart';

class CustomerDetailDialog extends StatefulWidget {
  const CustomerDetailDialog({
    this.onValueChange,
    this.order,
  });

  final Function onValueChange;
  final Order order;

  @override
  State createState() => new CustomerDetailDialogState();
}

class CustomerDetailDialogState extends State<CustomerDetailDialog> {
  int _selectedTable;
  String name;
  String contactNumber;
  Order tempOrder;

  @override
  void initState() {
    super.initState();
    // _selectedTable = widget.initialValue;
    _selectedTable = null;
    tempOrder = widget.order;
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
                          print('Table no : $_selectedTable');
                          // print(_selectedTable is int);

                          // widget.order.tableNumber = _selectedTable;
                        });
                        // print(widget.order.tableNumber);
                      },
                    )
                  ],
                ),
                Text('Customer Name: ', style: TextStyle(fontSize: 60.w)),
                AppTextField(
                  onChanged: (value) {
                    // widget.order.customerName = value;
                    // print(widget.order.customerName);
                    name = value;
                  },
                ),
                Text('Phone Number: ', style: TextStyle(fontSize: 60.w)),
                AppTextField(
                  onChanged: (value) {
                    // widget.order.customerContact = value;
                    // print(widget.order.customerContact);
                    contactNumber = value;
                    print(contactNumber);
                  },
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: AppButton(
                    text: 'PROCEED',
                    onPressed: () {
                      //TODO: create customer in DB and return customer ID using callback
                      try {
                        tempOrder.tableNumber = _selectedTable;
                        tempOrder.customerName = name;
                        tempOrder.customerContact = contactNumber;
                      } catch (e) {
                        print(e);
                      }

                      // print(
                      //     'VALUE FROM FORM: ${widget.order.customerContact}, ${widget.order.customerName},${widget.order.tableNumber}');

                      Navigator.pop(context);
                      widget.onValueChange(tempOrder);
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
