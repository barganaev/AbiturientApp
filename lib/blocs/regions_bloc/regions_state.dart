part of 'regions_bloc.dart';

@immutable
abstract class RegionsState {}

class RegionsInitialState extends RegionsState {}

class RegionsLoadingState extends RegionsState {}

class RegionsLoadedState extends RegionsState {
  RegionsModel regionsModel;
  RegionsLoadedState({this.regionsModel});
}

class RegionsErrorState extends RegionsState {}
