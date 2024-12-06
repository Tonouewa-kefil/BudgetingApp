part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationState {}

final class AuthenticationInitial extends AuthenticationState {}

final class AuthenticationLoading extends AuthenticationState {}

final class AuthenticationSucces extends AuthenticationState {
  final String uid;
  AuthenticationSucces(this.uid);
}

final class AuthenticationFailure extends AuthenticationState {
  final String message;
  AuthenticationFailure(this.message);
}
