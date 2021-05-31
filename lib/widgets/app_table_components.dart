import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTable extends StatelessWidget {
  final List<TableRow> children;
  final Map<int, TableColumnWidth> columnWidths;
  final List<Widget> headerChildren;
  final List<TableRow> dataChildren;

  const AppTable({
    Key key,
    this.children,
    this.columnWidths,
    this.headerChildren,
    this.dataChildren,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30.h),
      child: Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        columnWidths: columnWidths,
        children: [
          TableRow(
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50.w),
                topRight: Radius.circular(50.w),
              ),
            ),
            children: headerChildren,
          ),
          ...dataChildren
        ],
      ),
    );
  }
}

class AppHeaderCell extends StatelessWidget {
  final String string;
  const AppHeaderCell({Key key, this.string}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.w),
      child: Text(
        string,
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 45.w),
      ),
    );
  }
}

class AppDataCell extends StatelessWidget {
  final String string;
  const AppDataCell({Key key, this.string}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.w),
      child: Text(
        string,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 40.w),
      ),
    );
  }
}
