import 'package:flutter/material.dart';

import 'package:mathiz/core/constants/app_spacing.dart';
import 'package:mathiz/widgets/academic_card.dart';

class MatrixActionsCard extends StatelessWidget {
  final String selectedOperation;

  final ValueChanged<String> onOperationChanged;

  final VoidCallback onCalculate;

  const MatrixActionsCard({
    super.key,
    required this.selectedOperation,
    required this.onOperationChanged,
    required this.onCalculate,
  });

  @override
  Widget build(BuildContext context) {
    return AcademicCard(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const Text("Operação"),

            const SizedBox(height: AppSpacing.md),

            DropdownButtonFormField<String>(
              value: selectedOperation.isEmpty ? null : selectedOperation,

              decoration: const InputDecoration(labelText: "Selecione"),

              items: const [
                DropdownMenuItem(value: "Soma", child: Text("Soma")),

                DropdownMenuItem(value: "Subtração", child: Text("Subtração")),

                DropdownMenuItem(
                  value: "Multiplicação",
                  child: Text("Multiplicação"),
                ),
              ],

              onChanged: (value) {
                if (value != null) {
                  onOperationChanged(value);
                }
              },
            ),

            const SizedBox(height: AppSpacing.md),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: onCalculate,
                icon: const Icon(Icons.calculate),
                label: const Text("Calcular"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
