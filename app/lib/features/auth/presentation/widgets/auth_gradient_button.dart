import 'package:flutter/material.dart';
import '../../../../core/helper/styles.dart';

class AuthGradientButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  const AuthGradientButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: AppStyles.buildLinearGradient(),
        borderRadius: BorderRadius.circular(7),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: AppStyles.buildElevatedButtonStyle(),
        child: Text(buttonText, style: AppStyles.font17WhiteSemiBold),
      ),
    );
  }
}
