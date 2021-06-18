import 'package:abiturient_app/screens/drawer_screen.dart';
import 'package:abiturient_app/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';

class VirtualBlogScreen extends StatefulWidget {
  @override
  _VirtualBlogScreenState createState() => _VirtualBlogScreenState();
}

class _VirtualBlogScreenState extends State<VirtualBlogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMy("Виртуальный блог"),
      drawer: MyDrawer(),
      body: Center(
        child: Text('У вас нет записи'),
      ),
    );
  }
}
