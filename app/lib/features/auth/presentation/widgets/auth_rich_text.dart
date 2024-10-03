import 'package:flutter/material.dart';
import '../../../../core/helper/styles.dart';

class AuthRichText extends StatelessWidget {
  const AuthRichText({
    super.key,
    this.textLeft,
    this.textRight,
    required this.onTap,
  });
  final String? textLeft;
  final String? textRight;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: RichText(
        text: TextSpan(
          text: textLeft,
          style: Theme.of(context).textTheme.titleMedium,
          children: [
            TextSpan(text: textRight, style: AppStyles.font16Gradient2Bold(context)),
          ],
        ),
      ),
    );
  }
}
