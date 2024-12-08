import 'package:budgeting_app/core/private/private_keys.dart';
import 'package:budgeting_app/features/authentication/data/datasources/authentication_remote_data_source.dart';
import 'package:budgeting_app/features/authentication/data/repository/authentication_repository_implementation.dart';
import 'package:budgeting_app/features/authentication/domain/repository/authentication_repository.dart';
import 'package:budgeting_app/features/authentication/domain/usecases/user_sign_in.dart';
import 'package:budgeting_app/features/authentication/domain/usecases/user_sign_up.dart';
import 'package:budgeting_app/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final serviceLocator = GetIt.instance;

Future<void> initiateDependencies() async {
  _initiateAuth();
  final supabase = await Supabase.initialize(
      url: SupabaseKeys.url, anonKey: SupabaseKeys.anonKey);

  serviceLocator.registerLazySingleton(() => supabase.client);
}

//This is to register the services that we need.
void _initiateAuth() {
  serviceLocator.registerFactory<AuthenticationRemoteDataSource>(() =>
      AuthenticationRemoteDataSourceImplemantation(
          serviceLocator<SupabaseClient>()));

  serviceLocator.registerFactory<AuthenticationRepository>(
      () => AuthenticationRepositoryImplementation(serviceLocator()));

  serviceLocator.registerFactory(() => UserSignUp(serviceLocator()));

  serviceLocator.registerFactory(() => UserSignIn(serviceLocator()));

  serviceLocator.registerLazySingleton(() => AuthenticationBloc(
      userSignUp: serviceLocator(), userSignIn: serviceLocator()));
}
