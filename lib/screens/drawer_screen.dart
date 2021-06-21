import 'package:abiturient_app/screens/apply_request_screen.dart';
import 'package:abiturient_app/screens/college_screen.dart';
import 'package:abiturient_app/screens/faq_screen.dart';
import 'package:abiturient_app/screens/news_screen.dart';
import 'package:abiturient_app/screens/prof_diagnostic_screen.dart';
import 'package:abiturient_app/screens/push_notifications_screen.dart';
import 'package:abiturient_app/screens/requests_screen.dart';
import 'package:abiturient_app/screens/settings_screen.dart';
import 'package:abiturient_app/screens/specialists_screen.dart';
import 'package:abiturient_app/screens/virtual_blog_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'about_app_screen.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            color: Color(0xFF1269db),
            child: Image.asset('assets/logo_edus_blue.png', height: MediaQuery.of(context).size.height * 0.05,)),
          Container(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.02),
            child: Column(
              children: [
                Image.asset('assets/ico_mob_abiturient.png'),
                // CircleAvatar(
                //   child: Icon(Icons.account_circle),
                // ),
                Text(
                  'АБИТУРИЕНТ',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.045,
                      fontWeight: FontWeight.bold, color: Color(0xFF1269db)),
                )
              ],
            ),
          ),
          Divider(
            color: Color(0xFF1269db),
            indent: MediaQuery.of(context).size.width * 0.05,
            endIndent: MediaQuery.of(context).size.width * 0.05,
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Мои заявки'),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RequestsScreen(),
                  ),
                  (route) => false);
              //  (context,
              //     MaterialPageRoute(builder: (context) => RequestsScreen()));
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => RequestsScreen(),
              //   ),
              // );
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Подать заявку'),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ApplyRequestScreen(),
                  ),
                  (route) => false);
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => ApplyRequestScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text('Колледжи'),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CollegeScreen(),
                  ),
                  (route) => false);
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => CollegeScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.assistant_navigation),
            title: Text('Специальности'),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SpecialistsScreen(),
                  ),
                  (route) => false);
              // Navigator.push(context, MaterialPageRoute(builder: (context) => RequestsScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.question_answer),
            title: Text('Вопросы-ответы'),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FaqScreen(),
                  ),
                  (route) => false);
            },
          ),
          ListTile(
            leading: Icon(Icons.all_inbox),
            title: Text('Новости и анонсы'),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewsScreen(),
                  ),
                  (route) => false);
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => NewsScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.message),
            title: Text('Виртуальный блог'),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VirtualBlogScreen(),
                  ),
                  (route) => false);
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => VirtualBlogScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.local_fire_department),
            title: Text('Уведомления'),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PushNotificationScreen(),
                  ),
                  (route) => false);
              // Navigator.push(context, MaterialPageRoute(builder: (context) => RequestsScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.construction),
            title: Text('Проф. диагностика'),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfDiagnosticScreen(),
                  ),
                  (route) => false);
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => ProfDiagnosticScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Настройки'),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsScreen(),
                  ),
                  (route) => false);
              // Navigator.push(context, MaterialPageRoute(builder: (context) => RequestsScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.app_blocking),
            title: Text('О приложении'),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AboutAppScreen(),
                  ),
                  (route) => false);
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (newcontext) => GuideScreen(),
              //   ),
              // );
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (newcontext) => BlocProvider<RegionsBloc>(
              //       create: (context) => RegionsBloc()..add(RegionsGetEvent()),
              //       child: GuideScreen(),
              //     ),
              //   ),
              // );
            },
          ),
        ],
      ),
    );
  }
}
