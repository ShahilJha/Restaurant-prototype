import '../enumerators.dart';
import 'customer.dart';

class Order {
  final int id;
  final DateTime dateCreated;
  final int customerID;
  final int orderTakenByID;
  OrderStatus status;
  int readyItems;
  int notReadyItems;
  int servedItems;
  List<Order> orders;
  List<Order> additionalOrders;
  int total;
  int discount;
  int netTotal;

  Order({
    this.id,
    this.dateCreated,
    this.customerID,
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
