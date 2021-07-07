import 'dart:async';
import 'dart:developer';

import 'package:abiturient_app/models/college_detail.dart';
import 'package:abiturient_app/services/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'college_detail_event.dart';
part 'college_detail_state.dart';

class CollegeDetailBloc extends Bloc<CollegeDetailEvent, CollegeDetailState> {
  CollegeDetailBloc() : super(CollegeDetailInitialState());

  @override
  Stream<CollegeDetailState> mapEventToState(CollegeDetailEvent event) async* {
    if (event is CollegeDetailGetEvent) {
      yield CollegeDetailLoadingState();
      try {
        CollegeDetailModel _collegeDetailModel = await ApiProvider().requestPost(RequestNames.collegeDetail);
        print('THIS IS RIGHT WAY!');
        yield CollegeDetailLoadedState(collegeDetailModel: _collegeDetailModel);
      } catch (e) {
        print('HELLO, WE ARE IN TROUBLE!');
        yield CollegeDetailErrorState();
      }
    }
  }
}