import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(50);

  Widget _title;
  Widget _action;
  double _elevation;

  CustomAppBar(this._title, this._action, this._elevation);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: this._title,
      elevation: this._elevation,
      actions: [this._action],
    );
  }
}
