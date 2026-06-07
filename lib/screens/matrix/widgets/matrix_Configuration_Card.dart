import 'package:flutter/material.dart';
import 'package:mathiz/core/theme/app_text_styles.dart';

class MatrixConfigurationCard extends StatelessWidget {
  final int rows;
  final int cols;

  final VoidCallback onResize;

  final String selectedOperation;

  final Function(String) onOperationChanged;

  const MatrixConfigurationCard({
    super.key,
    required this.rows,
    required this.cols,
    required this.onResize,
    required this.selectedOperation,
    required this.onOperationChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const Text("Dimensões das Matrizes"),

            const SizedBox(height: 16),

            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    style: AppTextStyles.bodyMD,
                    initialValue: rows.toString(),
                    decoration: const InputDecoration(
                      labelText: "Linhas",
                      labelStyle: AppTextStyles.labelMono,
                    ),
                  ),
                ),

                const SizedBox(width: 15),

                Expanded(
                  child: TextFormField(
                    initialValue: cols.toString(),
                    decoration: const InputDecoration(labelText: "Colunas"),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onResize,
                child: const Text("Redimensionar"),
              ),
            ),

            const SizedBox(height: 16),

            Wrap(
              spacing: 8,
              children: [
                ChoiceChip.elevated(
                  label: const Text("Soma"),
                  selected: selectedOperation == "Soma",
                  onSelected: (_) => onOperationChanged("Soma"),
                ),

                ChoiceChip.elevated(
                  label: const Text("Subtração"),
                  selected: selectedOperation == "Subtração",
                  onSelected: (_) => onOperationChanged("Subtração"),
                ),

                ChoiceChip.elevated(
                  label: const Text("Multiplicação"),
                  selected: selectedOperation == "Multiplicação",
                  onSelected: (_) => onOperationChanged("Multiplicação"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
