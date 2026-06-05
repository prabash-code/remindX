import 'package:flutter/material.dart';
import 'package:remindx/widgets/bottom_bar.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back, color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 33, 37, 243),
        title: const Text(
          'Tasks',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const Center(child: Text('Tasks page')),
      bottomNavigationBar: const BottomBar(),
    );
  }
}
