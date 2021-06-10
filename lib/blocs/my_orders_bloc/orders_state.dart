part of 'orders_bloc.dart';

@immutable
abstract class OrdersState {}

class OrdersInitialState extends OrdersState {}

class OrdersLoadedState extends OrdersState {
  MyOrdersModel myOrdersModel;
  OrdersLoadedState({this.myOrdersModel});
}

class OrdersLoadingState extends OrdersState {}

class OrdersErrorState extends OrdersState {}
