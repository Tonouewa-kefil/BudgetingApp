import 'package:budgeting_app/features/authentication/presentation/widgets/authentication_textfield.dart';
import 'package:budgeting_app/features/authentication/presentation/widgets/authetication_button.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const ForgotPasswordPage());

  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
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
                "Forgot Password?",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "Enter the email associated with your account and we will send you an email with a passcode to reset your password.",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 50),
              AuthenticationTextfield(
                hintText: "Email",
                obscure: false,
                controller: emailController,
              ),
              const SizedBox(
                height: 20,
              ),
              AuthenticationButton(
                  buttonText: "Reset Password", onPressd: () {}),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
