import 'package:budgeting_app/core/theme/error/failure.dart';
import 'package:budgeting_app/core/usecase/usecase.dart';
import 'package:budgeting_app/features/authentication/domain/entities/user.dart';
import 'package:budgeting_app/features/authentication/domain/repository/authentication_repository.dart';
import 'package:fpdart/fpdart.dart';

class UserSignIn implements UseCase<User, UserSignInParameters> {
  final AuthenticationRepository authenticationRepository;
  const UserSignIn(this.authenticationRepository);
  @override
  Future<Either<Failure, User>> call(UserSignInParameters parameters) async {
    return await authenticationRepository.signIn(
        email: parameters.email, password: parameters.password);
  }
}

class UserSignInParameters {
  final String email;
  final String password;

  UserSignInParameters({required this.email, required this.password});
}
