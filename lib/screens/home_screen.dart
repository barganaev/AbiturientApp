import 'package:abiturient_app/blocs/regions_bloc/regions_bloc.dart';
import 'package:abiturient_app/screens/apply_request_screen.dart';
import 'package:abiturient_app/screens/college_screen.dart';
import 'package:abiturient_app/screens/faq_screen.dart';
import 'package:abiturient_app/screens/news_screen.dart';
import 'package:abiturient_app/screens/prof_diagnostic_screen.dart';
import 'package:abiturient_app/screens/requests_screen.dart';
import 'package:abiturient_app/screens/specialists_screen.dart';
import 'package:abiturient_app/screens/virtual_blog_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'guide_screen.dart';

class MyHomeScreen extends StatefulWidget {
  @override
  _MyHomeScreenState createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.02),
            child: Column(
              children: [
                CircleAvatar(
                  child: Icon(Icons.account_circle),
                ),
                Text(
                  'АБИТУРИЕНТ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Color(0xFF1269db)),
                )
              ],
            ),
          ),
          Divider(
            color: Color(0xFF1269db),
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Мои заявки'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RequestsScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Подать заявку'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ApplyRequestScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text('Колледжи'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CollegeScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.assistant_navigation),
            title: Text('Специальности'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SpecialistsScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.question_answer),
            title: Text('Вопросы-ответы'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => FaqScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.all_inbox),
            title: Text('Новости и анонсы'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NewsScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.message),
            title: Text('Виртуальный блог'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => VirtualBlogScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.local_fire_department),
            title: Text('Уведомления'),
            onTap: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => RequestsScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.construction),
            title: Text('Проф. диагностика'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProfDiagnosticScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Настройки'),
            onTap: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => RequestsScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.app_blocking),
            title: Text('О приложении'),
            onTap: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => RequestsScreen()));
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (newcontext) => BlocProvider<RegionsBloc>(
                    create: (context) => RegionsBloc()..add(RegionsGetEvent()),
                    child: GuideScreen(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
