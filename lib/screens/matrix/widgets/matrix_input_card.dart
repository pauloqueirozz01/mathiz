import 'package:flutter/material.dart';

import 'package:mathiz/core/constants/app_spacing.dart';
import 'package:mathiz/core/theme/app_text_styles.dart';
import 'package:mathiz/core/theme/app_colors.dart';
import 'package:mathiz/widgets/academic_card.dart';

class MatrixInputCard extends StatelessWidget {
  final String title;
  final Widget child;

  const MatrixInputCard({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return AcademicCard(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppTextStyles.headlineLG.copyWith(
                color: AppColors.primary,
              ),
            ),

            const SizedBox(height: AppSpacing.md),

            child,
          ],
        ),
      ),
    );
  }
}
