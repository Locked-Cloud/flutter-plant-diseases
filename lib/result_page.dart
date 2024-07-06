import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:translator/translator.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'webview_page.dart';

const Color primaryColor = Colors.teal;
const Color textColor = Colors.black;
const Color diseaseNameColor = Colors.red;

class ResultPage extends StatefulWidget {
  final File image;
  final String result;

  const ResultPage({Key? key, required this.image, required this.result}) : super(key: key);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  bool _isEnglish = true;
  late Map<String, dynamic> _jsonResponse;
  bool _isLoading = false;
  final translator = GoogleTranslator();

  @override
  void initState() {
    super.initState();
    _jsonResponse = jsonDecode(widget.result);
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  Future<String> _translateText(String text, String targetLanguage) async {
    final translation = await translator.translate(text, to: targetLanguage);
    return translation.text;
  }

  Future<void> _toggleLanguage() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final String targetLanguage = _isEnglish ? 'ar' : 'en';

      _jsonResponse['disease']['name'] =
          await _translateText(_jsonResponse['disease']['name'], targetLanguage);
      _jsonResponse['disease']['description'] =
          await _translateText(_jsonResponse['disease']['description'], targetLanguage);
      _jsonResponse['disease']['conditions'] =
          await _translateText(_jsonResponse['disease']['conditions'], targetLanguage);
      _jsonResponse['disease']['mechanical_treatment'] =
          await _translateText(_jsonResponse['disease']['mechanical_treatment'], targetLanguage);
      _jsonResponse['disease']['chemical_treatment'] =
          await _translateText(_jsonResponse['disease']['chemical_treatment'], targetLanguage);
      _jsonResponse['disease']['source'] =
          await _translateText(_jsonResponse['disease']['source'], targetLanguage);

      setState(() {
        _isEnglish = !_isEnglish;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Exception: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final double confidence = _jsonResponse['confidence'] ?? 0.0;
    final Map<String, dynamic> disease = _jsonResponse['disease'] ?? {};
    final String name = disease['name'] ?? 'Unknown';
    final String description = disease['description'] ?? 'No description available';
    final String conditions = disease['conditions'] ?? 'No conditions specified';
    final String chemicalTreatment = disease['chemical_treatment'] ?? 'No chemical treatment specified';
    final String mechanicalTreatment = disease['mechanical_treatment'] ?? 'No mechanical treatment specified';
    final String source = disease['source'] ?? '';

    return Scaffold(
      appBar: AppBar(
        title: Text(_isEnglish ? 'Result' : 'نتيجة'),
        backgroundColor: primaryColor,
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Directionality(
              textDirection: _isEnglish ? TextDirection.ltr : TextDirection.rtl,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _isEnglish ? 'Uploaded Image:' : 'الصورة المحملة:',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: textColor),
                      textAlign: _isEnglish ? TextAlign.left : TextAlign.right,
                    ),
                    SizedBox(height: 10),
                    Center(
                      child: _buildUploadedImage(),
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () => _launchURL(source),
                      child: Center(
                        child: Text(
                          name,
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: diseaseNameColor, decoration: TextDecoration.underline),
                          textAlign: _isEnglish ? TextAlign.left : TextAlign.right,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      _isEnglish ? 'Server Response:' : 'استجابة الخادم:',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: textColor),
                      textAlign: _isEnglish ? TextAlign.left : TextAlign.right,
                    ),
                    SizedBox(height: 10),
                    _buildInfoCard(_isEnglish ? 'Confidence' : 'الثقة', confidence.toStringAsFixed(2), TextAlign.center),
                    _buildInfoCard(_isEnglish ? 'Description' : 'الوصف', description, _isEnglish ? TextAlign.left : TextAlign.right),
                    _buildInfoCard(_isEnglish ? 'Conditions' : 'الظروف', conditions, _isEnglish ? TextAlign.left : TextAlign.right),
                    _buildInfoCard(_isEnglish ? 'Mechanical Treatment' : 'العلاج الميكانيكي', mechanicalTreatment, _isEnglish ? TextAlign.left : TextAlign.right),
                    _buildInfoCard(_isEnglish ? 'Chemical Treatment' : 'العلاج الكيميائي', chemicalTreatment, _isEnglish ? TextAlign.left : TextAlign.right),
                  ],
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleLanguage,
        child: Icon(Icons.translate),
        backgroundColor: primaryColor,
      ),
    );
  }

  Widget _buildUploadedImage() {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 4),
            blurRadius: 5,
          ),
        ],
        image: DecorationImage(
          fit: BoxFit.cover,
          image: FileImage(widget.image),
        ),
      ),
    );
  }

  Widget _buildInfoCard(String title, String content, TextAlign textAlign) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: textColor),
              textAlign: textAlign,
            ),
            SizedBox(height: 5),
            Text(
              content,
              style: TextStyle(fontSize: 16, color: textColor),
              textAlign: textAlign,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WebViewPage(url: url),
      ),
    );
  }
}
