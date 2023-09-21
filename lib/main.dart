import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.purpleAccent),
            useMaterial3: true,
          ),
          home: const MyHomePage(title: 'Flutter Demo Home Page223'),
        ));
  }
}

class MyHomeState extends ChangeNotifier {
  int word = 1;

  void add() {
    word++;
    notifyListeners();
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var textFieldSearch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyHomeState>();
    var word = appState.word;
    return Scaffold(
      appBar: AppBar(
          title: Row(
            children: [
              const CircleAvatar(
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
                decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),borderSide: BorderSide(color: Colors.grey)),
                    hintText: '输入内容',
                    fillColor: const Color.fromRGBO(255, 255, 255, 0.5),
                    filled: true,
                    contentPadding: const EdgeInsets.all(10)),
              ))
            ],
          )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            WordText(word: word),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(minimumSize: const Size(200, 50)),
              onPressed: () {
                appState.add();
              },
              child: Text(
                word.toString(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar:
          BottomNavigationBar(items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "首页",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: "搜索",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "我的",
        ),
      ]),
    );
  }
}

class WordText extends StatelessWidget {
  const WordText({
    super.key,
    required this.word,
  });

  final int word;

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
