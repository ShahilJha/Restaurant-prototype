import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:summer_project/widgets/app_quantity_selector.dart';

//TODO: make a Funtion(x) method to give the selected qty to the screen
class AppFoodItemTile extends StatefulWidget {
  final String itemName;
  final int itemPrice;

  const AppFoodItemTile({
    Key key,
    this.itemName,
    this.itemPrice,
  }) : super(key: key);

  @override
  _AppFoodItemTileState createState() => _AppFoodItemTileState();
}

class _AppFoodItemTileState extends State<AppFoodItemTile> {
  bool isSelected = false;

  void toggleIsSelected() {
    setState(() {
      isSelected = !isSelected;
    });
  }

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
                    widget.itemName,
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
                        'Rs.${widget.itemPrice}',
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
                ? FoodItemAddButton(onPressed: toggleIsSelected)
                : FoodItemQuantitySelector(onPressed: toggleIsSelected),
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
  final Function onPressed;
  const FoodItemQuantitySelector({Key key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
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
      ),
    );
  }
}
