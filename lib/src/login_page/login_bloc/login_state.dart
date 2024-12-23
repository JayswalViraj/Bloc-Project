import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  final bool? isLoading;
  final String? message;
  final bool isSubbmited;
  final bool obscureTextPassword;
   String? emailValidation;
  final bool? isEmailValid;

  LoginState(
      {this.isLoading,
      this.message,
      this.isSubbmited = false,
      this.obscureTextPassword = true,
      this.emailValidation,
      this.isEmailValid=false});
  @override
  // TODO: implement props
  List<Object?> get props => [
        isLoading,
        message,
        isSubbmited,
        obscureTextPassword,
        emailValidation,
        isEmailValid
      ];

  LoginState copyWith(
      {bool? isLoading,
      String? message,
      bool? isSubmitted,
      bool? obscureTextPassword,
      String? emailValidation,
      bool? isEmailValid}) {

    return LoginState(
        isLoading: isLoading ?? this.isLoading,
        message: message ?? this.message,
        isSubbmited: isSubmitted ?? this.isSubbmited,
        obscureTextPassword: obscureTextPassword ?? this.obscureTextPassword,
        emailValidation: emailValidation ?? this.emailValidation,
        isEmailValid: isEmailValid ?? this.isEmailValid);
  }
}
