import 'package:flutter/material.dart';
import 'package:remindx/widgets/task_container.dart';
import 'package:remindx/widgets/bottom_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu, color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 33, 37, 243),
        title: const Text(
          'remindX Voice Reminder',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.notifications, color: Colors.white),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),

            // Mic Button
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 33, 37, 243),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: const Icon(Icons.mic, color: Colors.white, size: 60),
            ),

            const SizedBox(height: 30),

            // Date & Time Row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildBox(Icons.calendar_today, "Date"),
                  _buildBox(Icons.access_time, "Time"),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Upcoming Tasks Title
            const Text(
              'Upcoming Tasks',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            // Task Container
            const SizedBox(height: 30),

            Text(
              'Your voice reminder app',
              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
            ),
            const TaskContainer(),
            SizedBox(height: 20),
            const TaskContainer(),
            SizedBox(height: 20),
            const TaskContainer(),
            SizedBox(height: 20),
            const TaskContainer(),
            SizedBox(height: 20),
            const TaskContainer(),

            const SizedBox(height: 30),
          ],
        ),
      ),

      // Bottom Navigation
      bottomNavigationBar: const BottomBar(),
    );
  }

  // Reusable widget for Date & Time boxes
  Widget _buildBox(IconData icon, String text) {
    return Container(
      width: 140,
      height: 70,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 33, 37, 243),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white, size: 24),
          const SizedBox(width: 10),
          Text(text, style: const TextStyle(fontSize: 18, color: Colors.white)),
        ],
      ),
    );
  }
}
