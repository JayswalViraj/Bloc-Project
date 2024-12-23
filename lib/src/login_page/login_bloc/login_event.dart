import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {}

class LoginButtonClickEvent extends LoginEvent {
  final String email;
  final String password;

  LoginButtonClickEvent({required this.email, required this.password});

  @override
  // TODO: implement props
  List<Object?> get props => [email,password];
}

class LoginPasswordObsecureEvent extends LoginEvent{
 final bool obscureTextPassword;
  LoginPasswordObsecureEvent({required this.obscureTextPassword});
  @override
  // TODO: implement props
  List<Object?> get props => [obscureTextPassword];
}

class LoginEmailValidationEvent extends LoginEvent{
  final String? value;
  LoginEmailValidationEvent({required this.value});
  @override
  // TODO: implement props
  List<Object?> get props => [value];
}

