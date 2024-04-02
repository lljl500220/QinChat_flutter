import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qin_chat_flutter/components/room_list_item.dart';
import 'package:qin_chat_flutter/states/room_state.dart';

import '../states/home_state.dart';

class RoomList extends StatelessWidget {
  const RoomList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var roomList = Provider.of<MyHomeState>(context).roomList;
    return ListView.builder(
      key: const PageStorageKey('room_item_list'), //key和restorationId是为了保持滚动位置
      restorationId: 'room_item_list', // restorationId是为了保持滚动位置
      padding: const EdgeInsets.symmetric(vertical: 8), //设置ListView的padding
      itemCount: roomList.length, //设置ListView的item数量
      itemBuilder: (context, index) { //设置ListView的item
        var room = roomList[index];
        return ChangeNotifierProvider<Room>.value( //使用ChangeNotifierProvider包裹RoomListItem
            value: room, child: const RoomListItem());
      },
    );
  }
}
