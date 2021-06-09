import 'package:flutter/material.dart';

class GuideScreen extends StatefulWidget {
  @override
  _GuideScreenState createState() => _GuideScreenState();
}

class _GuideScreenState extends State<GuideScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Справочник'),
          centerTitle: true,
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              Tab(
                text: 'колледжей',
                // icon: Icon(Icons.add),
              ),
              Tab(
                text: 'специальности',
                // icon: Icon(Icons.add),
              ),
              Tab(
                text: 'места',
                // icon: Icon(Icons.add),
              ),
              Tab(
                text: 'атлас специальности',
                // icon: Icon(Icons.add),
              ),
              Tab(
                text: 'полезные ресурсы',
                // icon: Icon(Icons.add),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
