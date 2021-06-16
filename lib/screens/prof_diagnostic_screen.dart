import 'dart:async';

import 'package:abiturient_app/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ProfDiagnosticScreen extends StatefulWidget {

  @override
  _ProfDiagnosticScreenState createState() => _ProfDiagnosticScreenState();
}

class _ProfDiagnosticScreenState extends State<ProfDiagnosticScreen> {

  final Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.1),
          child: AppBarWidget(title: "Проф. диагностика",)),
      body: WebView(
        initialUrl: 'https://edunavigator.kz',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (webViewController) {
          _controller.complete(webViewController);
        },
      ),
    );
  }
}
