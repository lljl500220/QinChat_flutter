import 'package:flutter/material.dart';

class RoomListItem extends StatefulWidget {
  const RoomListItem({super.key});

  @override
  State<RoomListItem> createState() => _RoomListItem();
}

class _RoomListItem extends State<RoomListItem> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20),
      child: GestureDetector(
        onPanDown: (details) {
          setState(() {
            _isPressed = true; // _isPressed 是一个状态变量，您需要在 StatefulWidget 中定义它
          });
        },
        onPanCancel: () {
          setState(() {
            _isPressed = false;
          });
        },
        child: Container(
          color: _isPressed
              ? const Color.fromRGBO(0, 0, 0, 0.1)
              : Colors.transparent,
          child: SizedBox(
            height: 100,
            child: Row(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fsafe-img.xhscdn.com%2Fbw1%2F3961233d-7a9a-4413-98df-df6fa0e00a13%3FimageView2%2F2%2Fw%2F1080%2Fformat%2Fjpg&refer=http%3A%2F%2Fsafe-img.xhscdn.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1698393872&t=60d91c6b8d772ddd4128a7c3d2e714b6',
                          ))),
                ),
                const Expanded(
                    child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '房间名',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text('最新的一条消息')
                    ],
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
