import 'package:flutter/material.dart';

class HistoryEmptyState extends StatelessWidget {
  const HistoryEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Icon(Icons.history, size: 80),

          SizedBox(height: 16),

          Text(
            "Nenhuma atividade registrada",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          SizedBox(height: 8),

          Text("Utilize as ferramentas do Mathiz para começar"),
        ],
      ),
    );
  }
}
