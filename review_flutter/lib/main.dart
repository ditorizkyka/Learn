import 'package:flutter/material.dart';

import 'package:review_flutter/pages/home_screen/home_screen.dart';

void main() {
  runApp(const MainRouting());
}

class MainRouting extends StatelessWidget {
  const MainRouting({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/home_screen",
      routes: {
        "/home_screen": (context) => const HomeScreen(),
      },
    );
  }
}
