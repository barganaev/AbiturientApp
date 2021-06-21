import 'package:abiturient_app/blocs/all_colleges_bloc/all_colleges_bloc.dart';
import 'package:abiturient_app/screens/college_detail_screen.dart';
import 'package:abiturient_app/screens/drawer_screen.dart';
import 'dart:developer';

import 'package:abiturient_app/blocs/colleges_by_region_bloc/colleges_by_region_bloc.dart';
import 'package:abiturient_app/blocs/regions_bloc/regions_bloc.dart';
import 'package:abiturient_app/models/regions_model.dart';
import 'package:abiturient_app/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CollegeScreen extends StatefulWidget {
  List<Datum> list;
  CollegeScreen({this.list});

  @override
  _CollegeScreenState createState() => _CollegeScreenState();
}

class _CollegeScreenState extends State<CollegeScreen> {
  String selectedRegion;
  int indexOfCity = 13;
  int _value = 1;

  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  void onChangedCallback(city) async {
    selectedRegion = city;
    for (int i = 0; i < widget.list.length; i++) {
      if (city == widget.list[i].name) {
        setState(() {
          indexOfCity = i;
          log(widget.list[indexOfCity].ab, name: 'log');
          // BlocProvider.of<CollegesByRegionBloc>(_scaffoldState.currentContext)
          //     .add(CollegesByRegionGetEvent(
          //         id: widget.list[indexOfCity].ab/*BlocProvider.of<CollegesByRegionBloc>(_scaffoldState.currentContext)*/));
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      appBar: appBarMy("Колледж"),
      drawer: MyDrawer(),
      body: MultiBlocProvider(
        providers: [
          BlocProvider<RegionsBloc>(
            create: (context) => RegionsBloc()..add(RegionsGetEvent()),
          ),
          BlocProvider<CollegesByRegionBloc>(
              create: (context) => CollegesByRegionBloc()),
        ],
        child: BlocBuilder<RegionsBloc, RegionsState>(
          builder: (context, state) {
            if (state is RegionsLoadedState) {
              // selectedRegion = widget.list[indexOfCity].name;
              widget.list = state.regionsModel.data;
              selectedRegion = state.regionsModel.data[indexOfCity].name;
              BlocProvider.of<CollegesByRegionBloc>(context).add(
                  CollegesByRegionGetEvent(
                      id: state.regionsModel.data[indexOfCity].ab));
              return Column(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      padding: EdgeInsets.only(left: 10),
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(15)),
                      child: DropdownButton(
                        underline: SizedBox(),
                        isExpanded: true,
                        value: selectedRegion,
                        items: state.regionsModel.data.map((Datum value) {
                          return DropdownMenuItem(
                            value: value.name ?? "text",
                            child: Text(value.name ?? "text"),
                          );
                        }).toList(),
                        onChanged: onChangedCallback,
                      ),
                    ),
                  ),
                  BlocBuilder<CollegesByRegionBloc, CollegesByRegionState>(
                      builder: (context, state2) {
                    if (state2 is CollegesByRegionLoadedState) {
                      return Expanded(
                        child: Container(
                            child: state2
                                    .collegesByRegionModel.data.list.isNotEmpty
                                ? ListView.builder(
                                    // shrinkWrap: true,
                                    itemCount: state2
                                        .collegesByRegionModel.data.list.length,
                                    itemBuilder: (context, index) {
                                      // List<ListElement> list_of_colleges = state.allCollegesModel.data.list;
                                      return Container(
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          0.03,
                                                  horizontal:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.05),
                                              child: Container(
                                                // color: Colors.red,
                                                // height: MediaQuery.of(context)
                                                //         .size
                                                //         .height *
                                                //     0.3,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.6,
                                                child: Card(
                                                  semanticContainer: true,
                                                  clipBehavior: Clip
                                                      .antiAliasWithSaveLayer,
                                                  child: Container(
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal:
                                                            MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.03),
                                                    child:
                                                        Column(
                                                          children: [
                                                            Padding(
                                                              padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.02, horizontal: MediaQuery.of(context).size.width * 0.02),
                                                              child: Image.network(
                                                                  "https://satsis.info/uploads/posts/2020-03/1583870954_www.satsis.info__sky-news-uk.png",
                                                                  fit: BoxFit.fill),
                                                            ),
                                                            Padding(
                                                              padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.02),
                                                              child: Text(
                                                                  '${state2.collegesByRegionModel.data.list[index].name}',
                                                                style: TextStyle(color: Color(0xFF0c2e60), fontSize: MediaQuery.of(context).size.width * 0.05),),
                                                            ),
                                                            Padding(
                                                              padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.005),
                                                              child: Row(
                                                                children: [
                                                                  Icon(Icons.house, color: Color(0xFF0275d8),),
                                                                  Flexible(
                                                                    child: Padding(
                                                                      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.02),
                                                                      child: Text(
                                                                          '${state2.collegesByRegionModel.data.list[index].ownershipName}', style: TextStyle(color: Colors.grey[600]),),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.005),
                                                              child: Row(
                                                                children: [
                                                                  Icon(Icons.location_on, color: Color(0xFF0275d8),),
                                                                  Flexible(
                                                                    child: Padding(
                                                                      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.03),
                                                                      child: Text(
                                                                          '${state2.collegesByRegionModel.data.list[index].address}', style: TextStyle(fontWeight: FontWeight.w400, color: Colors.black),),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.005),
                                                              child: Row(
                                                                children: [
                                                                  Icon(Icons.phone, color: Color(0xFF0275d8),),
                                                                  Flexible(
                                                                    child: Padding(
                                                                      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.02),
                                                                      child: Text(
                                                                          '${state2.collegesByRegionModel.data.list[index].phoneNumber}', style: TextStyle(color: Colors.grey[600]),),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.02, horizontal: MediaQuery.of(context).size.height * 0.02),
                                                              child: Align(
                                                                alignment: Alignment.bottomRight,
                                                                child: ElevatedButton(
                                                                  onPressed: (){
                                                                    Navigator.push(context, MaterialPageRoute(builder: (context) => CollegeDetailScreen()));
                                                                  },
                                                                  child: Text('Подробнее'),
                                                                  style: ElevatedButton.styleFrom(
                                                                    primary: Color(0xFF007bff)
                                                                  ),
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            // Text('${state.allCollegesModel.data.list[index].name}'),
                                            Divider(),
                                          ],
                                        ),
                                      );
                                    })
                                : Center(child: Text('Нет Колледжей'))),
                      );
                    } else if (state2 is CollegesByRegionLoadingState ||
                        state2 is CollegesByRegionInitialState) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state2 is CollegesByRegionErrorState) {
                      return Center(
                        child: Text('look for about_app_screen.dart'),
                      );
                    } else {
                      return Center(
                        child: Text('Error in about_app_screen.dart aaaa'),
                      );
                    }
                  }),
                ],
              );
            } else if (state is RegionsLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is RegionsErrorState) {
              return Center(
                child: Text('look for about_app_screen.dart eeeee'),
              );
            } else {
              return Center(
                child: Text('Error in about_app_screen.dart eeeee'),
              );
            }
          },
        ),
      ),
    );
  }
}
