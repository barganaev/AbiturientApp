import 'dart:async';

import 'package:abiturient_app/screens/drawer_screen.dart';
import 'package:abiturient_app/widgets/appbar_widget.dart';
import 'package:abiturient_app/widgets/on_will_scope.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ProfDiagnosticScreen extends StatefulWidget {
  @override
  _ProfDiagnosticScreenState createState() => _ProfDiagnosticScreenState();
}

class _ProfDiagnosticScreenState extends State<ProfDiagnosticScreen> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => willPopCallback(context),
      child: Scaffold(
        appBar: appBarMy("Проф. диагностика"),
        drawer: MyDrawer(),
        body: WebView(
          initialUrl: 'https://edunavigator.kz',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (webViewController) {
            _controller.complete(webViewController);
          },
        ),
      ),
    );
  }
}
