// data_loader.dart
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'plant_disease.dart';

Future<List<PlantDisease>> loadPlantDiseases() async {
  final response = await rootBundle.loadString('assets/plant_diseases.json');
  final data = json.decode(response) as Map<String, dynamic>;
  return data.values.map((json) => PlantDisease.fromJson(json)).toList();
}

