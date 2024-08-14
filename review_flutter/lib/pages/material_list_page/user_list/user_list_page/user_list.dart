import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:review_flutter/models/UserModel.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  Future<UserModel?> getDataUser() async {
    Uri url = Uri.parse("https://reqres.in/api/users/10");
    var response = await http.get(url);
    if (response.statusCode != 200) {
      return null;
    } else {
      Map<String, dynamic> data =
          (json.decode(response.body) as Map<String, dynamic>);
      return UserModel.fromJson(data);
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
          height: 300,
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
                                NetworkImage(snapshot.data!.data.avatar),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${snapshot.data!.data.first_name} ${snapshot.data!.data.last_name}',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  snapshot.data!.data.email,
                                  style: const TextStyle(color: Colors.white),
                                ),
                                Text(
                                  '${snapshot.data!.data.id}',
                                  style: const TextStyle(color: Colors.white),
                                )
                              ])
                        ]),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  snapshot.data!.support.text,
                                  style: const TextStyle(color: Colors.white),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  snapshot.data!.support.url,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ]),
                        )
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
