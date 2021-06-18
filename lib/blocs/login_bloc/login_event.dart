part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginDoEvent extends LoginEvent {
  String p12, password;
  LoginDoEvent({@required this.p12, @required this.password});
}
