import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'rooms_screen.dart';
import 'home.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:home(),
    );
  }

}