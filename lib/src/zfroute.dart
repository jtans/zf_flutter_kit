import 'package:flutter/material.dart' show MaterialPageRoute, NavigatorState, Widget;

extension ZFNavigator on NavigatorState {
   ///push without parammeter
   void zfpush(Widget widget) {
     assert(widget != null);
     this.push(MaterialPageRoute(builder: (context) {
        return widget;
      }));
  }
}