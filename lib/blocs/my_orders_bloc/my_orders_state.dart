part of 'my_orders_bloc.dart';

@immutable
abstract class MyOrdersState {}

class MyOrdersInitialState extends MyOrdersState {}

class MyOrdersLoadedState extends MyOrdersState {
  // MyOrdersModel myOrdersModel;
  String myOrdersJson;
  MyOrdersLoadedState({this.myOrdersJson});
}

class MyOrdersLoadingState extends MyOrdersState {}

class MyOrdersErrorState extends MyOrdersState {}
