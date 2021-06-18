import 'package:abiturient_app/screens/drawer_screen.dart';
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
      appBar: appBarMy("Вопросы и ответы"),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 20,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                      ),
                      child: ExpansionTile(
                        title: Text('This is a question part'),
                        children: [
                          Divider(),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical:
                                    MediaQuery.of(context).size.height * 0.01,
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.05),
                            child: Text(
                              'This is a answer part as df asd fas dfasdf asd f',
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.05),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
            ExpansionTile(
              title: Text(
                'items.playerName',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
              ),
              children: <Widget>[
                ListTile(
                  title: Text(
                    'items.description',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                )
              ],
            ),
            ExpansionTile(
              title: Text(
                'items.playerName',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
              ),
              children: <Widget>[
                ListTile(
                  title: Text(
                    'items.description',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
