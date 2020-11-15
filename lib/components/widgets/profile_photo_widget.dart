import 'package:flutter/material.dart';

class ProfilePhotoWidget extends StatelessWidget {
  double _imgSize;
  String _imgUrl;

  ProfilePhotoWidget(this._imgSize, this._imgUrl);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this._imgSize,
      width: this._imgSize,
      child: CircleAvatar(
        backgroundImage: NetworkImage(this._imgUrl),
      ),
    );
  }
}
