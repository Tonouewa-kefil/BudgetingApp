import 'package:budgeting_app/core/theme/error/failure.dart';
import 'package:budgeting_app/features/authentication/domain/entities/user.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthenticationRepository {
  Future<Either<Failure, User>> signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  });
  Future<Either<Failure, User>> signIn({
    required String email,
    required String password,
  });
}
