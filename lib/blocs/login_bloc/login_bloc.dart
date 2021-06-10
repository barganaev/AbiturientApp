import 'dart:async';
import 'dart:developer';

import 'package:abiturient_app/models/login_model.dart';
import 'package:abiturient_app/services/api_provider.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginDoEvent) {
      yield LoginLoadingState();
      // await Future.delayed(Duration(seconds: 3));
      try {
        LoginModel loginModel = await ApiProvider().requestPost(
          RequestNames.login,
          ecpFile: event.p12,
          password: event.password,
        );
        yield LoginLoadedState(loginModel: loginModel);
      } catch (e) {
        log(e.toString(), name: "error");
        yield LoginErrorState();
      }
    }
  }
}
