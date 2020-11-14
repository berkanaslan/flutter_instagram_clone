import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone/contants.dart';

class ProfileActionButton extends StatelessWidget {
  final String buttonText;
  final Function onPressed;

  const ProfileActionButton({Key key, this.buttonText, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.04,
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: kPrimaryLightColor)),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(buttonText),
        minWidth: (size.width * 0.45),
      ),
    );
  }
}
