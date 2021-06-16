import 'package:flutter/material.dart';

class AppBarWidget extends StatefulWidget {
  String title = "";
  AppBarWidget({@required this.title});

  @override
  _AppBarWidgetState createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // leading: Icon(Icons.menu),
      backgroundColor: Colors.white,
      title: Text('${widget.title}', style: TextStyle(color: Colors.black),),
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.black),
    );
  }
}
