part of 'orders_bloc.dart';

@immutable
abstract class DetailOrderState {}

class DetailOrderInitialState extends DetailOrderState {}

class DetailOrderLoadedState extends DetailOrderState {
  DetailOrderModel detailOrderModel;
  DetailOrderLoadedState({this.detailOrderModel});
}

class DetailOrderLoadingState extends DetailOrderState {}

class DetailOrderErrorState extends DetailOrderState {}
