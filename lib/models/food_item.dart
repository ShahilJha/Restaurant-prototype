import '../enumerators.dart';

class FoodItem {
  final int id;
  final String name;
  final int price;
  int quantity;
  FoodItemStatus status;

  FoodItem({
    this.id,
    this.name,
    this.price,
    this.quantity = 0,
    this.status = FoodItemStatus.NotReady,
  });
}
