import 'package:flutter/material.dart';

class SimpleScreen extends StatelessWidget {
  static const route = '/extra/simple';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Screen"),
      ),
    );
  }
}
