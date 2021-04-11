import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:summer_project/models/category.dart';
import 'package:summer_project/widgets/app_quantity_selector.dart';

//TODO: make a Funtion(x) method to give the selected qty to the screen
class AppFoodItemTile extends StatefulWidget {
  final CategoryItem item;

  const AppFoodItemTile({
    Key key,
    this.item,
  }) : super(key: key);

  @override
  _AppFoodItemTileState createState() => _AppFoodItemTileState();
}

class _AppFoodItemTileState extends State<AppFoodItemTile> {
  CategoryItem foodItem;

  @override
  void initState() {
    super.initState();
    foodItem = widget.item;
  }

  void toggleIsSelected() => setState(() => foodItem.toggleIsSelected());

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
                    foodItem.name,
                    maxLines: 1,
                    overflow: TextOverflow.fade,
                    style: TextStyle(fontSize: 35.ssp),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Text(
                        'Item Price: ',
                        style: TextStyle(
                            fontSize: 30.ssp, fontStyle: FontStyle.italic),
                      ),
                      Text(
                        'Rs.${foodItem.price}',
                        overflow: TextOverflow.fade,
                        style: TextStyle(fontSize: 45.ssp),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Spacer(),
            foodItem.isSelected == false
                ? FoodItemAddButton(onPressed: toggleIsSelected)
                : FoodItemQuantitySelector(
                    onPressed: toggleIsSelected,
                    onQuantityChange: (qty) => foodItem.quantity = qty,
                  ),
          ],
        ),
      ),
    );
  }
}

class FoodItemAddButton extends StatelessWidget {
  final Function onPressed;
  const FoodItemAddButton({
    Key key,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
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
      ),
    );
  }
}

class FoodItemQuantitySelector extends StatelessWidget {
  final Function onQuantityChange;
  final Function onPressed;
  const FoodItemQuantitySelector(
      {Key key, this.onPressed, this.onQuantityChange})
      : super(key: key);

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
            child: AppQuantitySelector(
              onQuantityChange: (qty) => onQuantityChange(qty),
            ),
          ),
          GestureDetector(
            onTap: onPressed,
            child: Container(
              width: 125.w,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(50.w)),
              ),
              child: Center(
                child: Icon(Icons.highlight_off),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
