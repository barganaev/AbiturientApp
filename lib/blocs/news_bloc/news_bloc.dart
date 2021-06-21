import 'dart:async';
import 'dart:developer';

import 'package:abiturient_app/models/news_model.dart';
import 'package:abiturient_app/services/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(NewsInitialState());

  @override
  Stream<NewsState> mapEventToState(NewsEvent event) async* {
    if(event is NewsGetEvent) {
      yield NewsLoadingState();
      try {
        log("Starting NewsLoadingState");
        NewsModel _newsModel = await ApiProvider().requestPost(RequestNames.news);
        yield NewsLoadedState(newsModel: _newsModel);
      } catch (e) {
        yield NewsLoadingState();
        log('error in news_bloc.dart', name: "NEWS_BLOC.DART");
      }
    }
  }
}