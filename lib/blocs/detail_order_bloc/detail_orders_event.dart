part of 'detail_orders_bloc.dart';

@immutable
abstract class DetailOrderEvent {}

class DetailOrderGetEvent extends DetailOrderEvent {
  String requestId;
  DetailOrderGetEvent({@required this.requestId});
}
