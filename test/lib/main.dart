import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: const Icon(Icons.menu),
            title: const Text("Test App"),
            actions: [
          const Icon(Icons.shopping_bag),
          Padding(padding: EdgeInsets.only(right: 16)),
          const Icon(Icons.shopping_cart),
          Padding(padding: EdgeInsets.only(right: 16))
        ]),
        body: ListView(A,children: [],));
  }
}
