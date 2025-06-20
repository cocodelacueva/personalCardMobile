import 'package:flutter/material.dart';
import 'screens/personal_card_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Card | Portinos.com',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const PersonalCardScreen(),
    );
  }
}
