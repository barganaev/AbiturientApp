import 'dart:async';
import 'dart:developer';

import 'package:abiturient_app/models/my_orders.dart';
import 'package:abiturient_app/services/api_provider.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'orders_event.dart';
part 'orders_state.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  OrdersBloc() : super(OrdersInitialState());

  @override
  Stream<OrdersState> mapEventToState(OrdersEvent event) async* {
    if (event is OrdersGetEvent) {
      yield OrdersLoadingState();
      try {
        log("STarting orders");
        MyOrdersModel _myOrdersModel =
            await ApiProvider().requestPost(RequestNames.myOrders);
        yield OrdersLoadedState(myOrdersModel: _myOrdersModel);
      } catch (e) {
        yield OrdersErrorState();
      }
    }
  }
}
