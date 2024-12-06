import 'package:budgeting_app/core/theme/error/excpetions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthenticationRemoteDataSource {
  Future<String> signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  });
  Future<String> signIn({
    required String email,
    required String password,
  });
}

class AuthenticationRemoteDataSourceImplemantation
    implements AuthenticationRemoteDataSource {
  final SupabaseClient supabaseClient;
  AuthenticationRemoteDataSourceImplemantation(this.supabaseClient);

  @override
  Future<String> signIn(
      {required String email, required String password}) async {
    try {
      final response = await supabaseClient.auth
          .signInWithPassword(password: password, email: email);
      if (response.user == null) {
        throw const ServerExcption('Password and or email not correct');
      }
      return response.user!.id;
    } catch (e) {
      throw ServerExcption(e.toString());
    }
  }

  @override
  Future<String> signUp(
      {required String firstName,
      required String lastName,
      required String email,
      required String password}) async {
    try {
      final response = await supabaseClient.auth.signUp(
          email: email,
          password: password,
          data: {'firstName': firstName, 'lastName': lastName});
      if (response.user == null) {
        throw const ServerExcption('User is null!');
      }
      return response.user!.id;
    } catch (e) {
      throw ServerExcption(e.toString());
    }
  }
}
