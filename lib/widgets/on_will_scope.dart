import 'package:flutter/material.dart';

Future<bool> willPopCallback(BuildContext context) async {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text("Выход"),
      content: Text("Вы уверены?"),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: Text("Нет"),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(true);
            // return false;
          },
          child: Text("Да"),
        ),
      ],
    ),
  );
}
