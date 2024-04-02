import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:qin_chat_flutter/components/room_list.dart';
import 'package:qin_chat_flutter/pages/gallery_page.dart';
import 'package:qin_chat_flutter/states/home_state.dart';
import 'package:qin_chat_flutter/states/sys_state_local.dart';

void main() async {
  //隐藏状态栏
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SysStateLocal(
        sysWidth: MediaQuery.of(context).size.width,
        sysHeight: MediaQuery.of(context).size.height);
    return ChangeNotifierProvider(
        create: (context) => MyHomeState(),
        child: MaterialApp(
            title: 'Qin_Chat',
            theme: ThemeData(
              useMaterial3: true,
            ),
            home: const MyHomePage(),
            routes: {
              '/gallery': (context) => const GalleryPage(),
            }));
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
    var appState = context.watch<MyHomeState>();  //watch方法用于监听状态变化
    return Scaffold(
      appBar: _selectIndex == 0
          ? AppBar(
              title: Row(
              children: [
                const CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('images/avatar1.jpg'),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: SizedBox(
                  height: 40,
                  child: TextField(
                    controller: textFieldSearch,
                    cursorColor: Colors.black,
                    style: const TextStyle(color: Colors.black),
                    onChanged: (val) {
                      print(val);
                    },
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.search),
                          color: Colors.grey,
                          onPressed: () {
                            setState(() {});
                          },
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: const BorderSide(
                                color: Colors.grey, width: 1.0)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: const BorderSide(
                                color: Colors.grey, width: 1.0)),
                        hintText: '输入内容',
                        fillColor: const Color.fromRGBO(255, 255, 255, 0.5),
                        filled: true,
                        contentPadding: const EdgeInsets.all(10)),
                  ),
                )),
                IconButton(
                    onPressed: () {
                      appState.addRoom();
                    },
                    icon: const Icon(Icons.settings))
              ],
            ))
          : null,
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
          //点击这个按钮时我需要跳转到GalleryPage
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_sharp),
            label: "画廊",
          ),
        ],
        onTap: (index) {
          setState(() {
            if (index == 2) {
              Navigator.pushNamed(context, '/gallery');
            } else {
              _selectIndex = index;
            }
          });
        },
      ),
    );
  }
}
