part of 'detail_orders_bloc.dart';

@immutable
abstract class DetailOrderState {}

class DetailOrderInitialState extends DetailOrderState {}

class DetailOrderLoadedState extends DetailOrderState {
  // DetailOrderModel detailOrderModel;
  dynamic jsonData;
  DetailOrderLoadedState({this.jsonData});
}

class DetailOrderLoadingState extends DetailOrderState {}

class DetailOrderErrorState extends DetailOrderState {}
