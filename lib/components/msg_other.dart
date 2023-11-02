//创建一个静态空白组件，该组件返回一个Text组件
import 'package:flutter/cupertino.dart';

import '../pages/friend_chat_page.dart';

class MsgOther extends StatelessWidget {
  final MsgList _msg;

  const MsgOther(this._msg, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('other${_msg.msg}'),
    );
  }
}