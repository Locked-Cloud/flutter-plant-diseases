// disease_provider.dart
import 'package:flutter/material.dart';
import 'disease_service.dart';
import 'disease_model.dart';

class DiseaseProvider with ChangeNotifier {
  List<Disease> _diseases = [];
  bool _isLoading = true;

  List<Disease> get diseases => _diseases;
  bool get isLoading => _isLoading;

  DiseaseProvider() {
    fetchDiseases();
  }

  Future<void> fetchDiseases() async {
    _isLoading = true;
    notifyListeners();
    print('Fetching diseases...');
    try {
      _diseases = await DiseaseService.fetchDiseases();
      print('Diseases fetched: ${_diseases.length}');
    } catch (e) {
      print('Error fetching diseases: $e');
    }
    _isLoading = false;
    notifyListeners();
  }
}
