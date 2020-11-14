import 'package:flutter/material.dart';

class ProfilePhotoWidget extends StatelessWidget {
  double _imgSize;

  ProfilePhotoWidget(this._imgSize);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this._imgSize,
      width: this._imgSize,
      child: CircleAvatar(
        backgroundImage: NetworkImage("https://source.unsplash.com/300x300"),
      ),
    );
  }
}
