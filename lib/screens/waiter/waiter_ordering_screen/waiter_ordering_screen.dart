import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:summer_project/models/category.dart';
import 'package:summer_project/models/food_item.dart';
import 'package:summer_project/models/order.dart';
import 'package:summer_project/widgets/app_action_chip.dart';
import 'package:summer_project/widgets/app_app_bar.dart';
import 'package:summer_project/widgets/app_container.dart';
import 'package:summer_project/widgets/sub_titles.dart';
import 'local_widgets/app_food_item_tile.dart';
import 'package:summer_project/menu.dart';

import 'local_widgets/customer_detail_dialog.dart';

class WaiterOrderingScreen extends StatefulWidget {
  final bool newOrderFlag;
  final Order order;

  const WaiterOrderingScreen({Key key, this.newOrderFlag, this.order})
      : super(key: key);
  @override
  _WaiterOrderingScreenState createState() => _WaiterOrderingScreenState();
}

class _WaiterOrderingScreenState extends State<WaiterOrderingScreen> {
  Category category = categoryFromMap(Menu.instance.menu);
  String selectedCategory; // current selected category
  int selectedCategoryIndex;
  List<FoodItem> newOrdersList = [];

  //Order object to track order
  Order order;

  @override
  void initState() {
    super.initState();
    selectedCategory = category.categories.first.categoryName;
    selectedCategoryIndex = 0;

    order = widget.order;

    if (widget.newOrderFlag == true) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        _customerDetailForm(context);
      });
    }
  }

  void _customerDetailForm(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => CustomerDetailDialog(
        onValueChange: (changedOrder) {
          setState(() {
            order = changedOrder;
          });
          // order = changedOrder;

          print(
              'VALUE FROM FORM: ${order.customerContact}, ${order.customerName},${order.tableNumber}');
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print(order.customerName);

    return Scaffold(
      appBar: KAppBar(
        title: 'ORDERING MENU',
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.table_rows),
        onPressed: () {
          Navigator.of(context).pushNamed(
            '/waiter_order_cart_screen',
            arguments: {
              'newOrderFlag': widget.newOrderFlag,
              'order': order,
              'newOrdersList': newOrdersList,
            },
          );
        },
      ),
      body: AppContainer(
        child: ListView(
          children: [
            Subtitles(string: 'CATEGORY'),
            Container(
              height: 150.w,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: category.categories.length,
                itemBuilder: (context, index) {
                  return AppActionChip(
                    string: category.categories[index].categoryName,
                    backgroundColor: selectedCategory ==
                            category.categories[index].categoryName
                        ? Theme.of(context).primaryColor
                        : null,
                    textColor: selectedCategory ==
                            category.categories[index].categoryName
                        ? Colors.white
                        : null,
                    onPressed: () {
                      setState(() {
                        selectedCategory =
                            category.categories[index].categoryName;
                        selectedCategoryIndex = index;
                      });
                    },
                  );
                },
              ),
            ),
            Subtitles(string: 'ITEMS'),
            SizedBox(height: 25.h),
            Container(
              height: 1575.h,
              child: ListView.builder(
                physics: ClampingScrollPhysics(),
                addAutomaticKeepAlives: false,
                shrinkWrap: true,
                itemCount: category
                    .categories[selectedCategoryIndex].categoryItems.length,
                itemBuilder: (context, index) {
                  //make a method that checks if the item is in the newOrderList and change value accordingly
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: AppFoodItemTile(
                      itemName: category.categories[selectedCategoryIndex]
                          .categoryItems[index].name,
                      itemPrice: category.categories[selectedCategoryIndex]
                          .categoryItems[index].price,
                      isSelected: category.categories[selectedCategoryIndex]
                          .categoryItems[index].isSelected,
                      toggleIsSelect: () {
                        setState(() => category
                            .categories[selectedCategoryIndex]
                            .categoryItems[index]
                            .toggleIsSelected());
                        category.categories[selectedCategoryIndex]
                            .categoryItems[index].quantity = 1;
                      },
                      quantity: category.categories[selectedCategoryIndex]
                          .categoryItems[index].quantity,
                      onQuantityChange: (qty) => setState(
                        () {
                          category.categories[selectedCategoryIndex]
                              .categoryItems[index].quantity = qty;
                          int i = newOrdersList.indexWhere((element) =>
                              element.id ==
                              category.categories[selectedCategoryIndex]
                                  .categoryItems[index].id);
                          newOrdersList[i].quantity = qty;
                        },
                      ),
                      onAdd: () {
                        Map map = category.categories[selectedCategoryIndex]
                            .categoryItems[index]
                            .toMap();
                        print('Map:$map');
                        FoodItem item = FoodItem.fromMap(map);
                        print(
                            'item:${item.id}:${item.name} and ${item.quantity}');

                        newOrdersList.add(item);
                      },
                      onCancel: () {
                        Map map = category.categories[selectedCategoryIndex]
                            .categoryItems[index]
                            .toMap();
                        FoodItem item = FoodItem.fromMap(map);
                        // newOrdersList.remove(item);
                        newOrdersList.retainWhere((element) =>
                            element.id !=
                            category.categories[selectedCategoryIndex]
                                .categoryItems[index].id);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
