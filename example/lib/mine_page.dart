import 'package:flutter/material.dart';
import 'package:zf_flutter_kit/zf_flutter_kit.dart';

class MinePage extends ZFBaseWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends ZFBaseWidgetState {
  @override
  String get title => 'Mine';

  @override
  Widget buildBody(BuildContext context) {
    return Center(child: ZFThemeText(text: 'Mine Page',),);
  }
}
