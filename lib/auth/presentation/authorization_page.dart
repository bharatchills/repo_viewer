import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AuthorizationPage extends StatefulWidget {
  const AuthorizationPage(
      {super.key,
      required this.authorizationUrl,
      required this.onAuthorizationCodeRedirectAttemp});

  final Uri authorizationUrl;
  final void Function(Uri redirctUrl) onAuthorizationCodeRedirectAttemp;

  @override
  State<AuthorizationPage> createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage> {
  late final WebViewController controller;

  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(widget.authorizationUrl);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebViewWidget(
          controller: controller,
        ),
      ),
    );
  }
}
