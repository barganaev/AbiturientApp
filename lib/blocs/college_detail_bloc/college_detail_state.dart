part of 'college_detail_bloc.dart';

@immutable
abstract class CollegeDetailState {}

class CollegeDetailInitialState extends CollegeDetailState {}

class CollegeDetailLoadedState extends CollegeDetailState {
  CollegeDetailModel collegeDetailModel;
  // String collegeDetailModel;
  CollegeDetailLoadedState({this.collegeDetailModel/*, CollegeDetailModel CollegeDetailModel*/});
}

class CollegeDetailLoadingState extends CollegeDetailState {}

class CollegeDetailErrorState extends CollegeDetailState {}
