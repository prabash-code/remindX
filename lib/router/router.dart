import 'package:go_router/go_router.dart';
import 'package:remindx/pages/home_page.dart';
import 'package:remindx/pages/settings.dart';
import 'package:remindx/pages/tasks.dart';

class RouterClass {
  final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: "home",
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/settings',
        name: "settings",
        builder: (context, state) => const SettingPage(),
      ),
      GoRoute(
        path: '/task',
        name: "task",
        builder: (context, state) => const TaskPage(),
      ),
    ],
  );
}
