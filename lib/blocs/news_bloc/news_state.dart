part of 'news_bloc.dart';

@immutable
abstract class NewsState {}

class NewsInitialState extends NewsState {}

class NewsLoadingState extends NewsState {}

class NewsLoadedState extends NewsState {
  NewsModel newsModel;
  NewsLoadedState({this.newsModel});
}

class NewsErrorState extends NewsState {}