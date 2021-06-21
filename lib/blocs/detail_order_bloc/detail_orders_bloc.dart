import 'dart:async';
import 'dart:developer';

import 'package:abiturient_app/models/detail_order_model.dart';
import 'package:abiturient_app/services/api_provider.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'detail_orders_event.dart';
part 'detail_orders_state.dart';

class DetailOrderBloc extends Bloc<DetailOrderEvent, DetailOrderState> {
  DetailOrderBloc() : super(DetailOrderInitialState());

  @override
  Stream<DetailOrderState> mapEventToState(DetailOrderEvent event) async* {
    if (event is DetailOrderGetEvent) {
      yield DetailOrderLoadingState();
      try {
        log("RequestNames.detailOrder");
        dynamic _myOrdersModel =
            await ApiProvider().requestPost(RequestNames.detailOrder);
        // log(_myOrdersModel.toString(), name: "_myOrdersModel.toString");
        // Map<String, dynamic> blockJson = _myOrdersModel["data"] ?? null;
        // log(_myOrdersModel.toString(),
        //     name: "_myOrdersModel.toString.toString");
        // Map<String, dynamic> dataJson = _myOrdersModel["data"] ?? null;
        yield DetailOrderLoadedState(jsonData: _myOrdersModel);
      } catch (e) {
        log(e.toString(), name: "error");
        yield DetailOrderErrorState();
      }
    }
  }
}
