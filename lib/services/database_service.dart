import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:summer_project/enumerators.dart';
import 'package:summer_project/models/KitchenStaff.dart';
import 'package:summer_project/models/order.dart';
import 'package:summer_project/models/watier.dart';
import 'package:summer_project/utils/enum_util.dart';
import '../models/receptionist.dart';

class DatabaseService {
  DatabaseService._privateConstructor();
  static final instance = DatabaseService._privateConstructor();

  static final _firestore = FirebaseFirestore.instance;
  FirebaseFirestore get firestore => _firestore;

  //<<-----------TEST----------->>
  void addNewStaffMemberDetails({
    String id,
    String userName,
    String contactNumber,
    String address,
    String gender,
    DateTime registrationDate,
    JobPosition position,
  }) {
    try {
      _firestore.collection('staffs').add({
        'id ': id,
        'userName ': userName,
        'contactNumber ': contactNumber,
        'address ': address,
        'gender ': gender,
        'registrationDate ': registrationDate,
        'position ': EnumUtil.jobPositionToString(position),
      });
    } catch (e) {
      print('EXCEPTION: -addNewStaffMemberDetails--> $e');
    }
  }

  //<<-----------TEST----------->>
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

  Future<dynamic> getStaffDetailsByID(String id) async {
    try {
      var documentQuery = await _firestore
          .collection('staffs')
          .where('id', isEqualTo: id)
          .get();
      var document = documentQuery.docs.first.data();
      JobPosition position =
          EnumUtil.stringToJobPosition(document['jobPosition']);
      if (position == JobPosition.Receptionist) {
        Receptionist receptionist = receptionistFromMap(document);
        return receptionist;
      } else if (position == JobPosition.KitchenStaff) {
        KitchenStaff kitchenStaff = kitchenStaffFromMap(document);
        return kitchenStaff;
      } else if (position == JobPosition.Waiter) {
        Waiter waiter = waiterFromMap(document);
        return waiter;
      }
    } catch (e) {
      print('EXCEPTION: -getStaffObjectByID--> $e');
    }
  }

  Future<Order> getOrderByID(String id) async {
    try {
      var documentQuery = await _firestore
          .collection('orders')
          .where('id', isEqualTo: id)
          .get();
      var document = documentQuery.docs.first.data();
      return orderFromMap(document);
    } catch (e) {
      print('EXCEPTION: -getOrderByID--> $e');
    }
  }

  Future<void> createNewOrder(Order order) async {
    try {
      _firestore.collection('orders').add(orderToMap(order));
    } catch (e) {
      print('EXCEPTION: -createNewOrder--> $e');
    }
  }

  Future<void> deleteOrderByID(String id) async {
    _firestore.collection('orders').where('id', isEqualTo: id).get().then(
        (value) =>
            _firestore.collection('orders').doc(value.docs.first.id).delete());
  }

  Future<void> updateOrder(Order order) async {
    _firestore.collection('orders').where('id', isEqualTo: order.id).get().then(
        (value) => _firestore
            .collection('orders')
            .doc(value.docs.first.id)
            .update(orderToMap(order)));
  }
}
