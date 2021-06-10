import 'dart:async';
import 'dart:developer';

import 'package:abiturient_app/models/my_orders.dart';
import 'package:abiturient_app/services/api_provider.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'orders_event.dart';
part 'orders_state.dart';

class DetailOrderBloc extends Bloc<DetailOrderEvent, DetailOrderState> {
  DetailOrderBloc() : super(DetailOrderInitialState());

  @override
  Stream<DetailOrderState> mapEventToState(DetailOrderEvent event) async* {
    if (event is DetailOrderGetEvent) {
      yield DetailOrderLoadingState();
      try {
        log("STarting orders");
        DetailOrderModel _myOrdersModel =
            await ApiProvider().requestPost(RequestNames.detailOrder);
        yield DetailOrderLoadedState(myOrdersModel: _myOrdersModel);
      } catch (e) {
        yield DetailOrderErrorState();
      }
    }
  }
}
