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
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.1),
        child: AppBarWidget(
          title: "Мои заявки",
        ),
      ),
      drawer: MyDrawer(),
      body: MultiBlocProvider(
          providers: [
            BlocProvider<DetailOrderBloc>(
              create: (context) =>
                  DetailOrderBloc()..add(DetailOrderGetEvent(requestId: "1")),
            ),
            BlocProvider<MyOrdersBloc>(
              create: (context) => MyOrdersBloc()..add(MyOrdersGetEvent()),
            ),
            BlocProvider<AllCollegesBloc>(
              create: (context) =>
                  AllCollegesBloc()..add(AllCollegesGetEvent()),
            ),
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
                                    MediaQuery.of(context).size.width * 0.1),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DetailRequestScreen(
                                                id: list[index].id)));
                                // BlocProvider.of<DetailOrderBloc>(context)
                                //     .add(DetailOrderGetEvent());
                              },
                              child: Container(
                                // color: Colors.red,
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                child: Card(
                                  semanticContainer: true,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                            MediaQuery.of(context).size.width *
                                                0.03),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          Text(
                                            'id',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.05),
                                          ),
                                          Text(
                                            '${state.myOrdersModel.data.requestList.list[0].id}',
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.04),
                                          ),
                                          Text(
                                            'iin',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.05),
                                          ),
                                          Text(
                                            '${state.myOrdersModel.data.requestList.list[0].iin}',
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.04),
                                          ),
                                          Text(
                                            'full name',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.05),
                                          ),
                                          Text(
                                            '${state.myOrdersModel.data.requestList.list[0].fullName}',
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.04),
                                          ),
                                          Text(
                                            'birthday',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.05),
                                          ),
                                          Text(
                                            '${state.myOrdersModel.data.requestList.list[0].birthday}',
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.04),
                                          ),
                                          Text(
                                            'graduation year',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.05),
                                          ),
                                          Text(
                                            '${state.myOrdersModel.data.requestList.list[0].graduationYear}',
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.04),
                                          ),
                                          Text(
                                            'email',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.05),
                                          ),
                                          Text(
                                            '${state.myOrdersModel.data.requestList.list[0].email}',
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.04),
                                          ),
                                          Text(
                                            'phone_number',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.05),
                                          ),
                                          Text(
                                            '${state.myOrdersModel.data.requestList.list[0].phoneNumber}',
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.04),
                                          ),
                                          Text(
                                            'parent_phone_number',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.05),
                                          ),
                                          Text(
                                            '${state.myOrdersModel.data.requestList.list[0].parentPhoneNumber}',
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.04),
                                          ),
                                          Text(
                                            'is_have_quota',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.05),
                                          ),
                                          Text(
                                            '${state.myOrdersModel.data.requestList.list[0].isHaveQuota}',
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.04),
                                          ),
                                          Text(
                                            'chosed_qualification_count',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.05),
                                          ),
                                          Text(
                                            '${state.myOrdersModel.data.requestList.list[0].choosedQualificationCount}',
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.04),
                                          ),
                                          Text(
                                            'created_at',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.05),
                                          ),
                                          Text(
                                            '${state.myOrdersModel.data.requestList.list[0].createdAt}',
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.04),
                                          ),
                                          Text(
                                            'region_name',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.05),
                                          ),
                                          Text(
                                            '${state.myOrdersModel.data.requestList.list[0].regionName}',
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.04),
                                          ),
                                          Text(
                                            'status_name',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.05),
                                          ),
                                          Text(
                                            '${state.myOrdersModel.data.requestList.list[0].statusName}',
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.04),
                                          ),
                                          Text(
                                            'status_type',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.05),
                                          ),
                                          Text(
                                            '${state.myOrdersModel.data.requestList.list[0].statusType}',
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.04),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  elevation: 10,
                                ),
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
