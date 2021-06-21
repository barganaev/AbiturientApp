import 'dart:async';
import 'dart:developer';

import 'package:abiturient_app/models/FAQ_model.dart';
import 'package:abiturient_app/services/api_provider.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'faq_event.dart';
part 'faq_state.dart';

class FaqBloc extends Bloc<FaqEvent, FaqState> {
  FaqBloc() : super(FaqInitialState());

  @override
  Stream<FaqState> mapEventToState(FaqEvent event) async* {
    if (event is FaqGetEvent) {
      yield FaqLoadingState();
      try {
        log("Starting FaqLoadingState");
        FaqModel _faqmodel = await ApiProvider().requestPost(RequestNames.faq);
        yield FaqLoadedState(faqModel: _faqmodel);
      } catch (e) {
        yield FaqErrorState();
        log('error in FaqBloc.dart', name: "FaqBloc.DART");
      }
    }
  }
}
