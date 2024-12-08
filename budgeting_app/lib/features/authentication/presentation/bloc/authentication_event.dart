part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationEvent {}

final class AuthenticationSignUp extends AuthenticationEvent {
  final String firstName;
  final String lastName;
  final String email;
  final String password;

  AuthenticationSignUp(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.password});
}

final class AuthenticationSignIn extends AuthenticationEvent {
  final String email;
  final String password;

  AuthenticationSignIn({required this.email, required this.password});
}
