import 'package:abiturient_app/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';

class FaqScreen extends StatefulWidget {

  @override
  _FaqScreenState createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.1),
          child: AppBarWidget(title: "Вопросы и ответы",)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text('faq screen'),
          ],
        ),
      ),
    );
  }
}
