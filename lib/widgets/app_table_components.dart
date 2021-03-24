import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTable extends StatelessWidget {
  final List<TableRow> children;
  final Map<int, TableColumnWidth> columnWidths;
  final List<Widget> headerChildren;
  // final List<Widget> dataChildren;
  final List<TableRow> dataChildren;

  const AppTable({
    Key key,
    this.children,
    this.columnWidths,
    this.headerChildren,
    this.dataChildren,
  }) : super(key: key);

  //TODO: use to pass data to Table()
  List<TableRow> _getTableRows(List<List<Widget>> list) {
    List<TableRow> rowList;
    rowList.add(TableRow(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50.w),
          topRight: Radius.circular(50.w),
        ),
      ),
      children: headerChildren,
    ));
    for (var rowData in list) {
      rowList.add(
        //TODO: use _mapToTableRow to map data to TableRow()
        TableRow(
          decoration: BoxDecoration(
            color: Colors.grey[100],
          ),
          children: [
            AppDataCell(string: '1'),
            AppDataCell(string: 'Food 1'),
            AppDataCell(string: '2000'),
            AppDataCell(string: '2'),
            AppDataCell(string: '400'),
          ],
        ),
      );
    }
    return rowList;
  }

  TableRow _mapToTableRow(List list) {
    return TableRow();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30.h),
      child: Table(
        // border: TableBorder.symmetric(
        //   outside: BorderSide(color: Colors.black),
        //   inside: BorderSide(color: Colors.grey),
        // ),
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
