import 'package:flutter/material.dart';

import '../../config/theme/app_pallette.dart';

class AppStyles {
  AppStyles._();

  static TextStyle font17WhiteSemiBold = const TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w600,
  );

  static TextStyle font50WhiteBold = const TextStyle(
    fontSize: 50,
    fontWeight: FontWeight.bold,
  );
  static TextStyle? font16Gradient2Bold(context) => Theme.of(context).textTheme.titleMedium?.copyWith(
        color: AppPallette.gradient2,
        fontWeight: FontWeight.bold,
      );

  static ButtonStyle buildElevatedButtonStyle() {
    return ElevatedButton.styleFrom(
      fixedSize: const Size(395, 55),
      backgroundColor: AppPallette.transparentColor,
      shadowColor: AppPallette.transparentColor,
    );
  }

  static LinearGradient buildLinearGradient() {
    return const LinearGradient(
      colors: [
        AppPallette.gradient1,
        AppPallette.gradient2,
        // AppPallette.gradient3,
      ],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
    );
  }
}
