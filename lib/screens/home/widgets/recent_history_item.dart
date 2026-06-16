import 'package:flutter/material.dart';

import 'package:mathiz/models/history_activity.dart';

class RecentHistoryItem extends StatelessWidget {
  final HistoryActivity activity;

  const RecentHistoryItem({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          child: Icon(
            activity.category == "logic" ? Icons.rule : Icons.grid_on,
          ),
        ),

        title: Text(activity.title),

        subtitle: Text(activity.description),

        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),

          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),

          child: Text(activity.result),
        ),
      ),
    );
  }
}
