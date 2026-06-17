import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MatrixGridWidget extends StatelessWidget {
  final List<List<double>> matrix;

  final void Function(int row, int col, double value) onValueChanged;

  /// Define se os campos podem ser editados
  final bool readOnly;

  const MatrixGridWidget({
    super.key,
    required this.matrix,
    required this.onValueChanged,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    // Evita erro caso a matriz ainda não tenha sido gerada
    if (matrix.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      children: List.generate(matrix.length, (rowIndex) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(matrix[rowIndex].length, (colIndex) {
            return Container(
              width: 60,
              margin: const EdgeInsets.all(4),

              child: TextFormField(
                initialValue: matrix[rowIndex][colIndex] == 0
                    ? ''
                    : matrix[rowIndex][colIndex].toString(),

                readOnly: readOnly,

                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                  signed: true,
                ),

                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[-0-9.]')),
                ],

                textAlign: TextAlign.center,

                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 12),
                  border: OutlineInputBorder(),
                ),

                onChanged: (value) {
                  if (value.trim().isEmpty) {
                    onValueChanged(rowIndex, colIndex, 0);
                    return;
                  }

                  final parsed = double.tryParse(value);

                  if (parsed == null) return;

                  onValueChanged(rowIndex, colIndex, parsed);
                },
              ),
            );
          }),
        );
      }),
    );
  }
}
