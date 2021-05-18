import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:summer_project/models/order.dart';
import 'package:summer_project/screens/kitchen/running_order_screen/local_widgets/kitchen_order_tile.dart';
import 'package:summer_project/services/database_service.dart';
import 'package:summer_project/utils/utility.dart';
import 'package:summer_project/widgets/app_app_bar.dart';
import 'package:summer_project/widgets/app_container.dart';

class KitchenOrderListScreen extends StatelessWidget {
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
                final order = orderFromMap(orderData);
                return KitchenOrderTile(
                  order: order,
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed('/kitchen_order_details', arguments: order);
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
