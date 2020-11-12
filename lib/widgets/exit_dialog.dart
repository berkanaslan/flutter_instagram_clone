import 'package:flutter/material.dart';

class ExitAlertDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Çkış'),
      content: Text("Çıkış yapmak istediğinizden emin misiniz?"),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: Text(
            'İptal',
            style: Theme.of(context).textTheme.button.copyWith(
                  fontWeight: FontWeight.normal,
                ),
          ),
        ),
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          child: Text('Çıkış'),
        ),
      ],
    );
  }
}
