import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pragma/ui/styles/colors.dart';
import 'package:flutter_pragma/ui/widgets/AppBarWidget.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget{
  final String url;

  const WebViewPage({super.key, required this.url});
  @override
  State<WebViewPage> createState() => _WebViewState(url);
}


class _WebViewState extends State<WebViewPage> {

  final Completer<WebViewController> _controller =
  Completer<WebViewController>();
  bool _isLoading = true;
  final String urlFinal;

  _WebViewState(this.urlFinal);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBarWidget(),
        Expanded(
          child: Scaffold(
            body: Stack(
              children: <Widget> [
                WebView(
                  initialUrl: urlFinal,
                  onPageFinished: (String url) {
                    setState(() {
                      _isLoading = false;
                    });
                  },
                  onWebViewCreated: (WebViewController webViewController) {
                    _controller.complete(webViewController);
                  },
                ),
                if (_isLoading)
                  Center(
                    child: CircularProgressIndicator(
                      color: ColorsApp.mainPurple,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }

}