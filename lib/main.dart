import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qin_chat_flutter/components/room_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => MyHomeState(),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            useMaterial3: true,
          ),
          home: MyHomePage(),
        ));
  }
}

class MyHomeState extends ChangeNotifier {
  var roomList = [];

  int word = 1;

  void add() {
    word++;
    notifyListeners();
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //输入框需要先创建一个控制器
  var textFieldSearch = TextEditingController();
  var searchResult = '';

  //底部导航的选择
  int _selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyHomeState>();
    var word = appState.word;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
          title: Row(
        children: [
          const CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage('images/avatar1.jpg'),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
              child: TextField(
            controller: textFieldSearch,
            cursorColor: Colors.black,
            style: const TextStyle(color: Colors.black),
            onChanged: (val) {
              setState(() {
                searchResult = val;
              });
            },
            decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  color: Colors.grey,
                  onPressed: () {
                    setState(() {
                      searchResult = textFieldSearch.text;
                    });
                  },
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 1.0)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 1.0)),
                hintText: '输入内容',
                fillColor: const Color.fromRGBO(255, 255, 255, 0.5),
                filled: true,
                contentPadding: const EdgeInsets.all(10)),
          )),
          const SizedBox(
            width: 16,
          ),
          IconButton(
              onPressed: () {
                setState(() {
                  searchResult = 'setting';
                });
              },
              icon: const Icon(Icons.settings))
        ],
      )),
      body: const RoomList(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: "聊天",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: "好友",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_sharp),
            label: "画廊",
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectIndex = index;
          });
        },
      ),
    );
  }
}

class WordText extends StatelessWidget {
  const WordText({
    super.key,
    required this.word,
  });

  final String word;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displaySmall!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          'tap count : ${word.toString()}',
          style: style,
        ),
      ),
    );
  }
}
