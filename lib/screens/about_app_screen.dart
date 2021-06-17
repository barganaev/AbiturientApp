import 'package:abiturient_app/screens/drawer_screen.dart';
import 'package:abiturient_app/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';

class AboutAppScreen extends StatefulWidget {

  @override
  _AboutAppScreenState createState() => _AboutAppScreenState();
}

class _AboutAppScreenState extends State<AboutAppScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
        Size.fromHeight(MediaQuery.of(context).size.height * 0.1),
        child: AppBarWidget(
          title: "О приложении",
        ),
      ),
      drawer: MyDrawer(),
      body: Center(
        child: Text('About app screen'),
      )
    );
  }
}
