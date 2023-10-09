import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qin_chat_flutter/states/room_state.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class FriendChatPage extends StatelessWidget {
  final Room friend;

  const FriendChatPage({super.key, required this.friend});

  @override
  Widget build(BuildContext context) {
    return Consumer<Room>(builder: (context, friend, child) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 80,
          title: Row(
            children: [
              IconButton(
                  iconSize: 36,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.chevron_left)),
              const SizedBox(width: 20),
              Expanded(
                  child: Center(
                      child: Text(
                friend.roomName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ))),
              const SizedBox(width: 20),
              IconButton(
                  iconSize: 30,
                  onPressed: () {
                    friend.add('${DateTime.now()}',
                        ('${DateTime.now().hour}:${DateTime.now().minute}'));
                  },
                  icon: const Icon(Icons.more_vert)),
            ],
          ),
        ),
        //我需要在body中使用一个瀑布流布局
        body: MasonryGridView.count(
          crossAxisCount: 4,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          itemBuilder: (context, index) {
            Color color = Color.fromARGB(
              255,
              Random().nextInt(256),
              Random().nextInt(256),
              Random().nextInt(256),
            );

            return Container(
              height: (index % 5 + 1) * 100.0, // 定义方块的高度
              color: color,
            );
          },
        ),
      );
    });
  }
}
