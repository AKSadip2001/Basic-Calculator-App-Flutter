import 'package:flutter/material.dart';
import './homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Calcu',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Calculator'),
    );
  }
}
