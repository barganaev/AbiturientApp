import 'dart:convert';
import 'dart:developer';

import 'package:abiturient_app/blocs/my_orders_bloc/my_orders_bloc.dart';
import 'package:abiturient_app/models/my_orders.dart';
import 'package:abiturient_app/screens/detail_request_screen.dart';
import 'package:abiturient_app/screens/drawer_screen.dart';
import 'package:abiturient_app/screens/news_screen.dart';
import 'package:abiturient_app/widgets/appbar_widget.dart';
import 'package:abiturient_app/widgets/on_will_scope.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:url_launcher/url_launcher.dart';

class RequestsScreen extends StatefulWidget {
  @override
  _RequestsScreenState createState() => _RequestsScreenState();
}

class _RequestsScreenState extends State<RequestsScreen> {
  final _url = "https://egov.kz/cms/ru/services/professional_education/pr_5";

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => willPopCallback(context),
      child: Scaffold(
        appBar: AppBar(
          // leading: Icon(Icons.menu),
          backgroundColor: Colors.white,
          title: Text(
            'Мои заявки',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                icon: Icon(Icons.exit_to_app),
                onPressed: () {
                  var _box = Hive.box('myBox');
                  if (_box.containsKey('token')) {
                    _box.delete("token");
                  }
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewsScreen(),
                      ),
                      (route) => false);
                })
          ],
          iconTheme: IconThemeData(color: Colors.black),
        ),
        // appBarMy("Мои заявки"),
        drawer: MyDrawer(),
        body: MultiBlocProvider(
            providers: [
              BlocProvider<MyOrdersBloc>(
                create: (context) => MyOrdersBloc()..add(MyOrdersGetEvent()),
              ),
            ],
            child: BlocConsumer<MyOrdersBloc, MyOrdersState>(
              listener: (context, state) {
                if (state is MyOrdersErrorState) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(
                    content: Text(
                        'Попробуйте еще раз!'),
                    duration: Duration(seconds: 2),
                  ));
                }
              },
              builder: (context, state) {
                if (state is MyOrdersLoadedState) {
                  // dynamic headerJson =
                  //     state.myOrdersJson['data']["requestList"]['headers'];
                  // dynamic listJson =
                  //     state.myOrdersJson['data']["requestList"]['list'];
                  // int r = state.myOrdersJson["status"];
                  final jsonData = jsonDecode(state.myOrdersJson);
                  List<dynamic> jsonHeadersList =
                      jsonData["data"]['requestList']['headers'];
                  List<dynamic> jsonDataList =
                      jsonData["data"]['requestList']['list'];

                  log(jsonHeadersList.toString(), name: "jsonHeadersList");
                  log(jsonDataList.toString(), name: "jsonDataList");
                  log(jsonDataList[0].toString(), name: "elementAtjsonListMap");
                  return jsonDataList.length == 0
                      ? MyRequestWidget()
                      : Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.01,
                            right: MediaQuery.of(context).size.width * 0.01,
                          ),
                          child: ListView.builder(
                            itemCount: jsonDataList.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).size.height * 0.05,
                                ),
                                child: Card(
                                  elevation: 2,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5),
                                    ),
                                    child: Column(
                                      children: [
                                        ListTile(
                                          title: Text(
                                            "Заявка #${index + 1}",
                                            style: TextStyle(
                                              // fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          tileColor: Colors.grey[50],
                                        ),
                                        ListView.builder(
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount: jsonHeadersList.length,
                                          itemBuilder: (context, index2) {
                                            return Column(
                                              children: [
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      flex: 1,
                                                      child: Container(
                                                        child: ListTile(
                                                          title: Text(
                                                              jsonHeadersList[
                                                                      index2]
                                                                  ["text"]),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 1,
                                                      child: Container(
                                                        child: ListTile(
                                                          title: Text(
                                                            jsonDataList[index][
                                                                jsonHeadersList[
                                                                        index2]
                                                                    ["value"]],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Divider(),
                                              ],
                                            );
                                          },
                                        ),
                                        Row(
                                          children: [
                                            Spacer(),
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        DetailRequestScreen(
                                                      id: "1",
                                                      // jsonDataList[index]
                                                      //     ["id"],
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: Text("Подробнее"),
                                            ),
                                            Spacer(),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                } else if (state is MyOrdersLoadingState) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is MyOrdersErrorState) {
                  return Center(
                    child: Text('Попробуйте еще раз!'),
                  );
                  // SnackBar(content: Text('Ошибка'));

                } else {
                  return Center(
                    child: Text('Ошибка!'),
                  );
                }
              },
            )),
      ),
    );
  }

  Widget MyRequestWidget() {
    return ElevatedButton(
        onPressed: () => _launchURL(), child: Text('Подать заявку'));
  }

  void _launchURL() async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'could not launch $_url';
}
