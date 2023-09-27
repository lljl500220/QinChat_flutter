import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qin_chat_flutter/components/room_list_item.dart';
import 'package:qin_chat_flutter/main.dart';

class RoomList extends StatelessWidget {
  const RoomList({super.key});

  @override
  Widget build(BuildContext context) {
    var roomList = Provider
        .of<MyHomeState>(context)
        .roomList;
    return ListView(
        restorationId:'room_item_list',
      padding: const EdgeInsets.symmetric(vertical: 8),
      children: [
        for (int i = 0; i < 10; i++) const RoomListItem()
      ],
    );
  }

}