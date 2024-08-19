import 'package:flutter/material.dart';

import 'pages/pages.dart';

class LearnAuth extends StatelessWidget {
  const LearnAuth({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EmailSignInPage(),
    );
  }
}
