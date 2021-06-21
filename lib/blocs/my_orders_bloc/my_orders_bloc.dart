import 'dart:async';
import 'dart:developer';

import 'package:abiturient_app/models/my_orders.dart';
import 'package:abiturient_app/services/api_provider.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'my_orders_event.dart';
part 'my_orders_state.dart';

class MyOrdersBloc extends Bloc<MyOrdersEvent, MyOrdersState> {
  MyOrdersBloc() : super(MyOrdersInitialState());

  @override
  Stream<MyOrdersState> mapEventToState(MyOrdersEvent event) async* {
    if (event is MyOrdersGetEvent) {
      yield MyOrdersLoadingState();
      try {
        MyOrdersModel _myOrdersModel =
            await ApiProvider().requestPost(RequestNames.myOrders);
        yield MyOrdersLoadedState(myOrdersModel: _myOrdersModel);
      } catch (e) {
        log(e.toString(), name: "eron don don");
        yield MyOrdersErrorState();
      }
    }
  }
}
