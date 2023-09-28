import 'package:flutter/cupertino.dart';
class Room extends ChangeNotifier {
  late String roomName;
  late String roomId;
  late String roomAvatar;
  late String lastMsg;
  late String lastTime;
  late int unread;

  Room({
    required this.roomName,
    required this.roomId,
    required this.roomAvatar,
    this.lastMsg = '',
    this.lastTime = '',
    this.unread = 0,
  });

  void add(String msg, String time, {int num = 1}) {
    unread += num;
    lastMsg = msg;
    lastTime = time;
  }

  void clear() {
    unread = 0;
  }

  void changeName(String name) {
    roomName = name;
  }
}