import 'package:flutter/material.dart';

class FeedbackScreen extends StatefulWidget {
  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final items = List<String>.generate(10000, (i) => "Колледж $i");
  int id = 2;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber[200],
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
        body: TabBarView(
          children: [
            ListView(
              children: [
                // Text('Вопрос'),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.05, horizontal: MediaQuery.of(context).size.width * 0.1),
                  child: Container(
                    // color: Colors.red,
                    // height: MediaQuery.of(context).size.height * 0.3,
                    child: Card(
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text('Вопрос', style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * 0.05),),
                                Text('10 июнь 2021', style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.03),),
                              ],
                            ),
                            FormField(
                              builder: (FormFieldState<int> state) {
                                return TextField(
                                  maxLines: 10,
                                  decoration: InputDecoration(
                                    border: InputBorder.none
                                  ),
                                );
                              }
                            ),
                          ],
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 10,
                    ),
                  ),
                ),
                // Text('Ответ'),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.05, horizontal: MediaQuery.of(context).size.width * 0.1),
                  child: Container(
                    // color: Colors.red,
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Card(
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('Ответ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * 0.05),),
                              Text('10 июнь 2021', style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.03),),
                            ],
                          ),
                          FormField(
                            builder: (FormFieldState<int> state) {
                              return TextField(
                                decoration: InputDecoration(
                                    border: InputBorder.none
                                ),
                              );
                            }
                          ),
                        ],
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 10,
                    ),
                  ),
                ),
                // ElevatedButton(onPressed: (){
                //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                //     content: Text('Hello 1'),
                //     duration: Duration(seconds: 1),));
                // }, child: Text('вопрос')),
                // ElevatedButton(onPressed: (){
                //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                //     content: Text('Hello 2'),
                //     duration: Duration(seconds: 1),));
                // }, child: Text('ответ')),
              ],
            ),
            Column(
              children: [
                Expanded(
                  flex: 1,
                  child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index){
                      return ListTile(
                        title: Text('${items[index]}'),
                      );
                    }
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: ElevatedButton(onPressed: (){
                      setState(() {
                        id = 1;
                      });
                      showAlertDialog(context);
                    }, child: Text('инфо о прием. комиссии')),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Expanded(
                  flex: 1,
                  child: ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index){
                        return ListTile(
                          title: Text('${items[index]}'),
                        );
                      }
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: ElevatedButton(onPressed: (){
                      setState(() {
                        id = 2;
                      });
                      showAlertDialog(context);
                    }, child: Text('номер колледжей')),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {

    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () { },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("My title"),
      content: id == 2 ? Text("номер колледжей") : Text('инфо о прием. комис.'),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
