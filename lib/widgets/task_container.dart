import 'package:flutter/material.dart';

class TaskContainer extends StatelessWidget {
  const TaskContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromARGB(255, 33, 37, 243),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
