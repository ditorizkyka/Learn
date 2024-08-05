import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Review Flutter',
          style: GoogleFonts.poppins(color: Colors.white, fontSize: 20),
        ),
      ),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.black,
          child: const HomeScreenBody()),
    );
  }
}

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      width: double.infinity,
      height: 400,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 35),
        child: Column(
          children: [
            Row(
              children: [
                Text("Welcome Back Dito",
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.grey,
                        fontWeight: FontWeight.w600)),
                const Spacer(),
                Container(
                    alignment: Alignment.center,
                    width: 80,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      "August",
                      style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ))
              ],
            ),
            const SizedBox(height: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Have You Learn",
                    style: GoogleFonts.poppins(
                        fontSize: 40, fontWeight: FontWeight.w600)),
                Text("Flutter Today?",
                    style: GoogleFonts.poppins(fontSize: 30)),
              ],
            ),
            BasicCard()
          ],
        ),
      ),
    );
  }
}

class BasicCard extends StatelessWidget {
  const BasicCard({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 30),
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
            child: Column(children: [
              Row(children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(5)),
                  width: 40,
                  height: 40,
                ),
                const Spacer(),
                Text("Name of the Material", style: GoogleFonts.poppins()),
                const Spacer(),
                Container(
                  alignment: Alignment.center,
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.black),
                  child: IconButton(
                      color: Colors.white,
                      onPressed: () {},
                      icon: Icon(Icons.arrow_forward_ios_rounded)),
                )
              ])
            ])));
  }
}
