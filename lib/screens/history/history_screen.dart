import 'package:flutter/material.dart';
import 'package:mathiz/models/history_activity.dart';
import 'package:mathiz/services/history_service.dart';
import 'package:mathiz/widgets/app_bottom_navigation.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List<HistoryActivity> activities = [];

  @override
  void initState() {
    super.initState();
    loadHistory();
  }

  /// Carrega os registros do Hive
  void loadHistory() {
    setState(() {
      activities = HistoryService.getAll();
    });
  }

  /// Limpa todo o histórico
  Future<void> clearHistory() async {
    await HistoryService.clear();

    loadHistory();
  }

  /// Remove um item específico
  Future<void> deleteActivity(String id) async {
    await HistoryService.delete(id);

    loadHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const AppBottomNavigation(currentIndex: 3),
      appBar: AppBar(
        title: const Text("Histórico"),

        actions: [
          IconButton(
            icon: const Icon(Icons.delete_sweep),

            onPressed: () async {
              await clearHistory();
            },
          ),
        ],
      ),

      body: activities.isEmpty
          ? const Center(
              child: Text(
                "Nenhuma atividade registrada",
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),

              itemCount: activities.length,

              itemBuilder: (context, index) {
                final activity = activities[index];

                return Card(
                  margin: const EdgeInsets.only(bottom: 12),

                  child: ListTile(
                    leading: const Icon(Icons.history),

                    title: Text(activity.title),

                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        const SizedBox(height: 4),

                        Text(activity.description),

                        const SizedBox(height: 4),

                        Text(
                          activity.result,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),

                    trailing: IconButton(
                      icon: const Icon(Icons.delete),

                      onPressed: () async {
                        await deleteActivity(activity.id);
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}
