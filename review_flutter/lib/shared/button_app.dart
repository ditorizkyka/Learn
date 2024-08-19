import 'package:flutter/material.dart';

class ButtonApp extends StatelessWidget {
  final bool icon = false;

  const ButtonApp({super.key});

  @override
  Widget build(BuildContext context) {
    if (icon != true) {
      return ElevatedButton(onPressed: () {}, child: const Text('Button'));
    } else {
      return ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.add),
          label: const Text('Button'));
    }
  }
}
