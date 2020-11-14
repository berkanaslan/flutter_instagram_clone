import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone/components/text_field_container.dart';
import 'package:flutter_instagram_clone/contants.dart';
import 'package:frino_icons/frino_icons.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String errorText;
  final Function onSaved;

  const RoundedPasswordField({
    Key key,
    this.onChanged,
    this.errorText,
    this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        obscureText: true,
        onChanged: onChanged,
        onSaved: onSaved,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: "Parola",
          icon: Icon(
            FrinoIcons.f_lock,
            color: kPrimaryColor,
          ),
          errorText: errorText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
