import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:review_flutter/pages/material_list_page/riverpod/study_case/main_products.dart';
import 'package:review_flutter/pages/material_list_page/riverpod/state-provider/counter_page.dart';

import 'package:review_flutter/provider/intro.dart';

class RvpMainPage extends ConsumerWidget {
  const RvpMainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, // Set the color you want
        ),
        title: const Text(
          'Riverpod State-Management',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
              ),
              child: Column(
                children: [
                  const Text(
                    "STUDY CASE",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("Products And Cart",
                      style: TextStyle(color: Colors.white)),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                      backgroundColor: const WidgetStatePropertyAll(
                          Color.fromARGB(255, 103, 16, 255)),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MainProducts()));
                      ;
                    },
                    child: const Text(
                      'Riverpod : Provider',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade200,
              ),
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Text(
                    "PROVIDER STATE MANAGEMENT",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("Go to Second Page"),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                      backgroundColor: const WidgetStatePropertyAll(
                          Color.fromARGB(255, 103, 16, 255)),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/scnd_rvp');
                    },
                    child: const Text(
                      'Riverpod : Provider',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text('This message from provider : ${ref.watch(greet)}'),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade200,
              ),
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              child: Column(children: [
                const Text(
                  "STATE-PROVIDER STATE MANAGEMENT",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text("Go to Counter Page"),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                    backgroundColor: const WidgetStatePropertyAll(
                        Color.fromARGB(255, 103, 16, 255)),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CounterPage()));
                  },
                  child: const Text(
                    'Riverpod : State-Provider',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text('This message from provider : ${ref.watch(greet)}'),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
