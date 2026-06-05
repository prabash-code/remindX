import 'package:flutter/material.dart';
import 'package:remindx/router/router.dart';
import 'package:go_router/go_router.dart';

void main() {
  final appRouter = RouterClass().router;
  runApp(MyApp(router: appRouter));
}

class MyApp extends StatelessWidget {
  final GoRouter router;

  const MyApp({super.key, required this.router});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'remindX',
      routerConfig: router,
    );
  }
}
