import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:summer_project/services/database_service.dart';
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
                    print(orderID);
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
