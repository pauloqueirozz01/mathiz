import 'package:hive_flutter/hive_flutter.dart';

import '../models/history_activity.dart';

class HistoryService {
  static const String boxName = "history";

  static Future<void> save(HistoryActivity activity) async {
    final box = Hive.box(boxName);

    await box.add(activity.toMap());
  }

  static List<HistoryActivity> getAll() {
    final box = Hive.box(boxName);

    return box.values
        .map((item) => HistoryActivity.fromMap(Map<String, dynamic>.from(item)))
        .toList()
        .reversed
        .toList();
  }

  static HistoryActivity? getLastActivity() {
    final activities = getAll();

    if (activities.isEmpty) {
      return null;
    }

    return activities.first;
  }

  static Future<void> clear() async {
    final box = Hive.box(boxName);

    await box.clear();
  }

  static Future<void> deleteAt(int index) async {
    final box = Hive.box(boxName);

    await box.deleteAt(index);
  }

  static Future<void> delete(String id) async {
    final box = Hive.box(boxName);

    final key = box.keys.firstWhere((key) => box.get(key)["id"] == id);

    await box.delete(key);
  }
}
