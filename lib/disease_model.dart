class Disease {
  final String name;
  final String description;
  final String conditions;
  final String mechanicalTreatment;
  final String chemicalTreatment;
  final String source;

  Disease({
    required this.name,
    required this.description,
    required this.conditions,
    required this.mechanicalTreatment,
    required this.chemicalTreatment,
    required this.source,
  });

  factory Disease.fromJson(Map<String, dynamic> json) {
    return Disease(
      name: json['name'],
      description: json['description'],
      conditions: json['conditions'],
      mechanicalTreatment: json['mechanical_treatment'],
      chemicalTreatment: json['chemical_treatment'],
      source: json['source'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'conditions': conditions,
      'mechanical_treatment': mechanicalTreatment,
      'chemical_treatment': chemicalTreatment,
      'source': source,
    };
  }
}
