import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:summer_project/models/order.dart';
import 'package:summer_project/services/database_service.dart';
import 'package:summer_project/utils/enum_util.dart';
import 'package:summer_project/widgets/app_app_bar.dart';
import 'package:summer_project/widgets/app_button.dart';
import 'package:summer_project/widgets/app_container.dart';
import 'package:summer_project/widgets/attribute_display.dart';
import 'package:summer_project/widgets/order_no.dart';
import 'package:summer_project/widgets/sub_titles.dart';
import 'package:summer_project/widgets/table_no.dart';

import 'local_widgets/payment_details.dart';
import 'local_widgets/receptionist_order_table.dart';

class ReceptionistOrderDetailsScreen extends StatefulWidget {
  final Order order;
  const ReceptionistOrderDetailsScreen({Key key, this.order}) : super(key: key);

  @override
  _ReceptionistOrderDetailsScreenState createState() =>
      _ReceptionistOrderDetailsScreenState();
}

class _ReceptionistOrderDetailsScreenState
    extends State<ReceptionistOrderDetailsScreen> {
  int netTotal;

  @override
  void initState() {
    super.initState();
    widget.order.getOrdersWithTotalForItems();
    widget.order.getOrderTotalAmount();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KAppBar(
        title: 'ORDER DETAILS',
      ),
      body: AppContainer(
        child: ListView(
          children: [
            TableNumber(tableNumber: 12),
            OrderID(
              orderID: widget.order.id,
            ),
            AttributeDisplay(
              attribute: 'Customer Name',
              string: widget.order.customerName,
            ),
            AttributeDisplay(
              attribute: 'Phone no.',
              string: widget.order.customerContact,
            ),
            AttributeDisplay(
              attribute: 'Order Status',
              string: EnumUtil.orderStatusToString(widget.order.status),
            ),
            Divider(),
            Subtitles(string: 'Orders'),
            ReceptionistOrderTable(list: widget.order.orders),
            Visibility(
              visible: widget.order.additionalOrders.isEmpty ? false : true,
              child: Column(
                children: [
                  Subtitles(string: 'Additional Orders'),
                  ReceptionistOrderTable(list: widget.order.additionalOrders),
                  Divider(),
                ],
              ),
            ),
            PaymentDetails(
              total: widget.order.total,
              netTotal: netTotal != null ? netTotal : widget.order.total,
              onDiscountChange: (discount) {
                widget.order.discount = discount;
                setState(() {
                  netTotal = widget.order.total - discount;
                });
                widget.order.netTotal = netTotal;
              },
            ),
            AppButton(
              text: 'CLOSE ORDER',
              onPressed: () {
                //deleting the order after finishing work
                DatabaseService.instance.deleteOrderByID(
                  context: context,
                  id: widget.order.id,
                );
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
