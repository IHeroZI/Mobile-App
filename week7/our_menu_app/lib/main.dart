import 'package:flutter/material.dart';
import 'package:our_menu_app/navBar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Roboto_Mono',
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontFamily: 'Noto_Sans_Thai'),
        ),
      ),
      home: const BottomNavBar(),
    );
  }
}