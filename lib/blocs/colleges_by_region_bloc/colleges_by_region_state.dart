part of 'colleges_by_region_bloc.dart';

@immutable
abstract class CollegesByRegionState {}

class CollegesByRegionInitialState extends CollegesByRegionState {}

class CollegesByRegionLoadedState extends CollegesByRegionState {
  CollegesByRegionModel collegesByRegionModel;
  CollegesByRegionLoadedState({this.collegesByRegionModel});
}

class CollegesByRegionLoadingState extends CollegesByRegionState {}

class CollegesByRegionErrorState extends CollegesByRegionState {}
