import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:summer_project/enumerators.dart';
import 'package:summer_project/models/KitchenStaff.dart';
import 'package:summer_project/models/app_user.dart';
import 'package:summer_project/models/watier.dart';
import 'package:summer_project/utils/enum_util.dart';
import '../models/receptionist.dart';

class DatabaseService {
  DatabaseService._privateConstructor();
  static final instance = DatabaseService._privateConstructor();

  static final _firestore = FirebaseFirestore.instance;

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

  Future<dynamic> getStaffObject(String id) async {
    var documentQuery =
        await _firestore.collection('staffs').where('id', isEqualTo: id).get();
    // document.get() => then((document) {
    // print(document("name"));
    // });
    var document = documentQuery.docs.first.data();
    JobPosition position =
        EnumUtil.stringToJobPosition(document['jobPosition']);
    if (position == JobPosition.Receptionist) {
      Receptionist receptionist = receptionistFromMap(document);
      return receptionist;
      print('LOG#: -getStaffDetail--> ${receptionist.contactNumber}');
    } else if (position == JobPosition.KitchenStaff) {
      KitchenStaff kitchenStaff = kitchenStaffFromMap(document);
      return kitchenStaff;
    } else if (position == JobPosition.Waiter) {
      Waiter waiter = waiterFromMap(document);
      return waiter;
    }
  }
}
