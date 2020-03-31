import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'zfbase_widget.dart';

///完整的一个网页页面
class ZFWebWidget extends ZFBaseWidget {
  ///网页链接
  final String url;
  ///标题
  final String title;
  ZFWebWidget({this.url, this.title});

  @override
  State<StatefulWidget> createState() => new _ZFWebWidgetState();
}

class _ZFWebWidgetState extends ZFBaseWidgetState {
  @override
  
  ZFWebWidget get widget => super.widget;

  @override
  String get title => widget.title;

  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  
  @override
  Widget buildBody(BuildContext context) {
    return WebView(
      initialUrl: widget.url,
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController webViewController) {
        _controller.complete(webViewController);
      },
      navigationDelegate: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
          onPageStarted: (String url) {
            print('Page started loading: $url');
          },
          onPageFinished: (String url) {
            print('Page finished loading: $url');
          },
          gestureNavigationEnabled: true,
    );
  }
}

///扩展Navigator的方法
///使用示例```Navigator.of(context).openWebView('https://www.xx.com', '标题');```
extension NavigatorZFWebView on NavigatorState {
   ///动态创建路由
   void zfopenWebView(String url, String title) {
     this.push(MaterialPageRoute(builder: (context) {
        return ZFWebWidget(
          url: url,
          title: title,
        );
      }));
  }
}
