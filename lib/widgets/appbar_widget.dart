import 'package:flutter/material.dart';

Widget appBarMy(String title) => AppBar(
      // leading: Icon(Icons.menu),
      backgroundColor: Colors.white,
      title: Text(
        '${title}',
        style: TextStyle(color: Colors.black),
      ),
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.black),
    );
