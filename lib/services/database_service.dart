import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:summer_project/enumerators.dart';
import 'package:summer_project/utils/enum_util.dart';

class DatabaseService {
  DatabaseService._privateConstructor();
  static final instance = DatabaseService._privateConstructor();

  static final _firestore = FirebaseFirestore.instance;

  void putTestData() async {
    _firestore.collection('orders').add({
      'tableNumber': 11,
      'customerContact': '9849000001',
      'dateCreated': DateTime.now(),
      'orderTakenByID': 20,
      'status': EnumUtil.orderStatusToString(OrderStatus.NewOrder),
      'readyItems': 0,
      'notReadyItems': 4,
      'servedItems': 0,
      'orders': [
        {
          'id': 2,
          'name': 'Cream of Chicken',
          'price': 225,
          'quantity': 2,
          'status': EnumUtil.foodItemStatusToString(FoodItemStatus.NotReady),
        },
        {
          'id': 12,
          'name': 'Classic Breakfast',
          'price': 330,
          'quantity': 1,
          'status': EnumUtil.foodItemStatusToString(FoodItemStatus.NotReady),
        },
        {
          'id': 48,
          'name': 'Margarita',
          'price': 380,
          'quantity': 1,
          'status': EnumUtil.foodItemStatusToString(FoodItemStatus.NotReady),
        },
        {
          'id': 61,
          'name': 'Napolitana',
          'price': 370,
          'quantity': 1,
          'status': EnumUtil.foodItemStatusToString(FoodItemStatus.NotReady),
        },
      ],
      'additionalOrders': [],
      'total': 110,
      'discount': 10,
      'netTotal': 100,
    });
  }
}
