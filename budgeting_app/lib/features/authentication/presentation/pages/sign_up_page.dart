import 'package:budgeting_app/core/theme/app_colors.dart';
import 'package:budgeting_app/features/authentication/presentation/pages/sign_in_page.dart';
import 'package:budgeting_app/features/authentication/presentation/widgets/authentication_textfield.dart';
import 'package:budgeting_app/features/authentication/presentation/widgets/authetication_button.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const SignUpPage());
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmationController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    passwordConfirmationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Create an Account.",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                height: 75,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: (MediaQuery.sizeOf(context).width - (16 + 15)) / 2,
                      child: AuthenticationTextfield(
                        hintText: "First Name",
                        obscure: false,
                        controller: firstNameController,
                      ),
                    ),
                    const SizedBox(width: 15),
                    SizedBox(
                      width: (MediaQuery.sizeOf(context).width - (16 + 15)) / 2,
                      child: AuthenticationTextfield(
                        hintText: "Last Name",
                        obscure: false,
                        controller: lastNameController,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 5),
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
              const SizedBox(height: 10),
              AuthenticationTextfield(
                hintText: "Re-enter Password",
                obscure: true,
                controller: passwordConfirmationController,
              ),
              const SizedBox(height: 20),
              const AuthenticationButton(
                buttonText: "Sign Up",
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, SignInPage.route());
                },
                child: RichText(
                  text: TextSpan(
                      text: 'Already have an Account? ',
                      style: Theme.of(context).textTheme.titleMedium,
                      children: [
                        TextSpan(
                            text: "Sign In",
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
        ),
      ),
    );
  }
}
