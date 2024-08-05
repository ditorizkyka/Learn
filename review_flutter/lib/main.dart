import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<Map<String, dynamic>?> getDataUser() async {
    Uri url = Uri.parse("https://reqres.in/api/users/10");
    var response = await http.get(url);
    if (response.statusCode != 200) {
      return null;
    } else {
      return (json.decode(response.body) as Map<String, dynamic>)['data'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            'Review Flutter',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(30)),
          margin: const EdgeInsets.fromLTRB(16, 30, 16, 0),
          height: 170,
          width: double.maxFinite,
          child: FutureBuilder(
            future: getDataUser(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                if (snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.all(25),
                    child: Column(
                      children: [
                        Row(children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundImage:
                                NetworkImage('${snapshot.data!['avatar']}'),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${snapshot.data!['first_name'] + ' ' + snapshot.data!['last_name']}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '${snapshot.data!['email']}',
                                  style: TextStyle(color: Colors.white),
                                )
                              ])
                        ])

                        // Text(
                        //   '${snapshot.data!['avatar']}',
                        //   style: const TextStyle(color: Colors.white),
                        // ),
                      ],
                    ),
                  );
                } else {
                  return const Center(
                    child: Text("Data Not Found"),
                  );
                }
              }
            },
          ),
        ));
  }
}



// Center(
//         child: FutureBuilder(
//           future: getDataUser(),
//           builder: (context, snapshot) {
//             return Text('${snapshot.data!['avatar']}');
//           },
//         ),
//       ),
