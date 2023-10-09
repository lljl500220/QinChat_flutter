import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qin_chat_flutter/pages/friend_chat_page.dart';
import 'package:qin_chat_flutter/utils/menu_util.dart';
import '../routes/slide_right_route.dart';
import '../states/room_state.dart';

class RoomListItem extends StatefulWidget {
  const RoomListItem({Key? key}) : super(key: key);

  @override
  State<RoomListItem> createState() => _RoomListItem();
}

class _RoomListItem extends State<RoomListItem> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<Room>(builder: (context, room, child) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20),
        child: GestureDetector(
          onPanDown: (details) {
            setState(() {
              _isPressed = true; // _isPressed 是一个状态变量，您需要在 StatefulWidget 中定义它
            });
          },
          onTap: () {
            _navigateToChatDetail(context, room);
            room.clear();
          },
          onLongPress: () {
            MenuUtil().openRoomMenu(context);
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
                              room.roomAvatar,
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
                          '房间号:${room.roomName}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 20),
                        ),
                        Text(
                          room.lastMsg,
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
                            room.lastTime,
                            style: const TextStyle(fontSize: 20),
                          ),
                          Container(
                              decoration: BoxDecoration(
                                  color: const Color.fromRGBO(0, 0, 0, 0.3),
                                  borderRadius: BorderRadius.circular(10)),
                              child: room.unread != 0
                                  ? Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4.0, horizontal: 14),
                                      child: Text(
                                        room.unread.toString(),
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
    });
  }
}

void _navigateToChatDetail(BuildContext context, Room friend) {
  Navigator.of(context).push(ScaleAndSlideRoute(page: ChangeNotifierProvider<Room>.value(
      value: friend, child: FriendChatPage(friend: friend))));
}
