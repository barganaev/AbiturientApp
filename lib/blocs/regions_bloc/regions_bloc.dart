import 'dart:async';
import 'dart:developer';

import 'package:abiturient_app/models/regions_model.dart';
import 'package:abiturient_app/services/api_provider.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'regions_event.dart';
part 'regions_state.dart';

class RegionsBloc extends Bloc<RegionsEvent, RegionsState> {
  RegionsBloc() : super(RegionsInitialState());

  @override
  Stream<RegionsState> mapEventToState(RegionsEvent event) async* {
    if (event is RegionsGetEvent) {
      yield RegionsLoadingState();
      try {
        log("STarting RegionsLoadingState");
        RegionsModel _regionsModel =
            await ApiProvider().requestPost(RequestNames.regions);
        yield RegionsLoadedState(regionsModel: _regionsModel);
      } catch (e) {
        yield RegionsErrorState();
      }
    }
  }
}
