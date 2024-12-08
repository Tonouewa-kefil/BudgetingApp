import 'package:budgeting_app/core/common/widgets/loader.dart';
import 'package:budgeting_app/core/theme/app_colors.dart';
import 'package:budgeting_app/core/utils/show_snackbar.dart';
import 'package:budgeting_app/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:budgeting_app/features/authentication/presentation/pages/forgot_password_page.dart';
import 'package:budgeting_app/features/authentication/presentation/pages/sign_up_page.dart';
import 'package:budgeting_app/features/authentication/presentation/widgets/authentication_textfield.dart';
import 'package:budgeting_app/features/authentication/presentation/widgets/authetication_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const SignInPage());
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocConsumer<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            if (state is AuthenticationFailure) {
              showSnackBar(context, state.message);
            }
          },
          builder: (context, state) {
            if (state is AuthenticationLoading) {
              return const Loader();
            }
            return Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Login.",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const SizedBox(height: 10),
                  AuthenticationTextfield(
                    hintText: "Email",
                    obscure: false,
                    controller: emailController,
                  ),
                  const SizedBox(height: 10),
                  AuthenticationTextfield(
                    hintText: "Password",
                    obscure: true,
                    controller: passwordController,
                  ),
                  const SizedBox(height: 20),
                  AuthenticationButton(
                    buttonText: "Sign In",
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        context.read<AuthenticationBloc>().add(
                            AuthenticationSignIn(
                                email: emailController.text.trim(),
                                password: passwordController.text.trim()));
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () =>
                        {Navigator.push(context, ForgotPasswordPage.route())},
                    child: RichText(
                        text: TextSpan(
                            text: 'Forgort Password?',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                    color: AppColor.sblue,
                                    fontWeight: FontWeight.bold))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, SignUpPage.route());
                    },
                    child: RichText(
                      text: TextSpan(
                          text: 'Don\'t have an Account? ',
                          style: Theme.of(context).textTheme.titleMedium,
                          children: [
                            TextSpan(
                                text: "Sign Up",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                        color: AppColor.sblue,
                                        fontWeight: FontWeight.bold))
                          ]),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
