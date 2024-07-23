import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_windows/webview_windows.dart';

const Color primaryColor = Colors.teal;

class AboutUsPage extends StatelessWidget {
  final List<TeamMember> teamMembers = [
    TeamMember(
      name: 'Ibrahim Ahmed',
      role: 'Computer Engineer',
      imageUrl: 'https://lh4.googleusercontent.com/VN_nUg4W-v_t7mb2aoNrawogsQB7cTfT4A9z6JoQ5oL7rKbRLfmOUicpJrKrsxdrznTl7gDDLzudnVqYBJ066zpxCj0b5c4FSDg4WTjWJ_lKAQpwzGOPywVuiTFXvgtiWQ=w1280',
      url: 'https://github.com/Locked-Cloud',
    ),
    TeamMember(
      name: 'Ezz El Dlen Ahmed',
      role: 'Computer Engineer',
      imageUrl: 'https://lh5.googleusercontent.com/Mw8kvBWKej6iDR6AcW336_32q0EsWrf249GAhgNhdf561p8wZiPlCB6772-C1hLgoVN6fn12fuOdkk6jFf1T7uvkkL44mN5BraDYHJm4gfLXmWJiTbcEMoJTQeuvOFOAOw=w1280',
      url: 'https://github.com/decoezz',
    ),
    TeamMember(
      name: 'Abdelrahman Sheneshen',
      role: 'Computer Engineer',
      imageUrl: 'https://lh6.googleusercontent.com/B-bJXsEZJ1al8euP1tqQlF-G6lEJm8FV4k1FllK4SLocD_V7MJaNqJlP7gduMGrJIuD_thBLIYXWY0vfcPCJFrwmGbRj0XgLL7JUFicNlGIj9J0fHqa4Vo7cgYgS6sxaiw=w1280',
      url: 'https://github.com/AbdulrahmanAbdullah0',
    ),
  ];

  final TeamMember projectManager = TeamMember(
    name: 'Eng.Ahmed Thabet',
    role: 'Project Manager',
    imageUrl: 'https://lh3.googleusercontent.com/VNuWlLGLSrxaNiMxXpiyeFVkCPAdv6eu24lzci_LunEjnbo7tl9x7Q_qleyha0wo6i_nReoUApH0XM0cV-407VBrol79-YIv67NYmxXYYLPm-XPovS7B9m-rK012PCyBvg=w1280',
    url: 'https://www.linkedin.com/in/ahmed-thabet-ahmed-907719109/?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=ios_app',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CachedNetworkImage(
                  imageUrl: 'https://lh3.googleusercontent.com/dzBSzvYC_fUsirIpIJGFSLl4JV7e2h7BpHHckROqLmvKUyR43BporHPAXSDnitcBv9ptT2r8Ki99MJ54X68uO80=w1280',
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  height: 200,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Project Manager',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(projectManager.imageUrl),
                ),
                title: GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WebViewPage(url: projectManager.url),
                    ),
                  ),
                  child: Text(
                    projectManager.name,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                subtitle: Text(projectManager.role),
              ),
              SizedBox(height: 20),
              Text(
                'Team Members',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              ...teamMembers.map((member) => ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(member.imageUrl),
                    ),
                    title: GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WebViewPage(url: member.url),
                        ),
                      ),
                      child: Text(
                        member.name,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    subtitle: Text(member.role),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class TeamMember {
  final String name;
  final String role;
  final String imageUrl;
  final String url;

  TeamMember({required this.name, required this.role, required this.imageUrl, required this.url});
}

class WebViewPage extends StatefulWidget {
  final String url;

  const WebViewPage({Key? key, required this.url}) : super(key: key);

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late WebViewController _webViewController;
  late WebviewController _windowsWebViewController;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    } else if (Platform.isWindows) {
      _initializeWindowsWebView();
    }
  }

  Future<void> _initializeWindowsWebView() async {
    _windowsWebViewController = WebviewController();
    await _windowsWebViewController.initialize();
    await _windowsWebViewController.setBackgroundColor(Colors.transparent);
    _windowsWebViewController.url.listen((url) {
      print('WebView is loading: $url');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WebView'),
        backgroundColor: primaryColor,
      ),
      body: Platform.isAndroid
          ? WebView(
              initialUrl: widget.url,
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (controller) {
                _webViewController = controller;
              },
              navigationDelegate: (NavigationRequest request) {
                if (request.url.startsWith('http')) {
                  return NavigationDecision.navigate;
                }
                return NavigationDecision.prevent;
              },
            )
          : Platform.isWindows
              ? FutureBuilder<void>(
                  future: _initializeWindowsWebView(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      _windowsWebViewController.loadUrl(widget.url);
                      return Webview(_windowsWebViewController);
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                )
              : Center(
                  child: Text('Unsupported platform'),
                ),
    );
  }
}

