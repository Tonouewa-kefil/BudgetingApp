import 'package:budgeting_app/features/authentication/domain/entities/user.dart';
import 'package:budgeting_app/features/authentication/domain/usecases/user_sign_in.dart';
import 'package:budgeting_app/features/authentication/domain/usecases/user_sign_up.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserSignUp _userSignUp;
  final UserSignIn _userSignIn;

  AuthenticationBloc({
    required UserSignUp userSignUp,
    required UserSignIn userSignIn,
  })  : _userSignUp = userSignUp,
        _userSignIn = userSignIn,
        super(AuthenticationInitial()) {
    on<AuthenticationSignUp>(_onAuthenticationSignUp);
    on<AuthenticationSignIn>(_onAuthenticationSignIn);
  }
  void _onAuthenticationSignUp(
      AuthenticationSignUp event, Emitter<AuthenticationState> emit) {
    (event, emit) async {
      emit(AuthenticationLoading());
      final response = await _userSignUp(UserSignUpParameters(
          firstName: event.firstName,
          lastName: event.lastName,
          email: event.email,
          password: event.password));

      response.fold((failure) => emit(AuthenticationFailure(failure.message)),
          (user) => emit(AuthenticationSuccess(user)));
    };
  }

  void _onAuthenticationSignIn(
      AuthenticationSignIn event, Emitter<AuthenticationState> emit) {
    (event, emit) async {
      emit(AuthenticationLoading());
      final response = await _userSignIn(
          UserSignInParameters(email: event.email, password: event.password));

      response.fold((failure) => emit(AuthenticationFailure(failure.message)),
          (user) => emit(AuthenticationSuccess(user)));
    };
  }
}
