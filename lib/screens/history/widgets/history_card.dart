import 'package:flutter/material.dart';
import 'package:mathiz/models/history_activity.dart';
import 'package:mathiz/widgets/academic_card.dart';

class HistoryCard extends StatelessWidget {
  final HistoryActivity activity;

  final VoidCallback? onDelete;
  final VoidCallback? onTap;

  const HistoryCard({
    super.key,
    required this.activity,
    this.onDelete,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AcademicCard(
      child: InkWell(
        onTap: onTap,

        borderRadius: BorderRadius.circular(12),

        child: Padding(
          padding: const EdgeInsets.all(16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              /// Cabeçalho
              Row(
                children: [
                  _buildCategoryIcon(),

                  const SizedBox(width: 8),

                  Expanded(
                    child: Text(
                      activity.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  IconButton(
                    onPressed: onDelete,
                    icon: const Icon(Icons.delete_outline),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              /// Descrição
              Text(
                activity.description,
                style: const TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 12),

              /// Resultado
              Text(
                activity.result,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),

              const SizedBox(height: 16),

              /// Rodapé
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Chip(label: Text(activity.category)),

                  Text(
                    _formatDate(activity.createdAt),
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryIcon() {
    switch (activity.category) {
      case "matrix":
        return const Icon(Icons.grid_on);

      case "logic":
        return const Icon(Icons.rule);

      case "equation":
        return const Icon(Icons.functions);

      default:
        return const Icon(Icons.history);
    }
  }

  String _formatDate(DateTime date) {
    return "${date.day}/${date.month}/${date.year}";
  }
}
