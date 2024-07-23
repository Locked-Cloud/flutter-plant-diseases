// library_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'disease_provider.dart';

class LibraryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DiseaseProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Disease Library'),
        ),
        body: Consumer<DiseaseProvider>(
          builder: (context, provider, child) {
            if (provider.isLoading) {
              print('Loading data...');
              return Center(child: CircularProgressIndicator());
            } else {
              print('Data loaded, building list view...');
              return ListView.builder(
                itemCount: provider.diseases.length,
                itemBuilder: (context, index) {
                  final disease = provider.diseases[index];
                  return ListTile(
                    title: Text(disease.name),
                    subtitle: Text(disease.description),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
