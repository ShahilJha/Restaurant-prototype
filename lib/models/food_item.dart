import 'package:summer_project/utils/enum_util.dart';

import '../enumerators.dart';

class FoodItem {
  final int id;
  final String name;
  final int price;
  int quantity;
  int total;
  FoodItemStatus status;

  FoodItem({
    this.id,
    this.name,
    this.price,
    this.quantity = 0,
    this.total,
    this.status = FoodItemStatus.NotReady,
  });

  factory FoodItem.fromMap(Map<String, dynamic> map) => FoodItem(
        id: map['id'],
        name: map['name'],
        price: map['price'],
        quantity: map['quantity'],
        total: map['total'],
        status: EnumUtil.stringToFoodItemStatus(map['status']),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'price': price,
        'quantity': quantity,
        'total': total,
        'status': EnumUtil.foodItemStatusToString(status),
      };
}
