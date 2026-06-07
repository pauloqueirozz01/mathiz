import 'package:flutter/material.dart';
import 'package:mathiz/core/theme/app_colors.dart';
import 'package:mathiz/core/theme/app_text_styles.dart';

class MatrixScreen extends StatefulWidget {
  const MatrixScreen({super.key});

  @override
  State<MatrixScreen> createState() => _MatrixScreenState();
}

class _MatrixScreenState extends State<MatrixScreen> {
  int rows = 3;
  int cols = 3;

  List<List<double>> matrixA = [];
  List<List<double>> matrixB = [];
  void generateMatrices() {
    setState(() {
      matrixA = List.generate(rows, (_) => List.filled(cols, 0));
      matrixB = List.generate(cols, (_) => List.filled(cols, 0));
    });
  }

  List<String> operations = <String>["Soma", "Subtrair", "Multiplicar"];
  String selectedOperation = "";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: const Text("Mathiz")),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Operações com matrizes", style: AppTextStyles.headlineXL),

            const SizedBox(height: 24),

            _buildConfigurationCard(),

            const SizedBox(height: 24),

            _buildMatricesArea(),

            const SizedBox(height: 24),

            _buildActionButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildConfigurationCard() {
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

            _buildSelectorOperation(),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectorOperation() {
    return Wrap(
      spacing: 8,

      children: [
        ChoiceChip.elevated(
          label: Text("Soma"),
          selected: selectedOperation == "Somar",

          onSelected: (_) => {
            setState(() {
              selectedOperation = "Soma";
            }),
          },
        ),

        ChoiceChip.elevated(
          label: Text("Subtração"),
          selected: selectedOperation == "Subtrair",

          onSelected: (_) => {
            setState(() {
              selectedOperation = "Subtração";
            }),
          },
        ),

        ChoiceChip.elevated(
          label: Text("Multiplicação"),
          selected: selectedOperation == "Multiplicar",

          onSelected: (value) => {
            setState(() {
              selectedOperation = "Multiplicação";
            }),
          },
        ),
      ],
    );
  }

  Widget _buildMatricesArea() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

      children: [
        Column(
          children: [
            const Text("A"),
            const SizedBox(height: 16),

            Container(width: 120, height: 120, color: AppColors.secondary),
          ],
        ),
        Icon(
          selectedOperation == "Soma"
              ? Icons.add
              : selectedOperation == "Subtração"
              ? Icons.remove
              : Icons.close,
        ),

        Column(
          children: [
            const Text("B"),
            const SizedBox(height: 16),

            Container(width: 120, height: 120, color: AppColors.secondary),
          ],
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,

          child: ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.calculate),
            label: const Text("Calcular"),
          ),
        ),

        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.refresh),
            label: const Text("Limpar"),
          ),
        ),
      ],
    );
  }
}
