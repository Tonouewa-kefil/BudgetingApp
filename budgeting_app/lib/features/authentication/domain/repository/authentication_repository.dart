import 'package:budgeting_app/core/theme/error/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthenticationRepository {
  Future<Either<Failure, String>> signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  });
  Future<Either<Failure, String>> signIp({
    required String email,
    required String password,
  });
}