import 'package:flutter/material.dart';

//主题Text（高亮色、紫色）
class ZFThemeText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final TextAlign textAlign;
  ZFThemeText(
      {this.text = 'Text', this.style, this.textAlign = TextAlign.center});

  @override
  Widget build(BuildContext context) {
    return Text(
      this.text,
      style: style ??
          TextStyle(
            color: Theme.of(context).primaryColor,
          ),
      textAlign: textAlign,
    );
  }

  static Widget titleText(String text) {
    return ZFThemeText(
      text: text,
      style: TextStyle(fontSize: 18, color: Color(0xff433b71)),
    );
  }
}
