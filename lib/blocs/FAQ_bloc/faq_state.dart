part of 'faq_bloc.dart';

@immutable
abstract class FaqState {}

class FaqInitialState extends FaqState {}

class FaqLoadingState extends FaqState {}

class FaqLoadedState extends FaqState {
  FaqModel faqModel;
  FaqLoadedState({this.faqModel});
}

class FaqErrorState extends FaqState {}
