import 'dart:developer';

import 'package:abiturient_app/blocs/news_bloc/news_bloc.dart';
import 'package:abiturient_app/screens/drawer_screen.dart';
import 'package:abiturient_app/widgets/appbar_widget.dart';
import 'package:abiturient_app/widgets/on_will_scope.dart';
import 'package:abiturient_app/screens/drawer_screen.dart';
import 'package:abiturient_app/screens/news_detail_screen.dart';
import 'package:abiturient_app/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => willPopCallback(context),
      child: Scaffold(
        appBar: appBarMy("Новости"),
        drawer: MyDrawer(),
        body: BlocProvider<NewsBloc>(
          create: (context) => NewsBloc()..add(NewsGetEvent()),
          child: BlocBuilder<NewsBloc, NewsState>(
            builder: (context, state) {
              if (state is NewsLoadedState) {
                log(state.newsModel.data.body[0].image[0], name: "Image URL");
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.newsModel.data.body.length,
                    itemBuilder: (context, index) {
                      // log(state.newsModel.data.body[0].image[0],
                      //     name: "url name");
                      DateTime dateTime =
                          state.newsModel.data.body[index].createdAt;
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.height * 0.01,
                            horizontal:
                                MediaQuery.of(context).size.width * 0.05),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NewsDetailScreen(
                                  title: state.newsModel.data.body[index].title
                                      .toString(),
                                  body: state.newsModel.data.body[index].body
                                      .toString(),
                                  img: state.newsModel.data.body[index].image[0]
                                      .toString(),
                                  createdAt: state
                                      .newsModel.data.body[index].createdAt
                                      .toString(),
                                ),
                              ),
                            );
                          },
                          child: Container(
                            child: Column(
                              children: [
                                Container(
                                  // color: Colors.red,
                                  height:
                                      MediaQuery.of(context).size.height * 0.3,
                                  child: Card(
                                    semanticContainer: true,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: Image.network(
                                      '${state.newsModel.data.body[index].image[0]}',
                                      fit: BoxFit.fill,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    elevation: 1,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical:
                                          MediaQuery.of(context).size.height *
                                              0.01),
                                  child: Text(
                                    '${state.newsModel.data.body[index].title.toString()}',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical:
                                          MediaQuery.of(context).size.height *
                                              0.01),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                        '${dateTime.toString().substring(0, 10)}, ${dateTime.toString().substring(11, 16)}'),
                                  ),
                                ),
                                Divider()
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              } else if (state is NewsLoadingState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is NewsErrorState) {
                return Center(
                  child: Text('look for news_screen.dart eeeee'),
                );
              } else {
                return Center(
                  child: Text('Error in news_screen.dart eeeee'),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
