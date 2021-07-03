import 'dart:developer';

import 'package:abiturient_app/blocs/detail_order_bloc/detail_orders_bloc.dart';
import 'package:abiturient_app/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CollegeDetailScreen extends StatefulWidget {
  @override
  _CollegeDetailScreenState createState() => _CollegeDetailScreenState();
}

class _CollegeDetailScreenState extends State<CollegeDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMy('Колледж деталь'),
      body: SingleChildScrollView(
        child: BlocProvider<DetailOrderBloc>(
          create: (context) => DetailOrderBloc()..add(DetailOrderGetEvent()),
          child: BlocBuilder<DetailOrderBloc, DetailOrderState>(
            builder: (context, state) {
              if (state is DetailOrderLoadedState) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.03,
                      horizontal: MediaQuery.of(context).size.width * 0.05
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.height * 0.6,
                    child: Card(
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width * 0.03
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: MediaQuery.of(context).size.height * 0.02
                              ),
                              child: Text(
                                '${state.jsonData}',
                                // 'hello_1',
                                // '${state2.collegesByRegionModel.data.list[index].name}',
                                style: TextStyle(
                                    fontSize: MediaQuery.of(context).size.width * 0.05
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: MediaQuery.of(context).size.height * 0.005
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.house),
                                  Flexible(
                                    child: Padding(
                                      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.02
                                      ),
                                      child: Text(
                                        'hello_2',
                                        // '${state2.collegesByRegionModel.data.list[index].ownershipName}'
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: MediaQuery.of(context).size.height * 0.005
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.location_on),
                                  Flexible(
                                    child:
                                    Padding(
                                      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.03),
                                      child: Text(
                                        'hello_3',
                                        // '${state2.collegesByRegionModel.data.list[index].address}'
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: MediaQuery.of(context).size.height * 0.005
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.phone),
                                  Flexible(
                                    child:
                                    Padding(
                                      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.02
                                      ),
                                      child: Text(
                                        'hello_4',
                                        // '${state2.collegesByRegionModel.data.list[index].phoneNumber}'
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: MediaQuery.of(context).size.height * 0.02,
                                  horizontal: MediaQuery.of(context).size.height * 0.02
                              ),
                              child: Container(),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              } else if (state is DetailOrderLoadingState || state is DetailOrderInitialState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is DetailOrderErrorState) {
                return Center(
                  child: Text('CollegeDetailScreen shows error'),
                );
              } else {
                return Center(
                  child: Text('CollegeDetailScreen shows another error'),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
