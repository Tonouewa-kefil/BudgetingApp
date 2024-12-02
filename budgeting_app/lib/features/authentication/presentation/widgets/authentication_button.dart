import 'package:budgeting_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AuthenticationButton extends StatelessWidget {
  final String buttonText;
  const AuthenticationButton({super.key, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: const LinearGradient(
              colors: [AppColor.blue, AppColor.sblue],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight),
          borderRadius: BorderRadius.circular(10)),
      child: ElevatedButton(
        onPressed: () => {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          fixedSize: const Size(390, 50),
        ),
        child: Text(
          buttonText,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
