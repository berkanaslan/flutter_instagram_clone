import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(50);

  Widget _title;
  Widget _action;

  CustomAppBar(Widget title, Widget action) {
    this._title = title;
    this._action = action;
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: this._title,
      elevation: 1,
      actions: [this._action],
    );
  }
}
