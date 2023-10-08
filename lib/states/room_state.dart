import 'package:flutter/cupertino.dart';

//这个类是用来管理首页的状态的
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
    notifyListeners();
  }

  void clear() {
    unread = 0;
    notifyListeners();
  }

  void changeName(String name) {
    roomName = name;
    notifyListeners();
  }

  void changeAvatar(String avatar) {
    roomAvatar = avatar;
    notifyListeners();
  }

  void changeLastMsg(String msg) {
    lastMsg = msg;
    notifyListeners();
  }

  void changeLastTime(String time) {
    lastTime = time;
    notifyListeners();
  }

  void changeUnread(int num) {
    unread = num;
    notifyListeners();
  }
}
