import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:review_flutter/pages/material_list_page/firestore/widget/item_card.dart';

class Firestore extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  Firestore({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('users');
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: const Text('Firestore Demo',
              style: TextStyle(color: Colors.white)),
        ),
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            ListView(
              children: [
                //// VIEW DATA HERE
                /// Hanya terjadi sekali/ sekali ambil
                // FutureBuilder<QuerySnapshot>(
                //     future: users.get(),
                //     builder: (_, snapshot) {
                //       if (snapshot.hasData) {
                //         return Column(
                //             children: snapshot.data!.docs
                //                 .map((e) => ItemCard(
                //                     name: e['name'],
                //                     age: e['age'],
                //                     onUpdate: () {},
                //                     onDelete: () {}))
                //                 .toList());
                //       } else {
                //         return const Center(child: CircularProgressIndicator());
                //       }
                //     }),
                StreamBuilder<QuerySnapshot>(
                    stream: users.snapshots(),
                    builder: (_, snapshot) {
                      if (snapshot.hasData) {
                        return Column(
                            children: snapshot.data!.docs
                                .map((e) => ItemCard(
                                    name: e['name'],
                                    age: e['age'],
                                    onUpdate: () {
                                      users.doc(e.id).update(
                                          {'age': FieldValue.increment(1)});
                                    },
                                    onDelete: () {
                                      users.doc(e.id).delete();
                                    }))
                                .toList());
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    }),
                const SizedBox(
                  height: 150,
                )
              ],
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration:
                      const BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(-5, 0),
                        blurRadius: 15,
                        spreadRadius: 3)
                  ]),
                  width: double.infinity,
                  height: 130,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 160,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextField(
                              style: GoogleFonts.poppins(),
                              controller: nameController,
                              decoration:
                                  const InputDecoration(hintText: "Name"),
                            ),
                            TextField(
                              style: GoogleFonts.poppins(),
                              controller: ageController,
                              decoration:
                                  const InputDecoration(hintText: "Age"),
                              keyboardType: TextInputType.number,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 60,
                        width: 60,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue[900],
                        ),
                        padding: const EdgeInsets.all(5),
                        child: Center(
                          child: IconButton(
                              icon: const Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 30,
                              ),
                              onPressed: () {
                                //// ADD DATA HERE
                                users.add({
                                  'name': nameController.text,
                                  'age': int.tryParse(ageController.text) ?? 0,
                                });

                                nameController.text = '';
                                ageController.text = '';
                              }),
                        ),
                      )
                    ],
                  ),
                )),
          ],
        ));
  }
}
