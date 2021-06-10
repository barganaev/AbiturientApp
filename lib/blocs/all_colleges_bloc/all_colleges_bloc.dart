import 'dart:async';
import 'dart:developer';

import 'package:abiturient_app/models/all_colleges_model.dart';
import 'package:abiturient_app/services/api_provider.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'all_colleges_event.dart';
part 'all_colleges_state.dart';

class AllCollegesBloc extends Bloc<AllCollegesEvent, AllCollegesState> {
  AllCollegesBloc() : super(AllCollegesInitialState());

  @override
  Stream<AllCollegesState> mapEventToState(AllCollegesEvent event) async* {
    if (event is AllCollegesGetEvent) {
      yield AllCollegesLoadingState();
      try {
        log("Starting orders");
        AllCollegesModel _allCollegesModel =
            await ApiProvider().requestPost(RequestNames.allColleges);
        yield AllCollegesLoadedState(allCollegesModel: _allCollegesModel);
      } catch (e) {
        yield AllCollegesErrorState();
      }
    }
  }
}
