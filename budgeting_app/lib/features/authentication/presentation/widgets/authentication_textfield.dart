import 'package:flutter/material.dart';

class AuthenticationTextfield extends StatelessWidget {
  final String hintText;
  final bool obscure;
  final TextEditingController controller;
  const AuthenticationTextfield(
      {super.key,
      required this.hintText,
      required this.obscure,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(hintText: hintText),
      obscureText: obscure,
      validator: (value) {
        if (value!.isEmpty) {
          return "$hintText is missing";
        } else {
          return null;
        }
      },
    );
  }
}
