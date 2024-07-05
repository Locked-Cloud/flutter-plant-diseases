import 'package:flutter/material.dart';
import 'dart:io';  // Import dart:io for File handling
import 'history_manager.dart';
import 'history_entry.dart';
import 'detail_page.dart';
import 'package:intl/intl.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload History'),
        backgroundColor: Colors.teal,
      ),
      body: FutureBuilder<List<HistoryEntry>>(
        future: HistoryManager.getHistory(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading history'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No history available'));
          } else {
            List<HistoryEntry> historyEntries = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: historyEntries.length,
                itemBuilder: (context, index) {
                  HistoryEntry entry = historyEntries[index];
                  String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(entry.timestamp);

                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(10.0),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.file(
                          File(entry.imagePath),
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        'Uploaded at: $formattedDate',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'Tap to view details',
                        style: TextStyle(color: Colors.grey),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPage(
                              image: File(entry.imagePath),  // Convert imagePath to File
                              result: entry.response,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
