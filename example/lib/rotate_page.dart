import 'package:flutter/material.dart';
import 'package:zf_flutter_kit/zf_flutter_kit.dart';

class RotatePage extends ZFBaseWidget {
  @override
  _RotatePageState createState() => _RotatePageState();
}

class _RotatePageState extends ZFBaseWidgetState {
  @override
  String get title => 'Rotate';

  @override
  Widget buildBody(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        ZFRoate(
          child: Container(
            child: ZFThemeText(
              text: 'Rotate Page',
            ),
            width: 300,
            height: 200,
            color: Colors.yellow,
          ),
          angle: 0.0,
          callback: (d) {
            print(d);
            return true;
          },
        ),
        ZFRoate(angle: 0, child: ZFButton(text: 'Rotate Button'),),
        ZFRoate(angle: 0, child: Image.network('https://www.baidu.com/img/bd_logo1.png'),)
      ],
    );
  }
}
