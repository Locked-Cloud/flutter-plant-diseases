import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class LibraryPage extends StatefulWidget {
  @override
  _LibraryPageState createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  late Future<List<Map<String, String>>> _diseases;

  @override
  void initState() {
    super.initState();
    _diseases = _loadDiseases();
  }

  Future<List<Map<String, String>>> _loadDiseases() async {
    try {
      final String response = await rootBundle.loadString('assets/diseases.json');
      print('Raw JSON data: $response'); // Debugging line
      final List<dynamic> data = json.decode(response);
      return data.map((item) => {
        'name': item['name'] as String,
        'description': item['description'] as String,
      }).toList();
    } catch (e) {
      print('Error loading JSON: $e');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Library Page'),
      ),
      body: FutureBuilder<List<Map<String, String>>>(
        future: _diseases,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No data available.'));
          } else {
            final diseases = snapshot.data!;
            return ListView.builder(
              itemCount: diseases.length,
              itemBuilder: (context, index) {
                final disease = diseases[index];
                return ListTile(
                  title: Text(disease['name'] ?? 'No name'),
                  subtitle: Text(disease['description'] ?? 'No description'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
