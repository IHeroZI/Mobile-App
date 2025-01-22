import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: 'Named Routed Demo', initialRoute: '/', routes: {
    '/': (context) => const FirstScreen(),
    '/second': (context) => const SecondScreen(),
    '/third': (context) => const ThirdScreen(),
  }));
}

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Retrieve arguments passed via Navigator.pushNamed
    final arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final userId = arguments?['userId'] ?? 'No userId provided';

    return Scaffold(
        appBar: AppBar(
          title: const Text('Third Screen'),
        ),
        body: Center(
            child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Go back!')),
            Text('User ID: $userId'),
          ],
        )));
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('First Screen'),
        ),
        body: Center(
            child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/second');
                },
                child: const Text('Page 2')),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () {
                  // Pass arguments to Page 3
                  Navigator.pushNamed(context, '/third',
                      arguments: {'userId': '6610450897'});
                },
                child: const Text('Page 3'))
          ],
        )));
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Second Screen'),
        ),
        body: Center(
          child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go back!')),
        ));
  }
}
