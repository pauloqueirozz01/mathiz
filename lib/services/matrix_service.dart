class MatrixService {
  static List<List<double>> sum(
    List<List<double>> matrixA,
    List<List<double>> matrixB,
  ) {
    int rows = matrixA.length;
    int cols = matrixA[0].length;

    return List.generate(
      rows,
      (row) =>
          List.generate(cols, (col) => matrixA[row][col] + matrixB[row][col]),
    );
  }

  static List<List<double>> subtract(
    List<List<double>> matrixA,
    List<List<double>> matrixB,
  ) {
    int rows = matrixA.length;
    int cols = matrixA[0].length;

    return List.generate(
      rows,
      (row) =>
          List.generate(cols, (col) => matrixA[row][col] - matrixB[row][col]),
    );
  }

  static List<List<double>> multiply(
    List<List<double>> matrixA,
    List<List<double>> matrixB,
  ) {
    int rowsA = matrixA.length;
    int colsA = matrixA[0].length;
    int colsB = matrixB[0].length;

    List<List<double>> result = List.generate(
      rowsA,
      (_) => List.filled(colsB, 0),
    );

    for (int i = 0; i < rowsA; i++) {
      for (int j = 0; j < colsB; j++) {
        for (int k = 0; k < colsA; k++) {
          result[i][j] += matrixA[i][k] * matrixB[k][j];
        }
      }
    }

    return result;
  }

  //Metodo para validar operação
  static bool canAddOrSubtract(
    List<List<double>> matrixA,
    List<List<double>> matrixB,
  ) {
    return matrixA.length == matrixB.length &&
        matrixA[0].length == matrixB[0].length;
  }

  // Metodo criado para validação de multiplicação
  static bool canMultiply(
    List<List<double>> matrixA,
    List<List<double>> matrixB,
  ) {
    return matrixA[0].length == matrixB.length;
  }
}
