import 'package:flutter/material.dart';

import 'package:mathiz/models/history_activity.dart';
import 'package:mathiz/services/history_service.dart';

import 'package:mathiz/screens/history/widgets/history_card.dart';
import 'package:mathiz/screens/history/widgets/history_empty_state.dart';
import 'package:mathiz/screens/history/widgets/last_result_section.dart';
import 'package:mathiz/widgets/academic_card.dart';

import 'package:mathiz/widgets/app_bottom_navigation.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List<HistoryActivity> activities = [];

  HistoryActivity? lastActivity;

  @override
  void initState() {
    super.initState();

    loadHistory();
  }

  /// Carrega os dados do Hive
  void loadHistory() {
    setState(() {
      activities = HistoryService.getAll();

      lastActivity = HistoryService.getLastActivity();
    });
  }

  /// Remove uma atividade específica
  Future<void> deleteActivity(String id) async {
    await HistoryService.delete(id);

    loadHistory();
  }

  /// Limpa todo histórico
  Future<void> clearHistory() async {
    await HistoryService.clear();

    loadHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Histórico"),

        actions: [
          IconButton(
            onPressed: clearHistory,
            icon: const Icon(Icons.delete_sweep),
          ),
        ],
      ),

      bottomNavigationBar: const AppBottomNavigation(currentIndex: 3),

      body: activities.isEmpty
          ? const HistoryEmptyState()
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  /// Último Resultado
                  if (lastActivity != null)
                    LastResultSection(activity: lastActivity!),

                  const SizedBox(height: 24),

                  const Text(
                    "Atividades",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 16),

                  /// Lista de histórico
                  ...activities.map(
                    (activity) => HistoryCard(
                      activity: activity,

                      onDelete: () {
                        deleteActivity(activity.id);
                      },

                      onTap: () {
                        _showDetails(activity);
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  /// Card do último resultado
  Widget _buildLastResultSection() {
    return AcademicCard(
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

            Text(lastActivity!.title, style: const TextStyle(fontSize: 18)),

            const SizedBox(height: 8),

            Text(lastActivity!.result),
          ],
        ),
      ),
    );
  }

  /// Modal de detalhes
  void _showDetails(HistoryActivity activity) {
    showModalBottomSheet(
      context: context,

      isScrollControlled: true,

      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(24),

          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              mainAxisSize: MainAxisSize.min,

              children: [
                Text(
                  activity.title,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 16),

                Text("Categoria: ${activity.category}"),

                const SizedBox(height: 8),

                Text("Descrição: ${activity.description}"),

                const SizedBox(height: 8),

                Text("Resultado: ${activity.result}"),

                const SizedBox(height: 8),

                Text("Data: ${activity.createdAt}"),

                const SizedBox(height: 24),
              ],
            ),
          ),
        );
      },
    );
  }
}
