import 'package:budgeting_app/core/theme/theme.dart';
import 'package:budgeting_app/features/authentication/presentation/pages/enter_passcode_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.primaryTheme,
      home: const EnterPasscodePage(),
    );
  }
}
