import 'package:flutter/material.dart';

import 'package:mathiz/core/constants/app_spacing.dart';
import 'package:mathiz/core/theme/app_colors.dart';
import 'package:mathiz/core/theme/app_text_styles.dart';

class MatrixResultCard extends StatelessWidget {
  final List<List<double>> matrix;

  final String operation;

  const MatrixResultCard({
    super.key,
    required this.matrix,
    required this.operation,
  });

  @override
  Widget build(BuildContext context) {
    if (matrix.isEmpty) {
      return const SizedBox();
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(
              operation,
              style: AppTextStyles.headlineLG.copyWith(
                color: AppColors.primary,
              ),
            ),

            const SizedBox(height: AppSpacing.lg),

            Center(
              child: Column(
                children: matrix.map((row) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: row.map((value) {
                        return SizedBox(
                          width: 70,
                          child: Text(
                            value.toStringAsFixed(0),
                            textAlign: TextAlign.center,
                          ),
                        );
                      }).toList(),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
