import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone/components/text_field_container.dart';
import 'package:flutter_instagram_clone/contants.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final Function onSaved;
  final String errorText;

  const RoundedInputField({
    Key key,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
    this.onSaved,
    this.errorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        onSaved: onSaved,
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          errorText: errorText,
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
