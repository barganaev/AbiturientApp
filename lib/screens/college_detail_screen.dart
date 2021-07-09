import 'dart:convert';
import 'dart:developer';

import 'package:abiturient_app/blocs/college_detail_bloc/college_detail_bloc.dart';
import 'package:abiturient_app/blocs/detail_order_bloc/detail_orders_bloc.dart';
import 'package:abiturient_app/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CollegeDetailScreen extends StatefulWidget {
  String bin;
  CollegeDetailScreen({@required this.bin});

  @override
  _CollegeDetailScreenState createState() => _CollegeDetailScreenState();
}

class _CollegeDetailScreenState extends State<CollegeDetailScreen> {

  bool visib = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMy('Колледж'),
      body: SingleChildScrollView(
        child: BlocProvider<CollegeDetailBloc>(
          create: (context) => CollegeDetailBloc()..add(CollegeDetailGetEvent(collegeBin: widget.bin.toString())),
          child: BlocBuilder<CollegeDetailBloc, CollegeDetailState>(
            builder: (context, state) {
              if (state is CollegeDetailLoadedState) {
                return Column(
                  children: [
                    Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.height * 0.03,
                            horizontal: MediaQuery.of(context).size.width * 0.03
                        ),
                        child: Column(
                          children: [
                            Card(
                              elevation: 2,
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  topRight: Radius.circular(5),
                                ),
                                child: Column(
                                  children: [
                                    ListTile(
                                      tileColor: Colors.grey[50],
                                      title: Text('О колледже',
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context).size.width * 0.05,
                                            fontWeight: FontWeight.bold
                                        ),),
                                    ),

                                    Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            child: ListTile(
                                              title: Text(state.collegeDetailModel.data.content.collegeData.values.name.name ?? "-", style: TextStyle(fontWeight: FontWeight.bold),),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            child: ListTile(
                                              title: Text(state.collegeDetailModel.data.content.collegeData.values.name.value ?? "-"),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Divider(),

                                    Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            child: ListTile(
                                              title: Text(state.collegeDetailModel.data.content.collegeData.values.regionName.name ?? "-", style: TextStyle(fontWeight: FontWeight.bold),),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            child: ListTile(
                                              title: Text(state.collegeDetailModel.data.content.collegeData.values.regionName.value ?? "-"),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Divider(),

                                    Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            child: ListTile(
                                              title: Text(state.collegeDetailModel.data.content.collegeData.values.orgTypeName.name ?? "-", style: TextStyle(fontWeight: FontWeight.bold),),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            child: ListTile(
                                              title: Text(state.collegeDetailModel.data.content.collegeData.values.orgTypeName.value ?? "-"),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Divider(),

                                    Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            child: ListTile(
                                              title: Text(state.collegeDetailModel.data.content.collegeData.values.ownershipTypeName.name ?? "-", style: TextStyle(fontWeight: FontWeight.bold),),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            child: ListTile(
                                              title: Text(state.collegeDetailModel.data.content.collegeData.values.ownershipTypeName.value ?? "-"),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Divider(),

                                    Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            child: ListTile(
                                              title: Text(state.collegeDetailModel.data.content.collegeData.values.address.name ?? "-", style: TextStyle(fontWeight: FontWeight.bold),),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            child: ListTile(
                                              title: Text(state.collegeDetailModel.data.content.collegeData.values.address.value ?? "-"),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Divider(),

                                    Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            child: ListTile(
                                              title: Text(state.collegeDetailModel.data.content.collegeData.values.phoneNumber.name ?? "-", style: TextStyle(fontWeight: FontWeight.bold),),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            child: ListTile(
                                              title: Text(state.collegeDetailModel.data.content.collegeData.values.phoneNumber.value ?? "-"),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Divider(),

                                    Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            child: ListTile(
                                              title: Text(state.collegeDetailModel.data.content.collegeData.values.email.name ?? "-", style: TextStyle(fontWeight: FontWeight.bold),),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            child: ListTile(
                                              title: Text(state.collegeDetailModel.data.content.collegeData.values.email.value ?? "-"),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Divider(),

                                    Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            child: ListTile(
                                              title: Text(state.collegeDetailModel.data.content.collegeData.values.siteUrl.name ?? "-", style: TextStyle(fontWeight: FontWeight.bold),),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            child: ListTile(
                                              title: Text(state.collegeDetailModel.data.content.collegeData.values.siteUrl.value ?? "-"),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Divider(),

                                    Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            child: ListTile(
                                              title: Text(state.collegeDetailModel.data.content.collegeData.values.directorFullname.name ?? "-", style: TextStyle(fontWeight: FontWeight.bold),),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            child: ListTile(
                                              title: Text(state.collegeDetailModel.data.content.collegeData.values.directorFullname.value ?? "-"),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Divider(),
                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                    ),
                    Visibility(
                      visible: visib,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.height * 0.03,
                            horizontal: MediaQuery.of(context).size.width * 0.03
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.height * 0.6,
                          child: Card(
                            semanticContainer: true,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Container(
                              // padding: EdgeInsets.symmetric(
                              //     horizontal: MediaQuery.of(context).size.width * 0.03
                              // ),
                              child: Column(
                                children: [
                                  ListTile(
                                    tileColor: Colors.grey[50],
                                    title: Text(
                                      // '${state.collegeDetailModel.data.text}',
                                      'Общее сведения',
                                      // '${state2.collegesByRegionModel.data.list[index].name}',
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context).size.width * 0.05,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: MediaQuery.of(context).size.height * 0.005
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: MediaQuery.of(context).size.height * 0.01,
                                          horizontal: MediaQuery.of(context).size.width * 0.04
                                      ),
                                      child: Text(
                                        state.collegeDetailModel.data.content.generalInformation.data/* == null ? visib : !visib*/,
                                        // '${state2.collegesByRegionModel.data.list[index].phoneNumber}'
                                      ),
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
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.01,
                        right: MediaQuery.of(context).size.width * 0.01,
                      ),
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: state.collegeDetailModel.data.content.specialties.data.length,
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
                                        "Специальность #${index + 1}",
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
                                      itemCount: 1/*state.collegeDetailModel.data.content.specialties.data.length*/,
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
                                                      title: Text('Название'),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    child: ListTile(
                                                      title: Text(state.collegeDetailModel.data.content.specialties.data[index].name),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Divider(),

                                            Row(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    child: ListTile(
                                                      title: Text('Код специальности'),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    child: ListTile(
                                                      title: Text(state.collegeDetailModel.data.content.specialties.data[index].specialtyCode),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Divider(),

                                            Row(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    child: ListTile(
                                                      title: Text('Квалификационный код'),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    child: ListTile(
                                                      title: Text(state.collegeDetailModel.data.content.specialties.data[index].qualificationCode),
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
                            ),
                          );
                        },
                      ),
                    )
                  ],
                );
              } else if (state is CollegeDetailLoadingState || state is CollegeDetailInitialState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is CollegeDetailErrorState) {
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
