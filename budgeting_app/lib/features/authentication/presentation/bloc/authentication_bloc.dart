import 'package:budgeting_app/features/authentication/domain/usecases/user_sign_up.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserSignUp _userSignUp;
  AuthenticationBloc({
    required UserSignUp userSignUp,
  })  : _userSignUp = userSignUp,
        super(AuthenticationInitial()) {
    on<AuthenticationSignUp>((event, emit) async {
      final response = await _userSignUp(UserSignUpParameters(
          firstName: event.firstName,
          lastName: event.lastName,
          email: event.email,
          password: event.password));

      response.fold((failure) => emit(AuthenticationFailure(failure.message)),
          (uid) => emit(AuthenticationSucces(uid)));
    });
  }
}
