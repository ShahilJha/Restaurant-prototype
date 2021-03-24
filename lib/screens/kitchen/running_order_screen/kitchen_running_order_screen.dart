import 'package:flutter/material.dart';
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
        child: ListView(
          children: [],
        ),
      ),
    );
  }
}
