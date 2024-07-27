// library_page.dart

import 'package:flutter/material.dart';
import 'disease_model.dart';
import 'plant_diseases.dart'; // Import the plant_diseases.dart file
import 'package:url_launcher/url_launcher.dart';

class LibraryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Disease Library'),
      ),
      body: ListView.builder(
        itemCount: diseases.length, // Use the diseases list from plant_diseases.dart
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(diseases[index].name),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DiseaseDetailPage(disease: diseases[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class DiseaseDetailPage extends StatelessWidget {
  final Disease disease;

  DiseaseDetailPage({required this.disease});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(disease.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Description:', style: TextStyle(fontWeight: FontWeight.bold)),
              Text(disease.description),
              SizedBox(height: 8.0),
              Text('Conditions:', style: TextStyle(fontWeight: FontWeight.bold)),
              Text(disease.conditions),
              SizedBox(height: 8.0),
              Text('Mechanical Treatment:', style: TextStyle(fontWeight: FontWeight.bold)),
              Text(disease.mechanicalTreatment),
              SizedBox(height: 8.0),
              Text('Chemical Treatment:', style: TextStyle(fontWeight: FontWeight.bold)),
              Text(disease.chemicalTreatment),
              SizedBox(height: 8.0),
              Text('Source:', style: TextStyle(fontWeight: FontWeight.bold)),
              InkWell(
                onTap: () {
                  _launchURL(disease.source);
                },
                child: Text(
                  disease.source,
                  style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
