import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:summer_project/models/food_item.dart';
import 'package:summer_project/models/order.dart';
import 'package:summer_project/utils/enum_util.dart';
import 'package:summer_project/utils/order_util.dart';
import 'package:summer_project/widgets/app_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:summer_project/widgets/app_button.dart';
import 'package:summer_project/widgets/app_container.dart';
import 'package:summer_project/widgets/app_table_components.dart';
import 'package:summer_project/widgets/attribute_display.dart';
import 'package:summer_project/widgets/order_no.dart';
import 'package:summer_project/widgets/sub_titles.dart';
import 'package:summer_project/widgets/table_no.dart';

import 'local_widgets/payment_details.dart';
import 'local_widgets/receptionist_order_table.dart';

class ReceptionistOrderDetailsScreen extends StatelessWidget {
  final Order order;
  const ReceptionistOrderDetailsScreen({Key key, this.order}) : super(key: key);

  List<TableRow> getOrderList(List<FoodItem> list) {
    int index = 0;
    List<TableRow> orderList = [];
    for (var order in list) {
      orderList.add(
        TableRow(
          decoration: BoxDecoration(
            color: Colors.grey[100],
          ),
          children: [
            AppDataCell(string: {++index}.toString()),
            AppDataCell(string: order.name),
            AppDataCell(string: order.price.toString()),
            AppDataCell(string: order.quantity.toString()),
            AppDataCell(string: order.total.toString()),
          ],
        ),
      );
    }
    return orderList;
  }

  @override
  Widget build(BuildContext context) {
    print(order.additionalOrders.isEmpty);
    // print(order.additionalOrders[0].name);
    return Scaffold(
      appBar: KAppBar(
        title: 'ORDER DETAILS',
      ),
      body: AppContainer(
        child: ListView(
          children: [
            TableNumber(tableNumber: 12),
            OrderID(
              orderID: order.id,
            ),
            AttributeDisplay(
              attribute: 'Customer Name',
              string: order.customerName,
            ),
            AttributeDisplay(
              attribute: 'Phone no.',
              string: order.customerContact,
            ),
            AttributeDisplay(
              attribute: 'Order Status',
              string: EnumUtil.orderStatusToString(order.status),
            ),
            Divider(),
            Subtitles(string: 'Orders'),
            ReceptionistOrderTable(list: order.orders),
            Visibility(
              visible: order.additionalOrders.isEmpty ? false : true,
              child: Column(
                children: [
                  Subtitles(string: 'Additional Orders'),
                  ReceptionistOrderTable(list: order.additionalOrders),
                ],
              ),
            ),
            PaymentDetails(
              total: order.total,
              discount: order.discount,
              netTotal: order.netTotal,
            ),
            AppButton(
              text: 'CLOSE ORDER',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
