import 'package:abiturient_app/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';

class CollegeDetailScreen extends StatefulWidget {
  @override
  _CollegeDetailScreenState createState() => _CollegeDetailScreenState();
}

class _CollegeDetailScreenState extends State<CollegeDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMy('№? Колледж'),
      body: Center(
        child: Text('College Detail Screen'),
      ),
    );
  }
}
