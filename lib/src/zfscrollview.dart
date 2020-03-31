import 'package:flutter/material.dart';

/// 简单滚动容器
/// single child scroll view
class ZFSingleChildScrollView extends StatelessWidget {
  ZFSingleChildScrollView(
      {this.child,
      this.scrollDirection = Axis.vertical,
      this.showScrollBar = true, this.controller });
      
  ///子Widget
  final Widget child;
  ///滚动方向 scroll directtion
  final Axis scrollDirection;
  ///是否显示滚动条
  final bool showScrollBar;
  ///控制器
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    Widget widget;
    if (showScrollBar) {
      widget = Scrollbar(
        child: SingleChildScrollView(
            child: child, scrollDirection: scrollDirection),
      );
    } else {
      widget =
          SingleChildScrollView(child: child, scrollDirection: scrollDirection);
    }
    return widget;
  }
}
