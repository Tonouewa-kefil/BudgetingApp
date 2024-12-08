import 'package:budgeting_app/core/theme/error/excpetions.dart';
import 'package:budgeting_app/core/theme/error/failure.dart';
import 'package:budgeting_app/features/authentication/data/datasources/authentication_remote_data_source.dart';
import 'package:budgeting_app/features/authentication/domain/repository/authentication_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sb;

import '../../domain/entities/user.dart';

class AuthenticationRepositoryImplementation
    implements AuthenticationRepository {
  final AuthenticationRemoteDataSource remoteDataSource;
  AuthenticationRepositoryImplementation(this.remoteDataSource);
  @override
  Future<Either<Failure, User>> signIn(
      {required String email, required String password}) async {
    return _getUser(() async =>
        await remoteDataSource.signIn(email: email, password: password));
  }

  @override
  Future<Either<Failure, User>> signUp(
      {required String firstName,
      required String lastName,
      required String email,
      required String password}) async {
    return _getUser(() async => await remoteDataSource.signUp(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password));
  }

  Future<Either<Failure, User>> _getUser(
    Future<User> Function() fn,
  ) async {
    try {
      final user = await fn();
      return right(user);
    } on sb.AuthException catch (e) {
      return left(Failure(e.message));
    } on ServerExcption catch (e) {
      return left(Failure(e.message));
    }
  }
}
