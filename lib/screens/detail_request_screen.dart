import 'dart:convert';

import 'package:abiturient_app/blocs/detail_order_bloc/detail_orders_bloc.dart';
import 'package:abiturient_app/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailRequestScreen extends StatefulWidget {
  // int id;
  String id;
  DetailRequestScreen({@required this.id});
  // const DetailRequestScreen({Key? key}) : super(key: key);

  @override
  _DetailRequestScreenState createState() => _DetailRequestScreenState();
}

class _DetailRequestScreenState extends State<DetailRequestScreen> {
  Widget myWidget(String type, Map<String, dynamic> mapJson) {
    if (type == "handbook" || type == "boolean") {
      return Expanded(
        flex: 1,
        child: Container(
          child: ListTile(
            title: Text(
              mapJson["value"]["name"].toString(),
            ),
          ),
        ),
      );
    } else if (type == "file") {
      return Expanded(
        flex: 1,
        child: Container(
          child: ListTile(
            title: TextButton(
              onPressed: () {
                launch(mapJson["value"].toString());
              },
              child: Text(mapJson["name"].toString()),
            ),
          ),
        ),
      );
    } else {
      return Expanded(
        flex: 1,
        child: Container(
          child: ListTile(
            title: Text(
              mapJson["value"].toString(),
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarMy("Детальи заявки"),
        body: BlocProvider<DetailOrderBloc>(
          create: (context) => DetailOrderBloc()
            ..add(DetailOrderGetEvent(requestId: widget.id.toString())),
          child: BlocBuilder<DetailOrderBloc, DetailOrderState>(
            builder: (context, state) {
              if (state is DetailOrderLoadedState) {
                final jsonDataRes = jsonDecode(state.jsonData);
                Map<String, dynamic> jsonData = jsonDataRes["data"];
                Map<String, dynamic> jsonBlock = jsonDataRes["data"]["block"];
                jsonData.remove("block");
                print(jsonData);
                return Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.01,
                    right: MediaQuery.of(context).size.width * 0.01,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: jsonData.values.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            Map<String, dynamic> jj =
                                jsonData.values.elementAt(index);
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
                                          jj["name"].toString(),
                                          style: TextStyle(
                                            // fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        tileColor: Colors.grey[50],
                                      ),
                                      ListView.builder(
                                        physics: NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: jj['values'].length,
                                        itemBuilder: (context, index2) {
                                          Map<String, dynamic> jsonValues =
                                              jj['values'];
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
                                                          jsonValues.values
                                                              .elementAt(
                                                                  index2)["name"]
                                                              .toString(),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  myWidget(
                                                      jsonValues.values
                                                          .elementAt(
                                                              index2)["type"]
                                                          .toString(),
                                                      jsonValues.values
                                                          .elementAt(index2)),
                                                ],
                                              ),
                                              Divider(),
                                            ],
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        //block
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: jsonBlock.values.length,
                          itemBuilder: (context, index) {
                            Map<String, dynamic> itemBlock =
                                jsonBlock.values.elementAt(index);
                            // return Text(itemBlock['values'].toString());
                            return Column(
                              children: [
                                ListTile(
                                  title: Text(
                                    "${itemBlock['name'].toString()}",
                                    style: TextStyle(
                                      // fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  tileColor: Colors.grey[50],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context).size.height *
                                        0.05,
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
                                          ListView.builder(
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount: itemBlock['values']
                                                .values
                                                .length,
                                            itemBuilder: (context, index3) {
                                              Map<String, dynamic> jsonValues =
                                                  itemBlock['values']
                                                      .values
                                                      .elementAt(index3);
                                              return Column(
                                                children: [
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Expanded(
                                                        flex: 1,
                                                        child: Container(
                                                          child: ListTile(
                                                            title: Text(
                                                              jsonValues["name"]
                                                                  .toString(),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      myWidget(
                                                          jsonValues["type"],
                                                          jsonValues),
                                                    ],
                                                  ),
                                                  Divider(),
                                                ],
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),

                                // ListView.builder(
                                //   physics: NeverScrollableScrollPhysics(),
                                //   itemCount: itemBlock['values'].values.length,
                                //   shrinkWrap: true,
                                //   itemBuilder: (context, index2) {
                                //     Map<String, dynamic> tt =
                                //         itemBlock['values'];
                                //     return
                                //     Padding(
                                //       padding: EdgeInsets.only(
                                //         bottom:
                                //             MediaQuery.of(context).size.height *
                                //                 0.05,
                                //       ),
                                //       child: Card(
                                //         elevation: 2,
                                //         child: ClipRRect(
                                //           borderRadius: BorderRadius.only(
                                //             topLeft: Radius.circular(5),
                                //             topRight: Radius.circular(5),
                                //           ),
                                //           child: Column(
                                //             children: [
                                //               ListView.builder(
                                //                 physics:
                                //                     NeverScrollableScrollPhysics(),
                                //                 shrinkWrap: true,
                                //                 itemCount: tt.values.length,
                                //                 itemBuilder: (context, index3) {
                                //                   Map<String, dynamic>
                                //                       jsonValues = tt.values
                                //                           .elementAt(index3);
                                //                   return Column(
                                //                     children: [
                                //                       Row(
                                //                         crossAxisAlignment:
                                //                             CrossAxisAlignment
                                //                                 .start,
                                //                         children: [
                                //                           Expanded(
                                //                             flex: 1,
                                //                             child: Container(
                                //                               child: ListTile(
                                //                                 title: Text(
                                //                                   jsonValues[
                                //                                           "name"]
                                //                                       .toString(),
                                //                                 ),
                                //                               ),
                                //                             ),
                                //                           ),
                                //                           myWidget(
                                //                               jsonValues[
                                //                                   "type"],
                                //                               jsonValues),
                                //                         ],
                                //                       ),
                                //                       Divider(),
                                //                     ],
                                //                   );
                                //                 },
                                //               ),
                                //             ],
                                //           ),
                                //         ),
                                //       ),
                                //     );

                                //   },
                                // ),
                              ],
                            );
                          },
                        )
                      ],
                    ),
                  ),
                );
              } else if (state is DetailOrderLoadingState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Center(
                  child: Text("error"),
                );
              }
            },
          ),
        ));
  }
}
