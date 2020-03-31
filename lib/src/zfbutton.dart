import 'package:flutter/material.dart';

/// 按钮
class ZFButton extends StatefulWidget {
  static const Color _color = Color(0xff706f70);
  static const Color _highlightColor = Color(0xff433b71);

  ZFButton(
      {this.text = '',
      this.onPressed,
      this.borderRadius = 8,
      this.borderWidth = 1,
      this.color = Colors.white,
      this.highlightColor = _highlightColor,
      this.textColor = _color,
      this.highlightTextColor = Colors.white,
      this.borderColor = _color,
      this.highlightBorderColor = _highlightColor,
      this.textStyle,
      this.selected = false,
      });

  ///文本
  final String text;

  ///按钮文本样式
  final TextStyle textStyle;

  ///文本颜色
  final Color textColor;

  ///按钮高亮文本色
  final Color highlightTextColor;

  ///按钮背景色
  final Color color;

  ///按钮高亮背景色
  final Color highlightColor;

  ///按钮边框色
  final Color borderColor;

  ///按钮高亮边框色
  final Color highlightBorderColor;

  ///on press action
  final Function onPressed;

  ///button border radius
  final double borderRadius;

  ///button border width
  final double borderWidth;
  
  ///是否选中，选中后默认背景色和文字颜色调换
  ///button selected state, if true, button background highlight always.
  final bool selected;

  @override
  State<StatefulWidget> createState() => ZFButtonState();
}

class ZFButtonState extends State<ZFButton> {
  //高亮状态
  bool _highlight = false;

  bool getHighlight() {
    if(widget.selected) return true;
    return _highlight;
  }

  Widget _buildButton(BuildContext context) {
    return Center(
      child: Text(
        widget.text,
        style: widget.textStyle == null
            ? TextStyle(
                color:
                    getHighlight() ? widget.highlightTextColor : widget.textColor, fontSize: 16)
            : widget.textStyle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            //边框
            color: getHighlight() ? widget.highlightColor : widget.color,
            borderRadius:
                BorderRadius.all(Radius.circular(widget.borderRadius)),
            border: Border.all(
              color:
                  getHighlight() ? widget.highlightBorderColor : widget.borderColor,
              width: widget.borderWidth,
            )),
        child: _buildButton(context),
      ),
      onTap: widget.onPressed ?? (){},
      onTapDown: (var d) {
        setState(() {
          _highlight = true;
        });
      },
      onTapUp: (var d) {
        setState(() {
          _highlight = false;
        });
      },
      onTapCancel: (){
        setState(() {
          _highlight = false;
        });
      },
    );
  }
}

/// 主题按钮（高亮色，紫色）
class ZFThemeButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  ZFThemeButton({this.text = '', this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ZFButton(
      text: this.text,
      onPressed: this.onPressed,
      color: Theme.of(context).primaryColor,
      highlightColor: Colors.white,
      textColor: Colors.white,
      highlightTextColor: Theme.of(context).primaryColor,
    );
  }
}

///文本按钮，无背景无边框
class ZFThemeTextButton extends StatelessWidget {
  ZFThemeTextButton(this.text, this.onPressed, {this.textStyle});
  ///button text
  final String text;
  ///button text style
  final TextStyle textStyle;
  ///on press handle
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return ZFButton(
      text: this.text,
      textColor: Theme.of(context).primaryColor,
      onPressed: onPressed,
      borderColor: Colors.transparent,
      borderRadius: 0,
      highlightBorderColor: Colors.transparent,
      color: Colors.transparent,
      highlightColor: Colors.transparent,
      textStyle: textStyle,
    );
  }
}
