import 'package:abiturient_app/screens/requests_screen.dart';
import 'package:flutter/material.dart';

import 'feedback_screen.dart';
import 'guide_screen.dart';

class MyHomeScreen extends StatefulWidget {
  @override
  _MyHomeScreenState createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    RequestsScreen(),
    GuideScreen(),
    FeedbackScreen(),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        // decoration: BoxDecoration(
        //   boxShadow: <BoxShadow>[
        //     BoxShadow(
        //       color: Colors.grey[400],
        //       // color: Color(0xFF435D6B),
        //       blurRadius: 30,
        //     ),
        //   ],
        // ),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.menu,
                //color: Color(0xFFC8161D),
              ),
              title: Text(
                'Места',
                //style: TextStyle(color: Color(0xFFC8161D),),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.assignment,
                //color: Color(0xFFC8161D),
              ),
              title: Text(
                'Справочник',
                //style: TextStyle(color: Color(0xFFC8161D),),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.feedback,
                //color: Color(0xFFC8161D),
              ),
              title: Text(
                'Обратная связь',
                //style: TextStyle(color: Color(0xFFC8161D),),
              ),
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(
            //     Icons.more_horiz_rounded,
            //     //color: Color(0xFFC8161D),
            //   ),
            //   title: Text(
            //     'Бюллетень освободившихся мест',
            //     //style: TextStyle(color: Color(0xFFC8161D),),
            //   ),
            // ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Color(0xFFC8161D),
          unselectedItemColor: Color(0xFF435D6B),
          onTap: _onItemTap,
          selectedFontSize: 13.0,
          unselectedFontSize: 13.0,
        ),
      ),
    );
  }
}
