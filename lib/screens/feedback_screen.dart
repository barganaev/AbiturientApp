import 'package:flutter/material.dart';

class FeedbackScreen extends StatefulWidget {
  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Обратная связь'),
          centerTitle: true,
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              Tab(
                text: 'виртуальный блог',
                // icon: Icon(Icons.add),
              ),
              Tab(
                text: 'приемная комиссия',
                // icon: Icon(Icons.add),
              ),
              Tab(
                text: 'тел.доверие',
                // icon: Icon(Icons.add),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
