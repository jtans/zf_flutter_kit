import 'package:flutter/material.dart';
import 'mine_page.dart';
import 'package:zf_flutter_kit/zf_flutter_kit.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends ZFBaseWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends ZFBaseWidgetState {
  @override
  String get title => 'Home';

  Widget _buildDivider(String title) {
    var t = title.padLeft(20, '-') + ''.padRight(20, '-');
    return ZFThemeText(
      text: t,
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _buildDivider('Button'),
        ZFButton(
          text: 'Button',
        ),
        ZFButton(
          borderColor: Colors.red,
          borderRadius: 15,
          text: 'Custom Button',
        ),
        ZFThemeButton(
          text: 'Theme Button',
        ),
        ZFThemeText(
          text: 'Theme Text',
        ),
        _buildDivider('Dialog'),
        ZFButton(
          text: 'Show Alert Dialog',
          onPressed: () {
            ZFAlertDialog.show(context, 'Your Title', 'Your Message',
                onOkPressed: () {
              return true; //return true to close, when press ok button
            });
          },
        ),
        ZFButton(
          text: 'Show Custom Alert Dialog',
          onPressed: () {
            ZFAlertDialog.show(context, 'Your Title', 'Your Message',
                onOkPressed: () {
              return true;
            }, footerContent: () {
              return Container(
                color: Colors.red,
                width: 200,
                height: 44,
              );
            }());
          },
        ),
        ZFButton(
          text: 'Show Custom Dialog',
          onPressed: () {
            showDialog(
                context: context,
                builder: (ctx) {
                  return ZFDialog(
                    cancelText: 'Cancel',
                    okText: 'Ok',
                    content: () {
                      return Image.network(
                          'https://www.baidu.com/img/bd_logo1.png');
                    }(),
                  );
                });
          },
        ),
        _buildDivider('Navigator'),
        ZFButton(
          text: 'push a page',
          onPressed: () {
            Navigator.of(context).zfpush(MinePage());
          },
        ),
        ZFButton(
          text: 'push open a webview',
          onPressed: () {
            Navigator.of(context)
                .zfopenWebView('https://github.com', 'Your web page title');
          },
        )
      ],
    );
  }
}
