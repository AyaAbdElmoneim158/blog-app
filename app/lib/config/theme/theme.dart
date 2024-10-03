import 'package:flutter/material.dart';
import 'app_pallette.dart';

class AppTheme {
  static final darkThemeMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppPallette.backgroundColor,
    appBarTheme: buildAppBarTheme(),
    chipTheme: buildChipTheme(),
    inputDecorationTheme: buildInputDecorationTheme(),
  );

  static AppBarTheme buildAppBarTheme() {
    return const AppBarTheme(
      backgroundColor: AppPallette.backgroundColor,
    );
  }

  static InputDecorationTheme buildInputDecorationTheme() {
    return InputDecorationTheme(
      contentPadding: const EdgeInsets.all(27),
      border: _border(),
      enabledBorder: _border(),
      focusedBorder: _border(AppPallette.gradient2),
      errorBorder: _border(AppPallette.errorColor),
    );
  }

  static ChipThemeData buildChipTheme() {
    return const ChipThemeData(
      color: WidgetStatePropertyAll(
        AppPallette.backgroundColor,
      ),
      side: BorderSide.none,
    );
  }

  static _border([Color color = AppPallette.borderColor]) => OutlineInputBorder(
        borderSide: BorderSide(
          color: color,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(10),
      );
}
