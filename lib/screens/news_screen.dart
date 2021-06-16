import 'package:abiturient_app/screens/home_screen.dart';
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
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.1),
        child: AppBarWidget(title: "Новости",)),
      drawer: MyHomeScreen(),
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.01, horizontal: MediaQuery.of(context).size.width * 0.05),
            child: Column(
              children: [
                Container(
                  // color: Colors.red,
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Image.asset('assets/images/travel.jpg', fit: BoxFit.fill,),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 1,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.01),
                  child: Text('Expert Advice: How to Build an Accessible Education Website on WordPress.com', style: TextStyle(fontWeight: FontWeight.bold),)),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.01),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('19.08.2020, 19:17'))),
                Divider()
              ],
            ),
          );
        }
      ),
    );
  }
}
