// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

///页面基类 route page base class
abstract class ZFBaseWidget extends StatefulWidget {
  @override
  State createState() => ZFBaseWidgetState();
}

class ZFBaseWidgetState extends State<ZFBaseWidget> {
  ///导航栏标题
  ///navigatebar title
  String title = '';

  ///背景色
  ///page background color
  Color backgroundColor = Color(0xffdedde3);

  ///创建导航栏
  ///build navigatorbar
  Widget buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(color: Theme.of(context).primaryColor), //使用主题颜色
      ),
      backgroundColor: Colors.white,
      elevation: 0, //去除底部阴影
      leading: Navigator.of(context).canPop()
          ? BackButton(color: Theme.of(context).primaryColor)
          : null,//判断是否需要返回按钮
      centerTitle: true,
    );
  }

  ///创建页面body
  ///build page body
  Widget buildBody(BuildContext context) {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: buildBody(context),
      backgroundColor: backgroundColor,
    );
  }
}
