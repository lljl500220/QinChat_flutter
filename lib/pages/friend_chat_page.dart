import 'package:flutter/material.dart';
import 'package:qin_chat_flutter/states/room_state.dart';

class FriendChatPage extends StatelessWidget {
  final Room friend;

  const FriendChatPage({super.key, required this.friend});

  @override
  Widget build(BuildContext context) {
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
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.more_vert)),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: 30,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Item $index'),
          );
        },
      ),
    );
  }
}
