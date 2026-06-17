import 'package:flutter/material.dart';

import 'package:mathiz/core/constants/app_spacing.dart';
import 'package:mathiz/core/theme/app_colors.dart';
import 'package:mathiz/core/theme/app_text_styles.dart';

class MatrixHeaderSection extends StatelessWidget {
  const MatrixHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Operações com Matrizes",
          style: AppTextStyles.headlineXL.copyWith(color: AppColors.primary),
        ),

        const SizedBox(height: AppSpacing.sm),

        Text(
          "Realize cálculos matriciais, determinantes e transformações lineares.",
          style: AppTextStyles.bodyMD.copyWith(
            color: AppColors.onSurfaceVariant,
            height: 1.5,
          ),
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
