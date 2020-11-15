import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone/components/text_field_container.dart';
import 'package:flutter_instagram_clone/contants.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final Function onSaved;
  final String errorText;
  final TextInputType textInputType;
  final String initialValue;
  final TextEditingController controller;

  const RoundedInputField({
    Key key,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
    this.onSaved,
    this.errorText,
    this.textInputType,
    this.initialValue,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        controller: controller,
        initialValue: initialValue,
        keyboardType: textInputType,
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
