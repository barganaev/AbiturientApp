import 'package:abiturient_app/screens/drawer_screen.dart';
import 'package:abiturient_app/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';

class PushNotificationScreen extends StatefulWidget {

  @override
  _PushNotificationScreenState createState() => _PushNotificationScreenState();
}

class _PushNotificationScreenState extends State<PushNotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMy("Уведомление"),
      drawer: MyDrawer(),
      body: Center(
        child: Text('Push Notification screen'),
      ),
    );
  }
}
