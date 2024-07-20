import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'result_page.dart';
import 'history_page.dart';
import 'history_manager.dart';
import 'history_entry.dart';
import 'about_us_page.dart'; 
import 'library_page.dart'; // Import the LibraryPage

class UploadPage extends StatefulWidget {
  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  File? _image;
  bool _isLoading = false;
  bool _isOnline = false;
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    _requestCameraPermission();
    _checkConnectivity();
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  Future<void> _requestCameraPermission() async {
    var status = await Permission.camera.status;
    if (!status.isGranted) {
      await Permission.camera.request();
    }
  }

  Future<void> _checkConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    setState(() {
      _isOnline = connectivityResult != ConnectivityResult.none;
    });

    _connectivitySubscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      setState(() {
        _isOnline = result != ConnectivityResult.none;
      });
    });
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
      Uri.parse('http://82.165.99.39:80/predict'),
    );
    request.files.add(await http.MultipartFile.fromPath('image', _image!.path));

    try {
      var response = await request.send();

      if (response.statusCode == 200) {
        var responseBody = await response.stream.bytesToString();

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

        setState(() {
          _image = null;
        });
      } else {
        var responseBody = await response.stream.bytesToString();
        _showErrorDialog('Server error: ${response.statusCode}\n$responseBody');
      }
    } catch (e) {
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

  void _viewAboutUs() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AboutUsPage(),
      ),
    );
  }

  void _viewLibrary() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LibraryPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.history),
            onPressed: _viewHistory,
          ),
        ],
      ),
      body: Center(
        child: _isLoading
            ? Container(
                color: Colors.white,
                child: Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                        Theme.of(context).colorScheme.primary),
                  ),
                ),
              )
            : SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _image == null
                        ? _buildPlaceholder(context)
                        : _buildImageCard(context),
                    SizedBox(height: 20),
                    _buildAnimatedButton(
                      context,
                      icon: Icons.upload_file,
                      label: 'Upload Image',
                      onPressed: () => _pickImage(ImageSource.gallery),
                    ),
                    SizedBox(height: 10),
                    _buildAnimatedButton(
                      context,
                      icon: Icons.camera_alt,
                      label: 'Take Photo',
                      onPressed: () => _pickImage(ImageSource.camera),
                    ),
                    SizedBox(height: 10),
                    _buildAnimatedButton(
                      context,
                      icon: Icons.info,
                      label: 'About Us',
                      onPressed: _viewAboutUs,
                    ),
                    SizedBox(height: 10),
                    _buildAnimatedButton(
                      context,
                      icon: Icons.library_books,
                      label: 'Library',
                      onPressed: _viewLibrary,
                    ),
                    SizedBox(height: 20),
                    _buildConnectivityStatus(),
                  ],
                ),
              ),
      ),
    );
  }

  Widget _buildPlaceholder(BuildContext context) {
    return Container(
      height: 150,
      width: 300,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Center(
        child: Text(
          'No image selected.',
          style: TextStyle(
            fontSize: 18,
            color: Theme.of(context).textTheme.bodyLarge?.color,
          ),
        ),
      ),
    );
  }

  Widget _buildImageCard(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 4.0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Image.file(
          _image!,
          fit: BoxFit.cover,
          height: 200,
          width: double.infinity,
        ),
      ),
    );
  }

  Widget _buildAnimatedButton(BuildContext context,
      {required IconData icon,
      required String label,
      required VoidCallback onPressed}) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: Colors.white),
      label: Text(label, style: TextStyle(color: Colors.white)),
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 24.0),
        textStyle: TextStyle(fontSize: 16),
      ),
    ).animate().slideX(duration: 600.ms);
  }

  Widget _buildConnectivityStatus() {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: _isOnline ? Colors.green : Colors.red,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            _isOnline ? Icons.check_circle : Icons.error,
            color: Colors.white,
          ),
          SizedBox(width: 8),
          Text(
            _isOnline ? 'Online' : 'Offline',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
