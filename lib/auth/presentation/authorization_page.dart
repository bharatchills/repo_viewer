import 'package:flutter/material.dart';
import 'package:repo_viewer/auth/infrastructure/github_authenticator.dart';
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
  late final WebViewCookieManager cookieManager = WebViewCookieManager();

  void clearCookies() async {
    await cookieManager.clearCookies();
  }

  @override
  void initState() {
    clearCookies();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(widget.authorizationUrl)
      ..clearCache()
      ..clearLocalStorage()
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) async {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url
                .startsWith(GithubAuthenticator.redirectUrl.toString())) {
              widget.onAuthorizationCodeRedirectAttemp(
                Uri.parse(
                  request.url,
                ),
              );
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      );

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
