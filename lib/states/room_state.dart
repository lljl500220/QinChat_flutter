import 'package:flutter/cupertino.dart';
class Room extends ChangeNotifier {
  String roomName;
  String roomId;
  String roomAvatar;
  String lastMsg;
  String lastTime;
  int unread;

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