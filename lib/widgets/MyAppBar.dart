import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  final Widget leading, title;

  const MyAppBar({Key key, this.title, this.leading}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    if (!kIsWeb && Platform.isIOS) {
      return CupertinoNavigationBar(
        middle: title ?? title,
        leading: leading ?? leading,
      );
    } else {
      return AppBar(
        centerTitle: true,
        title: title ?? title,
        leading: leading ?? leading,
      );
    }
  }
}
