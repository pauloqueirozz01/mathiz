import 'package:flutter/material.dart';

import 'package:mathiz/models/history_activity.dart';
import 'package:mathiz/services/history_service.dart';

import 'recent_history_item.dart';

class RecentHistorySection extends StatelessWidget {
  const RecentHistorySection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<HistoryActivity> activities = HistoryService.getAll()
        .take(2)
        .toList();

    if (activities.isEmpty) {
      return const SizedBox();
    }

    return Column(
      children: activities
          .map(
            (activity) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: RecentHistoryItem(activity: activity),
            ),
          )
          .toList(),
    );
  }
}
