part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginLoadedState extends LoginState {
  LoginModel loginModel;
  LoginLoadedState({@required this.loginModel});
}

class LoginErrorState extends LoginState {}
