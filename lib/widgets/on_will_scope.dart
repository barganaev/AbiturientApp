import 'package:flutter/material.dart';

Future<bool> willPopCallback(BuildContext context) async {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text("My title"),
      content: Text("This is my message."),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: Text("No"),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(true);
            // return false;
          },
          child: Text("Yes"),
        ),
      ],
    ),
  );
}
