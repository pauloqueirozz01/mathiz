class MatrixHistory {
  final String operation;

  final List<List<double>> matrixA;

  final List<List<double>> matrixB;

  final List<List<double>> result;

  final DateTime createdAt;

  MatrixHistory({
    required this.operation,
    required this.matrixA,
    required this.matrixB,
    required this.result,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      "operation": operation,
      "matrixA": matrixA,
      "matrixB": matrixB,
      "result": result,
      "createdAt": createdAt.toIso8601String(),
    };
  }

  factory MatrixHistory.fromMap(Map map) {
    return MatrixHistory(
      operation: map["operation"],
      matrixA: List<List<double>>.from(
        map["matrixA"].map((row) => List<double>.from(row)),
      ),
      matrixB: List<List<double>>.from(
        map["matrixB"].map((row) => List<double>.from(row)),
      ),
      result: List<List<double>>.from(
        map["result"].map((row) => List<double>.from(row)),
      ),
      createdAt: DateTime.parse(map["createdAt"]),
    );
  }
}
