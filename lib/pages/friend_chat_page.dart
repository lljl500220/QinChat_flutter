import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qin_chat_flutter/components/msg_me.dart';
import 'package:qin_chat_flutter/states/room_state.dart';

import '../components/msg_other.dart';

class FriendChatPage extends StatelessWidget {
  final Room friend;

  const FriendChatPage({super.key, required this.friend});

  @override
  Widget build(BuildContext context) {
    return Consumer<Room>(builder: (context, friend, child) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          // toolbarHeight: 80,
          //我需要替换appbar组件自带的返回按钮的图标
          leading: IconButton(
              iconSize: 36,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.chevron_left)),
          title: Center(
              child: Text(
            friend.roomName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          )),
          actions: [
            IconButton(
                iconSize: 30,
                onPressed: () {
                  friend.add('${DateTime.now()}',
                      ('${DateTime.now().hour}:${DateTime.now().minute}'));
                  friend.addMsg(MsgList('这是一条测试消息${Random().nextInt(100)}',
                      '${DateTime.now()}', 'me'));
                },
                icon: const Icon(Icons.more_vert)),
          ],
        ),
        //我需要在body中使用一个瀑布流布局
        body: _MessageList(friend.msgList),
      );
    });
  }
}

class MsgList {
  final String msg;
  final String time;
  final String userId;

  MsgList(this.msg, this.time, this.userId);
}

class _MessageList extends StatefulWidget {
  final List<MsgList> _msgList;

  const _MessageList(this._msgList, {super.key});

  @override
  State<StatefulWidget> createState() => _MessageListState();
}

class _MessageListState extends State<_MessageList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
              key: const PageStorageKey('_message_list'),
              padding: const EdgeInsets.symmetric(vertical: 8),
              restorationId: '_message_list',
              itemCount: widget._msgList.length,
              //设置背景色
              itemBuilder: (context, index) {
                MsgList msg = widget._msgList[index];
                return msg.userId == 'other' ? MsgMe(msg) : MsgOther(msg);
              }),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0), //EdgeInsets 是用来设置边距的
          child: TextField(
            decoration: InputDecoration( //InputDecoration 是用来设置输入框的样式的
              hintText: '', //设置输入框的提示文字
              border: OutlineInputBorder(), //设置输入框的边框 OutlineInputBorder 是一个边框的样式
            ),
          ),
        ),
      ],
    );
  }
}
