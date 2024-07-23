// disease_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'disease_model.dart';

class DiseaseService {
  static Future<List<Disease>> fetchDiseases() async {
    final url = 'https://firebasestorage.googleapis.com/v0/b/json-file-data.appspot.com/o/diseases.json?alt=media&token=74ddadc0-30f3-4c5b-8561-7d29ac8fc025';
    print('Fetching data from: $url');

    final response = await http.get(Uri.parse(url));
    print('Response status: ${response.statusCode}');

    if (response.statusCode == 200) {
      print('Response body: ${response.body}');
      List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => Disease.fromJson(item)).toList();
    } else {
      print('Failed to load diseases');
      throw Exception('Failed to load diseases');
    }
  }
}
