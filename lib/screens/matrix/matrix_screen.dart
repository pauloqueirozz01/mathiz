import 'package:flutter/material.dart';
import 'package:mathiz/core/theme/app_text_styles.dart';
import 'package:mathiz/models/matrix_history.dart';
import 'package:mathiz/models/history_activity.dart';
import 'package:mathiz/screens/matrix/widgets/matrix_configuration_card.dart';
import 'package:mathiz/screens/matrix/widgets/matrix_grid_widget.dart';
import 'package:mathiz/services/matrix_service.dart';
import 'package:mathiz/services/history_service.dart';
import "package:mathiz/widgets/app_bottom_navigation.dart";

class MatrixScreen extends StatefulWidget {
  const MatrixScreen({super.key});

  @override
  State<MatrixScreen> createState() => _MatrixScreenState();
}

class _MatrixScreenState extends State<MatrixScreen> {
  /// Quantidade de linhas
  int rows = 3;

  /// Quantidade de colunas
  int cols = 3;

  /// Matrizes de entrada
  List<List<double>> matrixA = [];
  List<List<double>> matrixB = [];

  /// Resultado da operação
  List<List<double>> resultMatrix = [];

  /// Operação selecionada
  String selectedOperation = "";

  @override
  void initState() {
    super.initState();

    /// Gera uma matriz 3x3 ao abrir a tela
    generateMatrices();
  }

  /// Cria novamente as matrizes com o tamanho atual
  void generateMatrices() {
    setState(() {
      matrixA = List.generate(rows, (_) => List.filled(cols, 0));
      matrixB = List.generate(rows, (_) => List.filled(cols, 0));

      resultMatrix = [];
    });
  }

  /// Executa o cálculo escolhido
  Future<void> calculateResult() async {
    print("[$selectedOperation]");

    if (selectedOperation.isEmpty) {
      return;
    }

    // Validando Soma e Subtração
    if ((selectedOperation == "Soma" || selectedOperation == "Subtração") &&
        !MatrixService.canAddOrSubtract(matrixA, matrixB)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("As matrizes precisam ter o mesmo tamanho"),
        ),
      );

      return;
    }

    // Validando Multiplicação
    if (selectedOperation == "Multiplicação" &&
        !MatrixService.canMultiply(matrixA, matrixB)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Número de colunas de A deve ser igual ao número de linhas de B",
          ),
        ),
      );

      return;
    }

    String activityType = "";
    String activityTitle = "";

    setState(() {
      switch (selectedOperation) {
        case "Soma":
          resultMatrix = MatrixService.sum(matrixA, matrixB);

          activityType = "matrix_sum";
          activityTitle = "Soma de Matrizes";
          break;

        case "Subtração":
          resultMatrix = MatrixService.subtract(matrixA, matrixB);

          activityType = "matrix_subtract";
          activityTitle = "Subtração de Matrizes";
          break;

        case "Multiplicação":
          resultMatrix = MatrixService.multiply(matrixA, matrixB);

          activityType = "matrix_multiply";
          activityTitle = "Multiplicação de Matrizes";
          break;
      }

      print(resultMatrix);
    });

    await HistoryService.save(
      HistoryActivity(
        id: DateTime.now().millisecondsSinceEpoch.toString(),

        type: activityType,

        category: "matrix",

        title: activityTitle,

        description: "${matrixA.length}x${matrixA[0].length}",

        result: resultMatrix.toString(),

        createdAt: DateTime.now(),

        metadata: {
          "matrixA": matrixA,
          "matrixB": matrixB,
          "resultMatrix": resultMatrix,
        },
      ),
    );
  }

  /// Limpa todos os valores das matrizes
  void clearMatrices() {
    setState(() {
      matrixA = List.generate(rows, (_) => List.filled(cols, 0));

      matrixB = List.generate(rows, (_) => List.filled(cols, 0));

      resultMatrix = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const AppBottomNavigation(currentIndex: 1),

      appBar: AppBar(title: const Text("Mathiz")),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text("Operações com matrizes", style: AppTextStyles.headlineXL),

            const SizedBox(height: 24),

            /// Card de configuração
            MatrixConfigurationCard(
              rows: rows,
              cols: cols,
              onRowsChanged: (value) {
                setState(() {
                  rows = value;
                });
              },

              onColsChanged: (value) {
                setState(() {
                  cols = value;
                });
              },
              selectedOperation: selectedOperation,

              onResize: generateMatrices,

              onOperationChanged: (operation) {
                setState(() {
                  selectedOperation = operation;
                });
              },
            ),

            const SizedBox(height: 24),

            /// Matrizes
            _buildMatricesArea(),

            const SizedBox(height: 24),

            /// Botões
            _buildActionButtons(),

            const SizedBox(height: 24),

            /// Resultado
            _buildResultMatrix(),
          ],
        ),
      ),
    );
  }

  Widget _buildMatricesArea() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,

      child: Row(
        children: [
          /// MATRIZ A
          MatrixGridWidget(
            matrix: matrixA,

            onValueChanged: (row, col, value) {
              setState(() {
                matrixA[row][col] = value;

                print("A[$row][$col] = $value");
              });
            },
          ),

          const SizedBox(width: 16),

          Icon(
            selectedOperation == "Soma"
                ? Icons.add
                : selectedOperation == "Subtração"
                ? Icons.remove
                : selectedOperation == "Multiplicação"
                ? Icons.close
                : Icons.question_mark,
            size: 32,
          ),

          const SizedBox(width: 16),

          /// MATRIZ B
          MatrixGridWidget(
            matrix: matrixB,

            onValueChanged: (row, col, value) {
              setState(() {
                matrixB[row][col] = value;

                print("B[$row][$col] = $value");
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,

          child: ElevatedButton.icon(
            onPressed: calculateResult,
            icon: const Icon(Icons.calculate),
            label: const Text("Calcular"),
          ),
        ),

        const SizedBox(height: 12),

        SizedBox(
          width: double.infinity,

          child: ElevatedButton.icon(
            onPressed: clearMatrices,
            icon: const Icon(Icons.refresh),
            label: const Text("Limpar"),
          ),
        ),
      ],
    );
  }

  Widget _buildResultMatrix() {
    if (resultMatrix.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      children: [
        const Text(
          "Resultado",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 16),

        MatrixGridWidget(matrix: resultMatrix, onValueChanged: (_, __, ___) {}),
      ],
    );
  }
}
