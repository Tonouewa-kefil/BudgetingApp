import 'package:budgeting_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static _border([Color color = AppColor.blue]) => OutlineInputBorder(
      borderSide: BorderSide(color: color, width: 3),
      borderRadius: BorderRadius.circular(8));
  static final primaryTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppColor.black,
    appBarTheme: const AppBarTheme(backgroundColor: AppColor.black),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(20),
      enabledBorder: _border(),
      focusedBorder: _border(AppColor.sblue),
    ),
  );
}
