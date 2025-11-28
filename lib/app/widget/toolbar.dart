import 'package:flutter/material.dart';

import '../data/helper/toolbar.dart';

List<Widget> buildToolbarIcons(bool isVertical) {
  final icons = [
    Icons.home,
    Icons.arrow_back,
    Icons.add,
    Icons.remove,
    Icons.screen_rotation,
    Icons.camera_alt,
  ];

  List<Widget> widgets = [];

  for (int i = 0; i < icons.length; i++) {
    widgets.add(ToolIcon(icon: icons[i]));

    if ((i + 1) % 2 == 0 && i != icons.length - 1) {
      widgets.add(
        isVertical
            ? Container(
          height: 2,
          width: 30,
          color: Colors.grey.withOpacity(0.6),
          margin: const EdgeInsets.symmetric(vertical: 2),
        )
            : Container(
          width: 2,
          height: 30,
          color: Colors.grey.withOpacity(0.6),
          margin: const EdgeInsets.symmetric(horizontal: 2),
        ),
      );
    }
  }

  return widgets;
}
