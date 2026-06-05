import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    String location = GoRouterState.of(context).uri.path;

    int currentIndex = 0;
    if (location == '/task') {
      currentIndex = 1;
    } else if (location == '/settings') {
      currentIndex = 2;
    }

    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        switch (index) {
          case 0:
            context.go('/'); // Home
            break;
          case 1:
            context.go('/task'); // Tasks
            break;
          case 2:
            context.go('/settings'); // Settings
            break;
        }
      },
      backgroundColor: const Color.fromARGB(255, 33, 37, 243),
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.task), label: 'Tasks'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
      ],
    );
  }
}
