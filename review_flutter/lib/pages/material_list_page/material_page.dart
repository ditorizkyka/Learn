import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:review_flutter/pages/home_screen/home_screen.dart';

class MaterialListPage extends StatelessWidget {
  const MaterialListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            iconTheme: const IconThemeData(
              color: Colors.white, // Set the color you want
            ),
            backgroundColor: Colors.black,
            title: Text(
              'Material List Page',
              style: GoogleFonts.poppins(color: Colors.white, fontSize: 20),
            )),
        body: Container(
          color: Colors.black,
          child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Container(
                  color: Colors.black, child: const MaterialPageBody())),
        ));
  }
}

class MaterialPageBody extends StatelessWidget {
  const MaterialPageBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 35),
        child: Column(
          children: [
            BasicCard(
                desc: "learn about JSON Serializable, how to use it, etc",
                route: '/user_list',
                icon: Icons.abc_outlined,
                title: 'JSON Serializable'),
            BasicCard(
                desc: "learn about WebSocket, how to use it, etc",
                route: '/websocket_material',
                icon: Icons.abc_outlined,
                title: 'WebSocket Demo'),
            BasicCard(
                desc: "learn about HTTP post, how to use it, etc",
                route: '/http_post',
                icon: Icons.abc_outlined,
                title: 'HTTP Post Method'),
            BasicCard(
                desc: "Learn about HTTP get, how to use it, etc",
                route: '/http_get',
                icon: Icons.abc_outlined,
                title: 'HTTP Get Method'),
            BasicCard(
                desc: "Learn about HTTP put/Patch, how to use it, etc",
                route: '/http_putPatch',
                icon: Icons.abc_outlined,
                title: 'HTTP Put/Patch Method'),
            BasicCard(
                desc: "learn about Future Builder, how to use it, etc",
                route: '/future_builder_user',
                icon: Icons.abc_outlined,
                title: 'Future Builder User'),
            BasicCard(
                desc:
                    "learn about Hive Database/Internal data base, how to use it, etc",
                route: '/hive_db',
                icon: Icons.abc_outlined,
                title: 'Hive DataBase'),
            BasicCard(
                desc: "learn about Riverpod, how to use it, etc",
                route: '/rvp_main',
                icon: Icons.abc_outlined,
                title: 'Riverpod State-Management'),
            BasicCard(
                desc: "learn about FireStore, how to use it, etc",
                route: '/firestore_main',
                icon: Icons.abc_outlined,
                title: 'FireStore'),
            BasicCard(
                desc: "learn about Authentication, how to use it, etc",
                route: '/learn_auth',
                icon: Icons.abc_outlined,
                title: 'Authentication Firebase'),
            BasicCard(
                desc: "lorem",
                route: '/basic',
                icon: Icons.abc_outlined,
                title: 'Basic'),
            BasicCard(
                desc: "lorem",
                route: '/basic',
                icon: Icons.abc_outlined,
                title: 'Basic'),
            BasicCard(
                desc: "lorem",
                route: '/basic',
                icon: Icons.abc_outlined,
                title: 'Basic'),
          ],
        ),
      ),
    );
  }
}
