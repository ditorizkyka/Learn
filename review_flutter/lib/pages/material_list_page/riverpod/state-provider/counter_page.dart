import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:review_flutter/provider/intro.dart';

class CounterPage extends ConsumerWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, // Set the color you want
        ),
        title: const Text(
          'Second Page of Riverpod State-Management',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Number : ${ref.watch(counter)}",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                        Color.fromARGB(255, 103, 16, 255)),
                  ),
                  onPressed: () {
                    ref.read(counter.notifier).state += 1;
                  },
                  icon: const Icon(Icons.add, color: Colors.white),
                ),
                const SizedBox(
                  width: 20,
                ),
                IconButton(
                  style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.red)),
                  onPressed: () {
                    ref.invalidate(counter);
                  },
                  icon: (Icon(Icons.refresh, color: Colors.white)),
                ),
                const SizedBox(
                  width: 20,
                ),
                IconButton(
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                        Color.fromARGB(255, 103, 16, 255)),
                  ),
                  onPressed: () {
                    if (ref.read(counter) > 0) {
                      ref.read(counter.notifier).state -= 1;
                    }
                  },
                  icon: const Icon(Icons.remove, color: Colors.white),
                ),
              ],
            )
            // Text(ref.watch(greet)),
          ],
        ),
      ),
    );
  }
}
