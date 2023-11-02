import 'package:flutter/cupertino.dart';
import 'package:qin_chat_flutter/states/room_state.dart';
const String avatar = 'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fsafe-img.xhscdn.com%2Fbw1%2F3961233d-7a9a-4413-98df-df6fa0e00a13%3FimageView2%2F2%2Fw%2F1080%2Fformat%2Fjpg&refer=http%3A%2F%2Fsafe-img.xhscdn.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1698393872&t=60d91c6b8d772ddd4128a7c3d2e714b6';

//这个类是用来管理首页的状态的

//请帮我优化这个类的代码，让它变得更加简洁
class MyHomeState extends ChangeNotifier {
  List<Room> roomList = [Room(roomName: '秦篆',msgList: [], roomId: '0001',roomAvatar:avatar),Room(roomName: 'luolj',msgList: [], roomId: '0002',roomAvatar:avatar)];

  //这个方法是用来添加一个房间的
  void addRoom() {
    roomList.insert(0, Room(roomName: '秦篆${roomList.length}',msgList: [], roomId: '000${roomList.length}',roomAvatar:avatar));
    notifyListeners();
  }
}
