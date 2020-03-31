import 'package:flutter/material.dart';
import 'zfbutton.dart';
import 'zfshadow.dart';
import 'zftext.dart';

///底部按钮样式
enum ZFDialogFooterStyle {
  ///默认左右按钮
  ButtonLR,
  //只有一个按钮
  ButtonCenter
}

///自定义对话框
class ZFDialog extends StatelessWidget {
  final Widget content;
  final Widget footerContent;
  final Function onCancelPressed;
  final Function onOkPressed;
  final String okText;
  final String cancelText;
  final ZFDialogFooterStyle style;
  ZFDialog(
      {this.content,
      this.onOkPressed,
      this.onCancelPressed,
      this.footerContent,
      this.okText = '确定',
      this.cancelText = '取消',
      this.style = ZFDialogFooterStyle.ButtonLR});

  //创建只有一个按钮样式
  Widget _buildActionButtonsCenter(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 26.0),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: ZFThemeButton(
          text: okText,
          onPressed: () {
            if (this.onOkPressed != null) {
              bool close = this.onOkPressed();
              if (close) {
                Navigator.of(context).pop();
              }
            }
          },
        ),
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 26.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center, //水平居中
        children: <Widget>[
          FlatButton(
            child: Text(
              cancelText,
              style: TextStyle(color: Color(0xff706f70), fontSize: 17),
            ),
            onPressed: () {
              Navigator.of(context).pop();
              if (this.onCancelPressed != null) {
                this.onCancelPressed();
              }
            },
          ),
          FlatButton(
            child: Text(
              okText,
              style: TextStyle(
                  color: Theme.of(context).primaryColor, fontSize: 17),
            ),
            onPressed: () {
              if (this.onOkPressed != null) {
                bool close = this.onOkPressed();
                if (close) {
                  Navigator.of(context).pop();
                }
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      contentPadding: const EdgeInsets.all(20), //留出阴影边距，实际对话框尺寸对应加上这个边距
      content: Container(
        padding: const EdgeInsets.all(15),
        decoration: ZFShadowBoxDecoration.decoration(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            this.content,
            footerContent ?? (style == ZFDialogFooterStyle.ButtonLR ? _buildActionButtons(context) : _buildActionButtonsCenter(context)),
          ],
        ),
      ),
    );
  }
}

///警告确认Dialog
///使用示例```ZFAlertDialog.show(context, '是否恢复出厂设置？', null);```
class ZFAlertDialog extends ZFDialog {
  static void show(BuildContext context, String title, String message,
      {Widget footerContent, ZFDialogFooterStyle style = ZFDialogFooterStyle.ButtonLR, Function onOkPressed}) {
    Widget _buildColumn() {
      assert(title != null || message != null);
      if (title != null && message != null) {
        return Column(
          children: <Widget>[
            ZFThemeText(
              text: title,
              style: TextStyle(
                  fontSize: 18, color: Theme.of(context).primaryColor),
            ),
            ZFThemeText(
              text: message,
            ),
          ],
        );
      }
      return ZFThemeText(
        text: title ?? message,
        style: TextStyle(fontSize: 18),
      );
    }

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return ZFDialog(
            content: Container(
              width: 300,
              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: _buildColumn(),
            ),
            onOkPressed: onOkPressed ?? () {
              return true;
            },
            footerContent: footerContent,
            style: style,
          );
        });
  }
}
