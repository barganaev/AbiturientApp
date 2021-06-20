import 'package:abiturient_app/screens/drawer_screen.dart';

import 'package:abiturient_app/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ApplyRequestScreen extends StatefulWidget {
  @override
  _ApplyRequestScreenState createState() => _ApplyRequestScreenState();
}

class _ApplyRequestScreenState extends State<ApplyRequestScreen> {
  final _url = "https://egov.kz/cms/ru/services/professional_education/pr_5";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMy('Подать заявку'),
      drawer: MyDrawer(),
      body: Center(child: MyRequestWidget()),
    );
  }

  Widget MyRequestWidget() {
    return ElevatedButton(
        onPressed: () => _launchURL(), child: Text('Подать заявку'));
  }

  void _launchURL() async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'could not launch $_url';
}
