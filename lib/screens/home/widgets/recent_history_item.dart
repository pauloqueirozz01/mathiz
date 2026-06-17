import 'package:flutter/material.dart';

import 'package:mathiz/models/history_activity.dart';
import 'package:mathiz/widgets/academic_card.dart';

class RecentHistoryItem extends StatelessWidget {
  final HistoryActivity activity;

  const RecentHistoryItem({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    return AcademicCard(
      child: ListTile(
        leading: CircleAvatar(
          child: Icon(
            activity.category == "logic" ? Icons.rule : Icons.grid_on,
          ),
        ),

        title: Text(activity.title),

        subtitle: Text(activity.description),

        trailing: SizedBox(
          width: 80,
          child: Text(
            activity.result,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.end,
          ),
        ),
      ),
    );
  }
}
