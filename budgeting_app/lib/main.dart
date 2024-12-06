import 'package:budgeting_app/core/private/private_keys.dart';
import 'package:budgeting_app/core/theme/theme.dart';
import 'package:budgeting_app/features/authentication/data/datasources/authentication_remote_data_source.dart';
import 'package:budgeting_app/features/authentication/data/repository/authentication_repository_implementation.dart';
import 'package:budgeting_app/features/authentication/domain/usecases/user_sign_up.dart';
import 'package:budgeting_app/features/authentication/presentation/pages/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'features/authentication/presentation/bloc/authentication_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final supabase = await Supabase.initialize(
      url: SupabaseKeys.url, anonKey: SupabaseKeys.anonKey);
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
          create: (_) => AuthenticationBloc(
                userSignUp: UserSignUp(
                  AthenticationRepositoryImplementation(
                    AuthenticationDataSourceImplemantation(
                      supabase.client,
                    ),
                  ),
                ),
              ))
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.primaryTheme,
      home: const SignInPage(),
    );
  }
}
