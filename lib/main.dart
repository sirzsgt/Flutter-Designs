import 'package:flutter/material.dart';

import 'package:designs/src/screens/basic.screen.dart';
import 'package:designs/src/screens/scroll.screen.dart';
import 'package:designs/src/screens/buttons.screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      initialRoute: 'ScrollScreen',
      routes: {
        'BasicScreen': (BuildContext context) => BasicScreen(),
        'ScrollScreen': (BuildContext context) => ScrollScreen(),
        'ButtonsScreen': (BuildContext context) => ButtonsScreen()
      },
    );
  }
}
