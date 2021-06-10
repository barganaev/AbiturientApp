part of 'orders_bloc.dart';

@immutable
abstract class DetailOrderState {}

class DetailOrderInitialState extends DetailOrderState {}

class DetailOrderLoadedState extends DetailOrderState {
  DetailOrderModel myOrdersModel;
  DetailOrderLoadedState({this.myOrdersModel});
}

class DetailOrderLoadingState extends DetailOrderState {}

class DetailOrderErrorState extends DetailOrderState {}
