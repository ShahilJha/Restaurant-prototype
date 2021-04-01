import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:summer_project/models/category.dart';
import 'package:summer_project/widgets/app_action_chip.dart';
import 'package:summer_project/widgets/app_app_bar.dart';
import 'package:summer_project/widgets/app_button.dart';
import 'package:summer_project/widgets/app_container.dart';
import 'package:summer_project/widgets/app_textfield.dart';
import 'package:summer_project/widgets/sub_titles.dart';
import 'local_widgets/app_food_item_tile.dart';
import 'package:summer_project/menu.dart';

class WaiterOrderingScreen extends StatefulWidget {
  final bool newOrder;

  const WaiterOrderingScreen({Key key, this.newOrder}) : super(key: key);
  @override
  _WaiterOrderingScreenState createState() => _WaiterOrderingScreenState();
}

class _WaiterOrderingScreenState extends State<WaiterOrderingScreen> {
  Category category = categoryFromMap(Menu.instance.menu);
  List menuData; //list of all data -> Categories
  String selectedCategory; // current selected category
  List<CategoryItem> selectedCategoryItems; // current selected category items

  @override
  void initState() {
    super.initState();
    menuData = category.categories;
    selectedCategory = menuData.first.categoryName;
    selectedCategoryItems = menuData.first.categoryItems;

    if (widget.newOrder == true) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await _customerDetailForm(context);
      });
    }
  }

  void _customerDetailForm(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.w)),
        title: const Text(
          'ITEM NAME',
          textAlign: TextAlign.center,
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Table no.: ', style: TextStyle(fontSize: 60.w)),
                  DropdownButton<int>(
                    hint: Text('Pick Table'),
                    items: <int>[1, 2, 3, 4, 5, 6].map((int value) {
                      return new DropdownMenuItem<int>(
                        value: value,
                        child: new Text(value.toString()),
                      );
                    }).toList(),
                    onChanged: (_) {},
                  )
                ],
              ),
              Text('Customer Name: ', style: TextStyle(fontSize: 60.w)),
              AppTextField(padding: EdgeInsets.all(0)),
              Text('Phone Number: ', style: TextStyle(fontSize: 60.w)),
              AppTextField(padding: EdgeInsets.all(0)),
              Container(
                alignment: Alignment.bottomCenter,
                child: AppButton(
                  text: 'PROCEED',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print(widget.newOrder);

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
                itemCount: menuData.length,
                itemBuilder: (context, index) {
                  CategoryElement category = menuData[index];
                  return AppActionChip(
                    string: category.categoryName,
                    backgroundColor: selectedCategory == category.categoryName
                        ? Theme.of(context).primaryColor
                        : null,
                    textColor: selectedCategory == category.categoryName
                        ? Colors.white
                        : null,
                    onPressed: () {
                      setState(() {
                        selectedCategory = category.categoryName;
                        selectedCategoryItems = category.categoryItems;
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
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: AppFoodItemTile(
                      itemName: item.name,
                      itemPrice: item.price,
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
