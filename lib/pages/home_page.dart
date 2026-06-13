import 'package:flutter/material.dart';
import 'package:remindx/api/voice_to_text.dart';
import 'package:remindx/widgets/task_container.dart';
import 'package:remindx/widgets/bottom_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  List<String> reminders = [];
  bool isListening = false;
  String currentText = "";
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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

            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // 🔵 Animated rotating ring (ONLY when speaking)
                  if (isListening)
                    RotationTransition(
                      turns: _controller,
                      child: Container(
                        width: 160,
                        height: 160,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.cyanAccent,
                            width: 4,
                          ),
                          boxShadow: [
                            BoxShadow(blurRadius: 20, spreadRadius: 5),
                          ],
                        ),
                      ),
                    ),

                  GestureDetector(
                    onTap: toggleRecording,
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 33, 37, 243),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        isListening ? Icons.mic : Icons.mic_none,
                        size: 60,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
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

            Column(
              children: reminders
                  .map(
                    (reminder) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TaskContainer(task: reminder),
                    ),
                  )
                  .toList(),
            ),

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

  Future<void> toggleRecording() async {
    if (!isListening) {
      setState(() {
        currentText = "";
        isListening = true;
      });
      _controller.repeat(); // start animation

      await SpeechService.startListening(
        onResult: (text) {
          setState(() {
            currentText = text;
          });
        },
      );
    } else {
      await SpeechService.stopListening();
      _controller.stop();

      setState(() {
        isListening = false;

        if (currentText.trim().isNotEmpty) {
          reminders.add(currentText);
        }
      });
    }
  }
}
