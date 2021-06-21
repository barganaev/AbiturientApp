import 'package:abiturient_app/blocs/all_colleges_bloc/all_colleges_bloc.dart';
import 'package:abiturient_app/blocs/detail_order_bloc/orders_bloc.dart';
import 'package:abiturient_app/blocs/my_orders_bloc/my_orders_bloc.dart';
import 'package:abiturient_app/models/my_orders.dart';
import 'package:abiturient_app/screens/detail_request_screen.dart';
import 'package:abiturient_app/screens/drawer_screen.dart';
import 'package:abiturient_app/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class RequestsScreen extends StatefulWidget {
  @override
  _RequestsScreenState createState() => _RequestsScreenState();
}

class _RequestsScreenState extends State<RequestsScreen> {
  final _url = "https://egov.kz/cms/ru/services/professional_education/pr_5";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMy("Мои заявки"),
      // PreferredSize(
      //   preferredSize:
      //       Size.fromHeight(MediaQuery.of(context).size.height * 0.1),
      //   child: AppBarWidget(
      //     title: "Мои заявки",
      //   ),
      // ),
      drawer: MyDrawer(),
      body: MultiBlocProvider(
          providers: [
            // BlocProvider<DetailOrderBloc>(
            //   create: (context) =>
            //       DetailOrderBloc()..add(DetailOrderGetEvent(requestId: "1")),
            // ),
            BlocProvider<MyOrdersBloc>(
              create: (context) => MyOrdersBloc()..add(MyOrdersGetEvent()),
            ),
            // BlocProvider<AllCollegesBloc>(
            //   create: (context) =>
            //       AllCollegesBloc()..add(AllCollegesGetEvent()),
            // ),
          ],
          child: BlocBuilder<MyOrdersBloc, MyOrdersState>(
            builder: (context, state) {
              if (state is MyOrdersLoadedState) {
                return state.myOrdersModel.data.requestList.list.length == 0
                    ? MyRequestWidget()
                    : ListView.builder(
                        itemCount:
                            state.myOrdersModel.data.requestList.list.length,
                        itemBuilder: (context, index) {
                          List<ListElementt> list =
                              state.myOrdersModel.data.requestList.list;
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                vertical:
                                    MediaQuery.of(context).size.height * 0.05,
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.01),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        DetailRequestScreen(id: list[index].id),
                                  ),
                                );
                                // BlocProvider.of<DetailOrderBloc>(context)
                                //     .add(DetailOrderGetEvent());
                              },
                              child: ListView.builder(
                                itemCount: state.myOrdersModel.data.requestList.list.length,
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index){
                                  return Card(
                                    elevation: 2,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        topRight: Radius.circular(5),
                                      ),
                                      child: Column(
                                        children: [
                                          ListTile(
                                            title: Text(state.myOrdersModel.data.requestList.list[index].fullName.toString()
                                                ?? "name"),
                                            tileColor: Colors.grey[50],
                                          ),
                                          ListView.builder(
                                            physics: NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount: //3,
                                            state.myOrdersModel.data.requestList.list.length,
                                            itemBuilder: (context, index2) {
                                              // Map<String, dynamic> detailMap = allMap
                                              //     .values
                                              //     .elementAt(index)["values"];
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
                                                            title: Text(state.myOrdersModel.data.requestList.list[index].fullName.toString() ?? "NAME"),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 1,
                                                        child: Container(
                                                          child: ListTile(
                                                            title: Text(state.myOrdersModel.data.requestList.list[index].fullName.toString() ?? "-"),
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
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          );
                        },
                      );
              } else if (state is MyOrdersLoadingState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is MyOrdersErrorState) {
                return Center(
                  child: Text('Look for request_screen.dart'),
                );
              } else {
                return Center(
                  child: Text('Error in request_screen.dart'),
                );
              }
            },
          )),
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
