import 'package:flutter/material.dart';
import 'main.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = MyApp.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('SETTING PAGE'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                appState?.toggleTheme(false);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Switched to Light Mode')),
                );
              },
              child: const Text('LIGHT MODE'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                appState?.toggleTheme(true);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Switched to Dark Mode')),
                );
              },
              child: const Text('DARK MODE'),
            ),
          ],
        ),
      ),
    );
  }
}
