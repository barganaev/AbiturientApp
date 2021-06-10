part of 'all_colleges_bloc.dart';

@immutable
abstract class AllCollegesState {}

class AllCollegesInitialState extends AllCollegesState {}

class AllCollegesLoadedState extends AllCollegesState {
  AllCollegesModel allCollegesModel;
  AllCollegesLoadedState({this.allCollegesModel});
}

class AllCollegesLoadingState extends AllCollegesState {}

class AllCollegesErrorState extends AllCollegesState {}
