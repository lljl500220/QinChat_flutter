import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qin_chat_flutter/components/room_list_item.dart';
import 'package:qin_chat_flutter/states/room_state.dart';

import '../states/home_state.dart';

class RoomList extends StatelessWidget {
  const RoomList({Key? key}) : super(key: key);

  //我需要实现一个列表，这个列表的数据源是一个数组，数组中的每一项都是一个对象，这个对象有两个属性，一个是头像，一个是名字
  @override
  Widget build(BuildContext context) {
    var roomList = Provider.of<MyHomeState>(context).roomList;
    return ListView.builder(
      key: const PageStorageKey('room_item_list'),
      restorationId: 'room_item_list',
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: roomList.length,
      itemBuilder: (context, index) {
        var room = roomList[index];
        return ChangeNotifierProvider<Room>.value(
            value: room, child: const RoomListItem());
      },
    );
  }
}
