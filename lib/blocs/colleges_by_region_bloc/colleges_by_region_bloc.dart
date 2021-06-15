import 'dart:async';
import 'dart:developer';

import 'package:abiturient_app/models/colleges_by_region_model.dart';
import 'package:abiturient_app/services/api_provider.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'colleges_by_region_event.dart';
part 'colleges_by_region_state.dart';

class CollegesByRegionBloc
    extends Bloc<CollegesByRegionEvent, CollegesByRegionState> {
  CollegesByRegionBloc() : super(CollegesByRegionInitialState());

  @override
  Stream<CollegesByRegionState> mapEventToState(
      CollegesByRegionEvent event) async* {
    if (event is CollegesByRegionGetEvent) {
      yield CollegesByRegionLoadingState();
      try {
        log("STarting CollegesByRegionGetEvent");
        final _collegesByRegionModel =
            await ApiProvider().requestPost(RequestNames.collegesByRegion);
        yield CollegesByRegionLoadedState(
            collegesByRegionModel: _collegesByRegionModel);
      } catch (e) {
        yield CollegesByRegionErrorState();
      }
    }
  }
}
