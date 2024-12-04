import 'package:budgeting_app/features/authentication/presentation/widgets/authentication_textfield.dart';
import 'package:budgeting_app/features/authentication/presentation/widgets/authetication_button.dart';
import 'package:flutter/material.dart';

class EnterPasscodePage extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const EnterPasscodePage());

  const EnterPasscodePage({super.key});

  @override
  State<EnterPasscodePage> createState() => _EnterPasscodePageState();
}

class _EnterPasscodePageState extends State<EnterPasscodePage> {
  final passcodeController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    passcodeController.dispose();
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
                "Password Reset.",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 10),
              const Text("Enter the Passcode that was sent to your email."),
              const SizedBox(
                height: 50,
              ),
              const SizedBox(height: 10),
              AuthenticationTextfield(
                hintText: "Enter Passcode",
                obscure: false,
                controller: passcodeController,
              ),
              const SizedBox(height: 20),
              AuthenticationButton(
                buttonText: "Submit",
                onPressd: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
