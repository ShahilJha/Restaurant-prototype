import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double height;
  final List<Widget> actions;

  const KAppBar({Key key, this.title, this.height, this.actions})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        title,
        textAlign: TextAlign.center,
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? 160.w);
}
