import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double height;

  const KAppBar({Key key, this.title, this.height}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        title,
        textAlign: TextAlign.center,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? 160.w);
}
