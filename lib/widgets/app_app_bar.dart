import 'package:flutter/material.dart';

class KAppBar extends StatelessWidget {
  final String title;

  const KAppBar({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
    );
  }
}
