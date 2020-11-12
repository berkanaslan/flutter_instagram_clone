import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(50);

  Widget _title;
  bool _isDisplayMessageIcon;

  CustomAppBar(Widget title, bool isDisplayMessageIcon) {
    this._title = title;
    this._isDisplayMessageIcon = isDisplayMessageIcon;
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      title: this._title,
      elevation: 1,
      leading: IconButton(icon: Icon(Icons.add), onPressed: () {}),
      actions: [
        this._isDisplayMessageIcon
            ? IconButton(
                icon: Icon(Icons.message),
                onPressed: () {},
              )
            : Container(),
      ],
    );
  }
}
