import 'package:budgeting_app/core/theme/error/excpetions.dart';
import 'package:budgeting_app/core/theme/error/failure.dart';
import 'package:budgeting_app/features/authentication/data/datasources/authentication_remote_data_source.dart';
import 'package:budgeting_app/features/authentication/domain/repository/authentication_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthenticationRepositoryImplementation
    implements AuthenticationRepository {
  final AuthenticationRemoteDataSource remoteDataSource;
  AuthenticationRepositoryImplementation(this.remoteDataSource);
  @override
  Future<Either<Failure, String>> signIn(
      {required String email, required String password}) async {
    try {
      final userId =
          await remoteDataSource.signIn(email: email, password: password);
      return right(userId);
    } on ServerExcption catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> signUp(
      {required String firstName,
      required String lastName,
      required String email,
      required String password}) async {
    try {
      final userId = await remoteDataSource.signUp(
          firstName: firstName,
          lastName: lastName,
          email: email,
          password: password);
      return right(userId);
    } on ServerExcption catch (e) {
      return left(Failure(e.message));
    }
  }
}
