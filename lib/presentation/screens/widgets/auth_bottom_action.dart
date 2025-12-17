import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/theme/app_text_styles.dart';

class AuthBottomAction extends StatelessWidget {
  final VoidCallback onPresed;
  final String questionText;
  final String actionText;
  const AuthBottomAction({
    super.key,
    required this.onPresed,
    required this.questionText,
    required this.actionText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(questionText, style: AppTextStyles.bodyLarge),
        SizedBox(width: 5),
        GestureDetector(
          onTap: onPresed,
          child: Text(
            actionText,
            style: AppTextStyles.headlineSmall.copyWith(
              height: 1.5,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
