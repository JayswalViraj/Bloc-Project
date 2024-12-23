import 'package:bloc_project/global/global_functions/global_functions.dart';
import 'package:bloc_project/src/login_page/login_bloc/login_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repository/login_repository.dart';
import 'login_event.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<LoginButtonClickEvent>((event, emit) async {
      if (state.isEmailValid == true) {
        emit(state.copyWith(
          isLoading: true,
          isSubmitted: false,
        ));

        Map<String, dynamic> body = await LoginRepository()
            .loginApi(username: event.email, password: event.password);

        print("Login Api Response: " + body.toString());

        if (body.containsKey("firstName")) {
          loginApp();
          emit(state.copyWith(
              isLoading: false,
              message: body["firstName"] + " " + body["lastName"],
              isSubmitted: true));


        } else {



          emit(state.copyWith(
              isLoading: false,
              message: "Something Went Wrong",
              isSubmitted: true));
        }
      } else {
        add(LoginEmailValidationEvent(value: event.email));
      }
    });

    on<LoginPasswordObsecureEvent>((event, emit) {
      emit(state.copyWith(obscureTextPassword: !state.obscureTextPassword));
    });

    on<LoginEmailValidationEvent>((event, emit) {
      debugPrint("event value" + event.value.toString());
      if (event.value == null || event.value!.isEmpty) {
        emit(state.copyWith(
            emailValidation: "Enter Email", isEmailValid: false));
      } else {
        state.emailValidation = null;
        emit(state.copyWith(isEmailValid: true));
      }
    });
  }
}
