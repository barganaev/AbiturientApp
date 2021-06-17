import 'package:abiturient_app/screens/drawer_screen.dart';
import 'package:abiturient_app/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.1),
        child: AppBarWidget(
          title: "Новости",
        ),
      ),
      drawer: MyDrawer(),
      body: ListView.builder(
          itemCount: 100,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.01,
                  horizontal: MediaQuery.of(context).size.width * 0.05),
              child: Column(
                children: [
                  Container(
                    // color: Colors.red,
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Card(
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child:
                          // Image.network(
                          //         "data:image/jpeg;base64,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",
                          //         fit: BoxFit.fill) ??
                          Text("Photo"),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 1,
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.01),
                      child: Text(
                        'Expert Advice: How to Build an Accessible Education Website on WordPress.com',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.01),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text('19.08.2020, 19:17'))),
                  Divider()
                ],
              ),
            );
          }),
    );
  }
}
