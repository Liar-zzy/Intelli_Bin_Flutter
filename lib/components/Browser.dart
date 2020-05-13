import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

///webview组件封装
class Browser extends StatelessWidget {
  const Browser({Key key, this.url, this.title}) : super(key: key);

  final String url;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF2171F5),
                Color(0xFF49A2FC),
              ],
            ),
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontFamily: "NotoSerifSC",
          ),
        ),
        centerTitle: true,
      ),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
