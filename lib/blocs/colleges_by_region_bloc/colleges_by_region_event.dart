part of 'colleges_by_region_bloc.dart';

@immutable
abstract class CollegesByRegionEvent {}

class CollegesByRegionGetEvent extends CollegesByRegionEvent {
  String id;
  CollegesByRegionGetEvent({this.id});
}
