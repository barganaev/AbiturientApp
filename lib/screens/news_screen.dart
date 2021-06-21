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
                return ListView.builder(
                    itemCount: state.newsModel.data.body.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.height * 0.01,
                            horizontal: MediaQuery.of(context).size.width * 0.05),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NewsDetailScreen(title: state.newsModel.data.body[index].title,
                                                                            body: state.newsModel.data.body[index].body,
                                                                             img: state.newsModel.data.body[index].image[index][0],
                                                                       createdAt: state.newsModel.data.body[index].createdAt.toString())));
                          },
                          child: Container(
                            child: Column(
                              children: [
                                Container(
                                  // color: Colors.red,
                                  height: MediaQuery.of(context).size.height * 0.3,
                                  child: Card(
                                    semanticContainer: true,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: Image.asset('${state.newsModel.data.body[index].image[index][0]}')
                                    /*Image.network(
                                        "https://satsis.info/uploads/posts/2020-03/1583870954_www.satsis.info__sky-news-uk.png",
                                        fit: BoxFit.fitWidth)*/,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    elevation: 1,
                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical:
                                        MediaQuery.of(context).size.height * 0.01),
                                    child: Text(
                                        '${state.newsModel.data.body[index].title}'
                                      /*'Expert Advice: How to Build an Accessible Education Website on WordPress.com'*/,
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    )),
                                Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical:
                                        MediaQuery.of(context).size.height * 0.01),
                                    child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text('19.08.2020, 19:17'))),
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
