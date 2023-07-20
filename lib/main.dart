import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:loadman/components/side_menu.dart';
import 'package:provider/provider.dart';
import 'dart:developer';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: const SideMenu(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();

  void download() {
    var x = 0;
    for (var i = 0; i < 10; i++) {
      x++;
    }
    print(x.toString());
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;

    IconData icon;
    icon = Icons.download;

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('A random idea:'),
            Text(appState.current.asLowerCase),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    appState.download();
                  },
                  icon: Icon(icon),
                  label: Text('Download'),
                ),
                SizedBox(width: 10),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
