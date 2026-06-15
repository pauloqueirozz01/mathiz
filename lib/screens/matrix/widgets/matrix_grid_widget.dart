import 'package:flutter/material.dart';

class MatrixGridWidget extends StatelessWidget {
  final List<List<double>> matrix;

  final void Function(int row, int col, double value) onValueChanged;

  const MatrixGridWidget({
    super.key,
    required this.matrix,
    required this.onValueChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(matrix.length, (rowIndex) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,

          children: List.generate(matrix[rowIndex].length, (colIndex) {
            return Container(
              width: 60,
              margin: const EdgeInsets.all(4),

              child: TextFormField(
                initialValue: matrix[rowIndex][colIndex].toString(),
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                onChanged: (value) => {
                  onValueChanged(
                    rowIndex,
                    colIndex,
                    double.tryParse(value) ?? 0,
                  ),
                },
              ),
            );
          }),
        );
      }),
    );
  }
}
