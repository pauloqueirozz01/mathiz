import 'package:flutter/material.dart';

import 'package:mathiz/core/theme/app_colors.dart';
import 'package:mathiz/core/theme/app_text_styles.dart';

class WelcomeSection extends StatelessWidget {
  const WelcomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Bem-vindo de volta", style: AppTextStyles.bodyMD),

        SizedBox(height: 4),

        Text("Olá, acadêmico", style: AppTextStyles.headlineXL),

        SizedBox(height: 8),
        Container(
          width: 48,
          height: 4,
          decoration: const BoxDecoration(
            color: AppColors.tertiary,
            borderRadius: BorderRadius.all(Radius.circular(999)),
          ),
        ),
      ],
    );
  }
}
