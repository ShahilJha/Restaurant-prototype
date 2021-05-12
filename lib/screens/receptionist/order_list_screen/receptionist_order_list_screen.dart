import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:summer_project/models/food_item.dart';
import 'package:summer_project/models/order.dart';
import 'package:summer_project/services/database_service.dart';
import 'package:summer_project/utils/enum_util.dart';
import 'package:summer_project/widgets/app_app_bar.dart';
import 'package:summer_project/widgets/app_container.dart';

import 'local_widgets/receptionist_order_tile.dart';

class ReceptionistOrderListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KAppBar(
        title: 'RUNNING ORDERS',
      ),
      body: AppContainer(
        child: StreamBuilder(
          stream: DatabaseService.instance.firestore
              .collection('orders')
              .orderBy('dateCreated', descending: false)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            final orderList = snapshot.data.docs;
            return ListView.builder(
              itemCount: orderList.length,
              itemBuilder: (context, index) {
                final orderData = orderList[index].data();
                final orderID = orderList[index].id;
                return ReceptionistOrderTile(
                  tableNumber: orderData['tableNumber'],
                  orderID: orderID,
                  customerName: orderData['customerName'],
                  customerContact: orderData['customerContact'],
                  onPressed: () {
                    print('PRESSED ON ORDER TILE');
                    print(orderFromMap(orderData).id);

                    //todo: make adjustments
                    Navigator.of(context).pushNamed(
                      '/receptionist_order_detail',
                      arguments: orderFromMap(orderData),

                      // arguments: Order(
                      //   id: orderData['id'],
                      //   customerName: orderData['customerName'],
                      //   customerContact: orderData['customerContact'],
                      //   tableNumber: orderData['tableNumber'],
                      //   dateCreated: orderData['dateCreated'].toDate(),
                      //   total: orderData['total'],
                      //   discount: orderData['discount'],
                      //   netTotal: orderData['netTotal'],
                      //   additionalOrders: List<FoodItem>.from(
                      //       orderData['additionalOrders']
                      //           .map((x) => FoodItem.fromMap(x))),
                      //   orders: List<FoodItem>.from(orderData['orders']
                      //       .map((x) => FoodItem.fromMap(x))),
                      //   servedItems: orderData['servedItems'],
                      //   notReadyItems: orderData['notReadyItems'],
                      //   readyItems: orderData['readyItems'],
                      //   status:
                      //       EnumUtil.stringToOrderStatus(orderData['status']),
                      //   orderTakenByID: orderData['orderTakenByID '],
                      // ),
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
