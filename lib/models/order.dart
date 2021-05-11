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
    this.customerContact,
    this.customerName,
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
        orders:
            List<FoodItem>.from(map['orders'].map((x) => FoodItem.fromMap(x))),
        additionalOrders:
            List<FoodItem>.from(map['orders'].map((x) => FoodItem.fromMap(x))),
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
        'orders': List<dynamic>.from(orders.map((x) => x.toMap())),
        'additionalOrders':
            List<dynamic>.from(additionalOrders.map((x) => x.toMap())),
        'total': total,
        'discount': discount,
        'netTotal': netTotal,
      };
}
