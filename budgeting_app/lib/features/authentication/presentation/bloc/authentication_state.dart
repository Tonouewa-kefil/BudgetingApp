part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationState {}

final class AuthenticationInitial extends AuthenticationState {}

final class AuthenticationLoading extends AuthenticationState {}

final class AuthenticationSuccess extends AuthenticationState {
  final User user;
  AuthenticationSuccess(this.user);
}

final class AuthenticationFailure extends AuthenticationState {
  final String message;
  AuthenticationFailure(this.message);
}
