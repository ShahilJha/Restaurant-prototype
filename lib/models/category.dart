// To parse this JSON data, do
//
//     final category = categoryFromMap(jsonString);

import 'dart:convert';

import '../enumerators.dart';

Category categoryFromMap(String str) => Category.fromMap(json.decode(str));

String categoryToMap(Category data) => json.encode(data.toMap());

class Category {
  Category({
    this.categories,
  });

  List<CategoryElement> categories;

  factory Category.fromMap(Map<String, dynamic> json) => Category(
        categories: List<CategoryElement>.from(
            json["Categories"].map((x) => CategoryElement.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "Categories": List<dynamic>.from(categories.map((x) => x.toMap())),
      };
}

class CategoryElement {
  CategoryElement({
    this.categoryName,
    this.categoryItems,
  });

  String categoryName;
  List<CategoryItem> categoryItems;

  factory CategoryElement.fromMap(Map<String, dynamic> json) => CategoryElement(
        categoryName: json["CategoryName"],
        categoryItems: List<CategoryItem>.from(
            json["CategoryItems"].map((x) => CategoryItem.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "CategoryName": categoryName,
        "CategoryItems":
            List<dynamic>.from(categoryItems.map((x) => x.toMap())),
      };
}

class CategoryItem {
  CategoryItem({
    this.id,
    this.name,
    this.price,
    this.quantity = 1,
    this.isSelected = false,
    this.status = FoodItemStatus.NotReady,
  });

  int id;
  String name;
  int price;
  int quantity;
  bool isSelected;
  FoodItemStatus status;

  void toggleIsSelected() {
    isSelected = !isSelected;
  }

  String mapStatusToString(FoodItemStatus status) {
    String string;
    if (status == FoodItemStatus.Ready) {
      string = "READY";
    } else if (status == FoodItemStatus.NotReady) {
      string = "NOT READY";
    } else if (status == FoodItemStatus.Served) {
      string = "SERVED";
    } else if (status == FoodItemStatus.NotAvailable) {
      string = "NOT AVAILABLE";
    }
    return string;
  }

  factory CategoryItem.fromMap(Map<String, dynamic> json) => CategoryItem(
        id: json["ID"],
        name: json["name"],
        price: json["price"],
      );

  Map<String, dynamic> toMap() => {
        "ID": id,
        "name": name,
        "price": price,
        "quantity": quantity,
        "status": mapStatusToString(status),
      };
}
