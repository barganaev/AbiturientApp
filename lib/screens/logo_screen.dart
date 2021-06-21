import 'package:abiturient_app/screens/news_screen.dart';
import 'package:abiturient_app/screens/slid_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class LogoScreen extends StatefulWidget {
  @override
  _LogoScreenState createState() => _LogoScreenState();
}

class _LogoScreenState extends State<LogoScreen> {
  var _box = Hive.box('myBox');
  bool isIntroSeen = false;
  void delayy() async {
    await Future.delayed(Duration(seconds: 5));
    if (isIntroSeen) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => NewsScreen()));
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SlidersScreen()));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    delayy();
  }

  @override
  Widget build(BuildContext context) {
    if (_box.containsKey('isIntroSeen')) {
      this.isIntroSeen = _box.get('isIntroSeen');
    }
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              'assets/bg_lines.png',
              fit: BoxFit.fill,
              // width: MediaQuery.of(context).size.width / 2.2,
              // height: MediaQuery.of(context).size.height / 2.2,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.15),
                child: Image.asset(
                  'assets/logo_edus_blue.png',
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: Text(
                'Абитуриент',
                style: TextStyle(
                    color: Color(0xFF1269db),
                    fontSize: MediaQuery.of(context).size.width * 0.1,
                    fontWeight: FontWeight.w700),
              )),
              Center(
                  child: Text(
                'Приложение-помощник',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: MediaQuery.of(context).size.width * 0.04),
              )),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.04,
                horizontal: MediaQuery.of(context).size.width * 0.2),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: LinearProgressIndicator()),
          )
        ],
      ),
    );
  }
}
