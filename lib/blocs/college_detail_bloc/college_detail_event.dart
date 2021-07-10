part of 'college_detail_bloc.dart';

@immutable
abstract class CollegeDetailEvent {}

class CollegeDetailGetEvent extends CollegeDetailEvent {
  String collegeBin;
  // int collegeBin;
  CollegeDetailGetEvent({@required this.collegeBin});
}