import 'package:flutter/material.dart';

class RequestsScreen extends StatefulWidget {
  @override
  _RequestsScreenState createState() => _RequestsScreenState();
}

class _RequestsScreenState extends State<RequestsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Места'),
          centerTitle: true,
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              Tab(
                text: 'мои заявки',
                // icon: Icon(Icons.add),
              ),
              Tab(
                text: 'итог собес',
                // icon: Icon(Icons.add),
              ),
              Tab(
                text: 'итоги',
                // icon: Icon(Icons.add),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: Text('Поданные зая. об.'),),
            // Center(child: Text('Center 2'),),
            Column(
              children: [
                ElevatedButton(onPressed: (){}, child: Text('назн. собес')),
                ElevatedButton(onPressed: (){}, child: Text('результат собес')),
              ],
            ),
            Center(child: Text('Center 3'),),
          ],
        ),
      ),
    );
  }
}
