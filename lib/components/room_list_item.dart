import 'package:flutter/material.dart';

import '../states/room_state.dart';

class RoomListItem extends StatefulWidget {
  final Room item;

  const RoomListItem({super.key, required this.item});

  @override
  State<RoomListItem> createState() => _RoomListItem();
}

class _RoomListItem extends State<RoomListItem> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    Room item = widget.item;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20),
      child: GestureDetector(
        onPanDown: (details) {
          setState(() {
            _isPressed = true; // _isPressed 是一个状态变量，您需要在 StatefulWidget 中定义它
          });
        },
        onTap: () {
          item.add('最新的一条消息最新的一条消息最新的一条消息最新的一条消息最新的一条消息',
              ('${DateTime.now().hour}:${DateTime.now().minute}'));
        },
        onLongPress: (){
          _showMenu(context);
        },
        onPanCancel: () {
          setState(() {
            _isPressed = false;
          });
        },
        child: Container(
          color: _isPressed
              ? const Color.fromRGBO(0, 0, 0, 0.1)
              : Colors.transparent,
          child: SizedBox(
            height: 100,
            child: Row(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            item.roomAvatar,
                          ))),
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '房间号:${item.roomName}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 20),
                      ),
                      Text(
                        item.lastMsg,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                )),
                SizedBox(
                  width: 100,
                  height: 100,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 14),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          item.lastTime,
                          style: const TextStyle(fontSize: 20),
                        ),
                        Container(
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(0, 0, 0, 0.3),
                                borderRadius: BorderRadius.circular(10)),
                            child: item.unread != 0
                                ? Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 4.0, horizontal: 14),
                                    child: Text(
                                      item.unread.toString(),
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                  )
                                : null)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showMenu(BuildContext context) {
    final overlay = Overlay.of(context)!.context.findRenderObject()! as RenderBox;
    final RenderBox box = context.findRenderObject()! as RenderBox;
    final Offset topLeftPosition = box.localToGlobal(Offset.zero, ancestor: overlay);

    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        topLeftPosition.dx,
        topLeftPosition.dy - 50, // 此处可以调整弹出菜单的位置，使其显示在被长按元素的正上方
        overlay.size.width - topLeftPosition.dx - box.size.width,
        overlay.size.height - topLeftPosition.dy,
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
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Deleted Item')));
          break;
        case 2:
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Selected Item')));
          break;
      }
    });
  }
}
