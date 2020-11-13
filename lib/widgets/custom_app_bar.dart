import 'package:flutter/material.dart';
import 'package:frino_icons/frino_icons.dart';

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
      title: this._title,
      elevation: 1,
      actions: [
        this._isDisplayMessageIcon
            ? IconButton(
                icon: Icon(FrinoIcons.f_chat),
                onPressed: () {},
              )
            : Container(),
      ],
    );
  }
}
