import 'package:flutter/material.dart';

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
    );
  }
}
