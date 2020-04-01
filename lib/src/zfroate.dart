import 'dart:math';

import 'package:flutter/material.dart';

class ZFRoate extends StatefulWidget {
  @required
  final Widget child;
  @required
  final double angle;
  final Offset origin;
  ///control the widget can be rotatable or no
  final bool Function(double angle) callback;

  ZFRoate(
      {this.child,
      this.angle,
      this.origin,
      this.callback,
      })
      : assert(child != null);

  @override
  State<StatefulWidget> createState() => _ZFRoateState();
}

class _ZFRoateState extends State<ZFRoate> {
  final key = GlobalKey<_ZFRoateState>();

  double _angleCenter = 0.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        key: key,
        child: Transform.rotate(
          angle: _angleCenter,
          child: widget.child,
          origin: widget.origin,
        ),
        onPanUpdate: (DragUpdateDetails d) {
          var p = d.localPosition;

          RenderBox box = key.currentContext.findRenderObject();

          //calc the angle from touch point to circle center point
          var angle = pi -
              atan2(box.size.height / 2 - p.dy, p.dx - box.size.width / 2) -
              pi / 2;
          bool rotatable = true;
          if (widget.callback != null) {
            rotatable = widget.callback(angle);
            assert(rotatable != null);
          }
          if (rotatable) {
            setState(() {
              _angleCenter = angle;
            });
          }
        },
      ),
    );
  }
}
