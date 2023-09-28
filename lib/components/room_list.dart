import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qin_chat_flutter/components/room_list_item.dart';

import '../states/home_state.dart';

class RoomList extends StatelessWidget {
  const RoomList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var roomList = Provider
        .of<MyHomeState>(context)
        .roomList;
    return ListView(
        restorationId:'room_item_list',
      padding: const EdgeInsets.symmetric(vertical: 8),
      children: [
        for (var value in roomList)  RoomListItem(item: value,)
      ],
    );
  }
}