import 'package:budgeting_app/core/theme/error/failure.dart';
import 'package:budgeting_app/core/usecase/usecase.dart';
import 'package:budgeting_app/features/authentication/domain/repository/authentication_repository.dart';
import 'package:fpdart/fpdart.dart';

class UserSignUp implements UseCase<String, UserSignUpParameters> {
  final AuthenticationRepository authenticationRepository;
  const UserSignUp(this.authenticationRepository);
  @override
  Future<Either<Failure, String>> call(UserSignUpParameters parameters) async {
    return await authenticationRepository.signUp(
        firstName: parameters.firstName,
        lastName: parameters.lastName,
        email: parameters.email,
        password: parameters.password);
  }
}

class UserSignUpParameters {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  UserSignUpParameters(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.password});
}
