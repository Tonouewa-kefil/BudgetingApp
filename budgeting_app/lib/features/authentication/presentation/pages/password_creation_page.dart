import 'package:budgeting_app/features/authentication/presentation/widgets/authentication_textfield.dart';
import 'package:budgeting_app/features/authentication/presentation/widgets/authetication_button.dart';
import 'package:flutter/material.dart';

class PasswordCreationPage extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const PasswordCreationPage());

  const PasswordCreationPage({super.key});

  @override
  State<PasswordCreationPage> createState() => _PasswordCreationPageState();
}

class _PasswordCreationPageState extends State<PasswordCreationPage> {
  final passwordController = TextEditingController();
  final secondpasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    passwordController.dispose();
    secondpasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Create a New Password.",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 50,
              ),
              const SizedBox(height: 10),
              AuthenticationTextfield(
                hintText: "New Password",
                obscure: true,
                controller: passwordController,
              ),
              const SizedBox(height: 10),
              AuthenticationTextfield(
                hintText: "Re-enter New Password",
                obscure: true,
                controller: passwordController,
              ),
              const SizedBox(height: 20),
              AuthenticationButton(
                buttonText: "Submit",
                onPressed: () {},
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
