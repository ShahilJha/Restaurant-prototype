import 'package:cloud_firestore/cloud_firestore.dart';
import './food_item.dart';
import '../utils/enum_util.dart';

import '../enumerators.dart';

Order orderFromMap(Map map) => Order.fromMap(map);
Map<String, dynamic> orderToMap(Order data) => data.toMap();

class Order {
  String id;
  int tableNumber;
  String customerContact;
  String customerName;
  DateTime dateCreated;
  String orderTakenByID;
  OrderStatus status;
  int readyItems;
  int notReadyItems;
  int servedItems;
  int notAvailableItems;
  int totalOrderCount;
  List<FoodItem> orders;
  List<FoodItem> additionalOrders;
  int total;
  int discount;
  int netTotal;

  Order({
    this.id,
    this.tableNumber,
    this.customerContact,
    this.customerName,
    this.dateCreated,
    this.orderTakenByID,
    this.status = OrderStatus.NewOrder,
    this.readyItems = 0,
    this.notReadyItems,
    this.servedItems = 0,
    this.notAvailableItems = 0,
    this.totalOrderCount,
    this.orders,
    this.additionalOrders,
    this.total = 0,
    this.discount,
    this.netTotal,
  });

  factory Order.fromMap(Map<String, dynamic> map) => Order(
        id: map['id'],
        tableNumber: map['tableNumber'],
        customerContact: map['customerContact'],
        customerName: map['customerName'],
        dateCreated: map['dateCreated'].toDate(),
        orderTakenByID: map['orderTakenByID'],
        status: EnumUtil.stringToOrderStatus(map['status']),
        readyItems: map['readyItems'],
        notReadyItems: map['notReadyItems'],
        servedItems: map['servedItems'],
        notAvailableItems: map['notAvailableItems'],
        totalOrderCount: map['totalOrderCount'],
        orders:
            List<FoodItem>.from(map['orders'].map((x) => FoodItem.fromMap(x))),
        additionalOrders: List<FoodItem>.from(
            map['additionalOrders'].map((x) => FoodItem.fromMap(x))),
        total: map['total'],
        discount: map['discount'],
        netTotal: map['netTotal'],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'tableNumber': tableNumber,
        'customerContact': customerContact,
        'customerName': customerName,
        'dateCreated': Timestamp.fromDate(dateCreated),
        'orderTakenByID': orderTakenByID,
        'status': EnumUtil.orderStatusToString(status),
        'readyItems': readyItems,
        'notReadyItems': notReadyItems,
        'servedItems': servedItems,
        'notAvailableItems': notAvailableItems,
        'totalOrderCount': totalOrderCount,
        'orders': List<dynamic>.from(orders.map((x) => x.toMap())),
        'additionalOrders':
            List<dynamic>.from(additionalOrders.map((x) => x.toMap())),
        'total': total,
        'discount': discount,
        'netTotal': netTotal,
      };

  void getOrdersWithTotalForItems(Order order) {
    if (order.orders.isNotEmpty) {
      for (int i = 0; i < order.orders.length; i++) {
        order.orders[i].total =
            order.orders[i].price * order.orders[i].quantity;
      }
    }
    if (order.additionalOrders.isNotEmpty) {
      for (int i = 0; i < order.additionalOrders.length; i++) {
        order.additionalOrders[i].total = order.additionalOrders[i].price *
            order.additionalOrders[i].quantity;
      }
    }
  }

  void getOrderTotalAmount(Order order) {
    int total = 0;
    if (order.orders.isNotEmpty) {
      for (var item in order.orders) {
        total = total + item.total;
      }
    }
    if (order.additionalOrders.isNotEmpty) {
      for (var item in order.additionalOrders) {
        total = total + item.total;
      }
    }
    order.total = total;
    print('TOTAL: ${order.total}');
  }
}
