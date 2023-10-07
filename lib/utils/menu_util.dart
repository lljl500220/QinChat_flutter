import 'package:flutter/material.dart';

class MenuUtil {
    void openRoomMenu(BuildContext context) {
    final RenderBox box = context.findRenderObject()! as RenderBox;

    final Offset topLeftPosition = box.localToGlobal(
      Offset(box.size.width / 2, box.size.height / 2),);

    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        topLeftPosition.dx,
        topLeftPosition.dy, // 此处可以调整弹出菜单的位置，使其显示在被长按元素的正上方
        topLeftPosition.dx,
        topLeftPosition.dy,
      ),
      items: <PopupMenuEntry<int>>[
        const PopupMenuItem<int>(
          value: 1,
          child: Text('Delete'),
        ),
        const PopupMenuItem<int>(
          value: 2,
          child: Text('Select'),
        ),
      ],
      elevation: 8.0,
    ).then<void>((int? selectedItem) {
      if (selectedItem == null) return;
      switch (selectedItem) {
        case 1:
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Deleted Item')));
          break;
        case 2:
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Selected Item')));
          break;
      }
    });
  }
}