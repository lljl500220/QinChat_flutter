//创建一个静态空白组件，该组件返回一个Text组件
import 'package:flutter/cupertino.dart';

import '../pages/friend_chat_page.dart';

class MsgMe extends StatelessWidget {
  final MsgList _msg;

  const MsgMe(this._msg, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('me${_msg.msg}'),
    );
  }
}