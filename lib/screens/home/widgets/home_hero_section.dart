import 'package:flutter/material.dart';

import 'package:mathiz/core/constants/app_spacing.dart';
import 'package:mathiz/core/theme/app_colors.dart';
import 'package:mathiz/core/theme/app_text_styles.dart';

class HomeHeroSection extends StatelessWidget {
  const HomeHeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Bem-vindo de volta,", style: AppTextStyles.bodyMD),

        const SizedBox(height: AppSpacing.sm),

        Text(
          "Olá, Acadêmico.",
          style: AppTextStyles.headlineXL.copyWith(color: AppColors.primary),
        ),

        const SizedBox(height: AppSpacing.md),

        Container(
          width: 64,
          height: 4,
          decoration: BoxDecoration(
            color: AppColors.tertiary,
            borderRadius: BorderRadius.circular(999),
          ),
        ),
      ],
    );
  }
}
