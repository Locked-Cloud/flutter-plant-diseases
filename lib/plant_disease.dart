// plant_disease.dart
class PlantDisease {
  final String name;
  final String description;
  final String conditions;
  final String mechanicalTreatment;
  final String chemicalTreatment;
  final String source;

  PlantDisease({
    required this.name,
    required this.description,
    required this.conditions,
    required this.mechanicalTreatment,
    required this.chemicalTreatment,
    required this.source,
  });

  factory PlantDisease.fromJson(Map<String, dynamic> json) {
    return PlantDisease(
      name: json['name'],
      description: json['description'],
      conditions: json['conditions'],
      mechanicalTreatment: json['mechanical_treatment'],
      chemicalTreatment: json['chemical_treatment'],
      source: json['source'],
    );
  }
}
