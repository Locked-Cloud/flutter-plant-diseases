import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'history_entry.dart';

class HistoryManager {
  static const String _historyKey = 'history';

  static Future<List<HistoryEntry>> getHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? historyStringList = prefs.getStringList(_historyKey);
    if (historyStringList == null || historyStringList.isEmpty) {
      return [];
    }

    List<HistoryEntry> historyEntries = [];

    for (String jsonString in historyStringList) {
      try {
        Map<String, dynamic> json = jsonDecode(jsonString);
        historyEntries.add(HistoryEntry.fromJson(json));
      } catch (e) {
        print('Error decoding JSON: $e');
        // Handle invalid JSON gracefully, such as skipping or logging the error
      }
    }

    return historyEntries;
  }

  static Future<void> addEntry(HistoryEntry entry) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> historyStringList = prefs.getStringList(_historyKey) ?? [];
    historyStringList.add(jsonEncode(entry.toJson()));
    await prefs.setStringList(_historyKey, historyStringList);
  }

  static Future<void> clearHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_historyKey);
  }
}
