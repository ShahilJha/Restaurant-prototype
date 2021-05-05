import 'package:summer_project/models/food_item.dart';

import '../enumerators.dart';
import 'customer.dart';

class Order {
  int id;
  int tableNumber;
  Customer customer;
  DateTime dateCreated;
  int orderTakenByID;
  OrderStatus status;
  int readyItems;
  int notReadyItems;
  int servedItems;
  List<FoodItem> orders;
  List<FoodItem> additionalOrders;
  int total;
  int discount;
  int netTotal;

  Order({
    this.id,
    this.tableNumber,
    this.customer,
    this.dateCreated,
    this.orderTakenByID,
    this.status = OrderStatus.NewOrder,
    this.readyItems,
    this.notReadyItems,
    this.servedItems,
    this.orders,
    this.additionalOrders,
    this.total,
    this.discount,
    this.netTotal,
  });
}
