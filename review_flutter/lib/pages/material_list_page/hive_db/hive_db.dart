import 'package:flutter/material.dart';
import 'package:review_flutter/pages/home_screen/home_screen.dart';

class HiveDb extends StatelessWidget {
  const HiveDb({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, // Set the color you want
        ),
        title: const Text(
          'Hive DataBase',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        child: const UpcomingTask(),
      ),
    );
  }
}
