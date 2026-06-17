import 'package:flutter/material.dart';

import 'package:mathiz/core/constants/app_spacing.dart';
import 'package:mathiz/widgets/academic_card.dart';

class MatrixDimensionCard extends StatelessWidget {
  final int rows;
  final int cols;

  final ValueChanged<int> onRowsChanged;
  final ValueChanged<int> onColsChanged;

  final VoidCallback onGenerate;

  const MatrixDimensionCard({
    super.key,
    required this.rows,
    required this.cols,
    required this.onRowsChanged,
    required this.onColsChanged,
    required this.onGenerate,
  });

  @override
  Widget build(BuildContext context) {
    return AcademicCard(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const Text("Dimensões"),

            const SizedBox(height: AppSpacing.md),

            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<int>(
                    value: rows,
                    decoration: const InputDecoration(labelText: "Linhas"),
                    items: List.generate(
                      3,
                      (index) => DropdownMenuItem(
                        value: index + 1,
                        child: Text("${index + 1}"),
                      ),
                    ),
                    onChanged: (value) {
                      if (value != null) {
                        onRowsChanged(value);
                      }
                    },
                  ),
                ),

                const SizedBox(width: AppSpacing.md),

                Expanded(
                  child: DropdownButtonFormField<int>(
                    value: cols,
                    decoration: const InputDecoration(labelText: "Colunas"),
                    items: List.generate(
                      3,
                      (index) => DropdownMenuItem(
                        value: index + 1,
                        child: Text("${index + 1}"),
                      ),
                    ),
                    onChanged: (value) {
                      if (value != null) {
                        onColsChanged(value);
                      }
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: AppSpacing.md),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onGenerate,
                child: const Text("Gerar Matrizes"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
