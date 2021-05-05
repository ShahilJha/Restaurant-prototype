import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:summer_project/models/category.dart';
import 'package:summer_project/models/order.dart';
import 'package:summer_project/widgets/app_action_chip.dart';
import 'package:summer_project/widgets/app_app_bar.dart';
import 'package:summer_project/widgets/app_container.dart';
import 'package:summer_project/widgets/sub_titles.dart';
import 'local_widgets/app_food_item_tile.dart';
import 'package:summer_project/menu.dart';

import 'local_widgets/customer_detail_dialog.dart';

class WaiterOrderingScreen extends StatefulWidget {
  final bool newOrder;

  const WaiterOrderingScreen({Key key, this.newOrder}) : super(key: key);
  @override
  _WaiterOrderingScreenState createState() => _WaiterOrderingScreenState();
}

class _WaiterOrderingScreenState extends State<WaiterOrderingScreen> {
  Category category = categoryFromMap(Menu.instance.menu);
  // List menuData; //list of all data -> Categories
  String selectedCategory; // current selected category
  List<CategoryItem> selectedCategoryItems; // current selected category items
  int selectedCategoryIndex;

  //Order object to track order
  Order order;

  String customerName;
  String customerContact;
  int tableNumber;

  @override
  void initState() {
    super.initState();
    // menuData = category.categories;
    selectedCategory = category.categories.first.categoryName;
    selectedCategoryItems = category.categories.first.categoryItems;
    selectedCategoryIndex = 0;

    if (widget.newOrder == true) {
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
        initialValue: tableNumber,
        onValueChange: (value) {
          setState(() {
            tableNumber = value;
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print(category.categories[selectedCategoryIndex].categoryItems);
    return Scaffold(
      appBar: KAppBar(
        title: 'ORDERING MENU',
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.table_rows),
        onPressed: () {
          Navigator.of(context).pushNamed('/waiter_order_cart_screen');
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
                        selectedCategoryItems =
                            category.categories[index].categoryItems;
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
              // color: Colors.red,
              height: 1575.h,
              child: ListView.builder(
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: selectedCategoryItems.length,
                itemBuilder: (context, index) {
                  CategoryItem item = selectedCategoryItems[index];

                  // category
                  //     .categories[selectedCategoryIndex].categoryItems[index];

                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: AppFoodItemTile(
                      itemName: category.categories[selectedCategoryIndex]
                          .categoryItems[index].name,
                      itemPrice: category.categories[selectedCategoryIndex]
                          .categoryItems[index].price,
                      isSelected: category.categories[selectedCategoryIndex]
                          .categoryItems[index].isSelected,
                      toggleIsSelect: () => setState(() => category
                          .categories[selectedCategoryIndex]
                          .categoryItems[index]
                          .toggleIsSelected()),
                      quantity: category.categories[selectedCategoryIndex]
                          .categoryItems[index].quantity,
                      onQuantityChange: (qty) => setState(() => category
                          .categories[selectedCategoryIndex]
                          .categoryItems[index]
                          .quantity = qty),
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
