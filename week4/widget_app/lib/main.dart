import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('ชวัลวิทย์ พรสี่ภาค 6610450897'),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          child: const Text(
            'touch',
            style: TextStyle(fontSize: 20),
          ),
          onPressed: () {
            print('The button is touched');
          },
        ),
        body: const Column(children: [
          Icon(
            Icons.favorite,
            color: Colors.pink,
            size: 24.0,
          ),
          Icon(
            Icons.beach_access,
            color: Colors.blue,
            size: 36.0,
          ),
        ]),
      ),
      theme: ThemeData.dark(),
    );
  }
}
