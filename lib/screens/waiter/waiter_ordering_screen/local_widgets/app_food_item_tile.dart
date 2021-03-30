import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:summer_project/widgets/app_quantity_selector.dart';
import 'package:summer_project/widgets/attribute_display.dart';

class AppFoodItemTile extends StatelessWidget {
  final String itemName;
  final int itemPrice;
  final bool isSelected;

  const AppFoodItemTile(
      {Key key, this.itemName, this.itemPrice, this.isSelected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 300.h,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.all(Radius.circular(50.w)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // color: Colors.red,
              width: 515.w,
              padding: EdgeInsets.symmetric(vertical: 50.h, horizontal: 50.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Item Name:',
                    style: TextStyle(
                        fontSize: 30.ssp, fontStyle: FontStyle.italic),
                  ),
                  Text(
                    itemName,
                    maxLines: 1,
                    overflow: TextOverflow.fade,
                    style: TextStyle(fontSize: 45.ssp),
                  ),
                  Row(
                    children: [
                      Text(
                        'Item Price: ',
                        style: TextStyle(
                            fontSize: 30.ssp, fontStyle: FontStyle.italic),
                      ),
                      Text(
                        'Rs.$itemPrice',
                        overflow: TextOverflow.fade,
                        style: TextStyle(fontSize: 50.ssp),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Spacer(),
            isSelected == false
                ? FoodItemAddButton()
                : FoodItemQuantitySelector(),
          ],
        ),
      ),
    );
  }
}

class FoodItemAddButton extends StatelessWidget {
  const FoodItemAddButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 515.w,
      width: 300.w,
      alignment: Alignment.centerRight,
      decoration: BoxDecoration(
        color: Colors.lightGreen,
        borderRadius: BorderRadius.all(Radius.circular(50.w)),
      ),
      child: Center(
        child: Text(
          'ADD',
          style: TextStyle(fontSize: 75.w, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

class FoodItemQuantitySelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 515.w,
      decoration: BoxDecoration(
        // color: Colors.red,
        borderRadius: BorderRadius.all(Radius.circular(50.w)),
      ),
      child: Row(
        children: [
          Container(
            width: 390.w,
            child: AppQuantitySelector(),
          ),
          Container(
            width: 125.w,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(Radius.circular(50.w)),
            ),
            child: Center(
              child: Icon(Icons.highlight_off),
            ),
          ),
        ],
      ),
    );
  }
}
