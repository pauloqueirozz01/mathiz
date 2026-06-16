import 'package:flutter/material.dart';
import 'package:mathiz/models/history_activity.dart';

class LastResultSection extends StatelessWidget {
  final HistoryActivity activity;

  const LastResultSection({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const Text(
              "Último Resultado",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            Text(activity.title, style: const TextStyle(fontSize: 18)),

            const SizedBox(height: 8),

            Text(activity.result),
          ],
        ),
      ),
    );
  }
}
