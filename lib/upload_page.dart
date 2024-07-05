import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';
import 'result_page.dart';
import 'history_page.dart';
import 'history_manager.dart';
import 'history_entry.dart';

class UploadPage extends StatefulWidget {
  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  File? _image;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _requestCameraPermission();
  }

  Future<void> _requestCameraPermission() async {
    var status = await Permission.camera.status;
    if (!status.isGranted) {
      await Permission.camera.request();
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        _isLoading = true;
      });
      await _uploadImage();
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _uploadImage() async {
    if (_image == null) return;

    var request = http.MultipartRequest(
      'POST',
      Uri.parse('http://82.165.99.39:80/predict'), // Updated to localhost
    );
    request.files.add(await http.MultipartFile.fromPath('image', _image!.path));

    try {
      var response = await request.send();

      if (response.statusCode == 200) {
        var responseBody = await response.stream.bytesToString();

        // Print the response body for debugging
        print('Response body: $responseBody');

        // Save the upload history
        HistoryManager.addEntry(
          HistoryEntry(
            imagePath: _image!.path,
            response: responseBody,
            timestamp: DateTime.now(),
          ),
        );

        var result = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultPage(
              image: _image!,
              result: responseBody,
            ),
          ),
        );

        // Clear the old upload
        setState(() {
          _image = null;
        });
      } else {
        // Handle server error
        var responseBody = await response.stream.bytesToString();
        print('Server error: ${response.statusCode}, response: $responseBody');
        _showErrorDialog('Server error: ${response.statusCode}\n$responseBody');
      }
    } catch (e) {
      // Handle other errors such as network issues
      print('Upload error: $e');
      _showErrorDialog('Upload error: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _viewHistory() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HistoryPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Image'),
        actions: [
          IconButton(
            icon: Icon(Icons.history),
            onPressed: _viewHistory,
          ),
        ],
      ),
      body: Center(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _image == null
                      ? Text(
                          'No image selected.',
                          style: TextStyle(
                            fontSize: 18,
                            color: Theme.of(context).textTheme.bodyLarge!.color,
                          ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(16.0),
                          child: Image.file(_image!),
                        ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => _pickImage(ImageSource.gallery),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 24.0),
                      textStyle: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    child: Text('Upload Image', style: TextStyle(color: Colors.white)),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () => _pickImage(ImageSource.camera),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 24.0),
                      textStyle: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    child: Text('Take Photo', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
            if (_isLoading)
              Container(
                color: Colors.black.withOpacity(0.5),
                child: Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).colorScheme.primary),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
