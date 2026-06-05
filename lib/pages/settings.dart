import 'package:flutter/material.dart';
import 'package:remindx/widgets/bottom_bar.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back, color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 33, 37, 243),
        title: const Text(
          'Settings',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const Center(child: Text('Settings page')),
      bottomNavigationBar: const BottomBar(),
    );
  }
}
