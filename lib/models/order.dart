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
  int totalAdditionalOrderCount;
  int totalItemsCount;
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
    this.notReadyItems = 0,
    this.servedItems = 0,
    this.notAvailableItems = 0,
    this.totalOrderCount,
    this.totalAdditionalOrderCount,
    this.totalItemsCount,
    this.orders,
    this.additionalOrders,
    this.total = 0,
    this.discount = 0,
    this.netTotal = 0,
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
        totalAdditionalOrderCount: map['totalAdditionalOrderCount'],
        totalItemsCount: map['totalItemsCount'],
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
        'totalAdditionalOrderCount': totalAdditionalOrderCount,
        'totalItemsCount': totalItemsCount,
        'orders': List<dynamic>.from(orders.map((x) => x.toMap())),
        'additionalOrders':
            List<dynamic>.from(additionalOrders.map((x) => x.toMap())),
        'total': total,
        'discount': discount,
        'netTotal': netTotal,
      };

  void getOrdersWithTotalForItems() {
    if (orders.isNotEmpty) {
      for (int i = 0; i < orders.length; i++) {
        orders[i].total = orders[i].price * orders[i].quantity;
      }
    }
    if (additionalOrders.isNotEmpty) {
      for (int i = 0; i < additionalOrders.length; i++) {
        additionalOrders[i].total =
            additionalOrders[i].price * additionalOrders[i].quantity;
      }
    }
  }

  void getOrderTotalAmount() {
    int total = 0;
    if (orders.isNotEmpty) {
      for (var item in orders) {
        total = total + item.total;
      }
    }
    if (additionalOrders.isNotEmpty) {
      for (var item in additionalOrders) {
        total = total + item.total;
      }
    }
    this.total = total;
  }

  void updateInternalData() {
    getOrderItemsCount();
    updateItemStatusCount();
    updateOrderStatus();
  }

  void getOrderItemsCount() {
    totalOrderCount = orders.length;
    totalAdditionalOrderCount = additionalOrders.length;
    totalItemsCount = totalOrderCount + totalAdditionalOrderCount;
  }

  void updateItemStatusCount() {
    //TOdo: check if the total
    this.readyItems = 0;
    this.notReadyItems = 0;
    this.servedItems = 0;
    this.notAvailableItems = 0;
    if (orders.isNotEmpty) {
      for (var item in orders) {
        if (item.status == FoodItemStatus.Ready) {
          this.readyItems += item.quantity;
        } else if (item.status == FoodItemStatus.NotReady) {
          this.notReadyItems += item.quantity;
        } else if (item.status == FoodItemStatus.Served) {
          this.servedItems += item.quantity;
        } else if (item.status == FoodItemStatus.NotAvailable) {
          this.notAvailableItems += item.quantity;
        }
      }
    }
    if (additionalOrders.isNotEmpty) {
      for (var item in additionalOrders) {
        if (item.status == FoodItemStatus.Ready) {
          this.readyItems += item.quantity;
        } else if (item.status == FoodItemStatus.NotReady) {
          this.notReadyItems += item.quantity;
        } else if (item.status == FoodItemStatus.Served) {
          this.servedItems += item.quantity;
        } else if (item.status == FoodItemStatus.NotAvailable) {
          this.notAvailableItems += item.quantity;
        }
      }
    }
  }

  void updateOrderStatus() {
    if (notAvailableItems > 0) {
      status = OrderStatus.ItemNotAvailable;
    } else if (totalOrderCount > 0 &&
        totalOrderCount == notReadyItems &&
        totalAdditionalOrderCount == 0) {
      status = OrderStatus.NewOrder;
    } else if (servedItems > 0 &&
        notReadyItems != 0 &&
        totalItemsCount != servedItems) {
      status = OrderStatus.PartiallyFinishedOrder;
    } else if (totalItemsCount == servedItems &&
        notAvailableItems == 0 &&
        readyItems == 0 &&
        notReadyItems == 0) {
      status = OrderStatus.FinishedOrder;
    } else if (totalAdditionalOrderCount > 0 &&
        totalOrderCount != totalItemsCount) {
      status = OrderStatus.AdditionalOrder;
    }
  }
}
