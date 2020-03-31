import 'package:flutter/material.dart';

///返回一个带阴影的BoxDecoration
class ZFShadowBoxDecoration extends BoxDecoration {
  //静态默认构造器
  static BoxDecoration decoration() {
    return BoxDecoration(
      boxShadow: [
        BoxShadow(
            blurRadius: 5,
            color: Color(0xff433b71).withAlpha(133),
            spreadRadius: 5),
      ],
      borderRadius: BorderRadius.all(Radius.circular(10)),
      color: Colors.white,
    );
  }
}

///带阴影的Container，默认margin=25，padding=10
class ZFShadowContainer extends StatelessWidget {
  const ZFShadowContainer(
      {this.child,
      this.margin = const EdgeInsets.all(50),
      this.padding = const EdgeInsets.all(10)});

  final Widget child;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: ZFShadowBoxDecoration.decoration(),
      child: child,
      // constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
    );
  }
}
