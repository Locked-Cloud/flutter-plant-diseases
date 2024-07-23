// disease_model.dart
class Disease {
  final String name;
  final String description;

  Disease({required this.name, required this.description});

  factory Disease.fromJson(Map<String, dynamic> json) {
    return Disease(
      name: json['name'],
      description: json['description'],
    );
  }
}
