import 'dart:convert';

class HistoryEntry {
  final String imagePath;
  final String response;
  final DateTime timestamp;

  HistoryEntry({
    required this.imagePath,
    required this.response,
    required this.timestamp,
  });

  factory HistoryEntry.fromJson(Map<String, dynamic> json) {
    return HistoryEntry(
      imagePath: json['imagePath'],
      response: json['response'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'imagePath': imagePath,
      'response': response,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}
