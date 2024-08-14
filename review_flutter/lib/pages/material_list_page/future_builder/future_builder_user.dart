import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FutureBuilderUser extends StatefulWidget {
  const FutureBuilderUser({super.key});

  @override
  State<FutureBuilderUser> createState() => _FutureBuilderUserState();
}

class _FutureBuilderUserState extends State<FutureBuilderUser> {
  List<Map<String, dynamic>> users = [];
  Future getDataAllUser() async {
    var response =
        await http.get(Uri.parse("https://reqres.in/api/users?page=2"));
    var data = (json.decode(response.body) as Map<String, dynamic>)["data"];
    data.forEach((value) {
      users.add(value);
    });

    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white, // Set the color you want
          ),
          title: const Text(
            'Future Builder User',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
        ),
        body: FutureBuilder(
            future: getDataAllUser(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                if (snapshot.hasData) {
                  return ListView.builder(
                      padding: const EdgeInsets.all(10),
                      scrollDirection: Axis.vertical,
                      itemCount: users.length,
                      itemBuilder: (context, index) => ListTile(
                            leading: CircleAvatar(
                              backgroundImage:
                                  NetworkImage(users[index]['avatar']),
                            ),
                            title: Text(users[index]['first_name'] +
                                ' ' +
                                users[index]['last_name']),
                            subtitle: Text(users[index]['email']),
                          ));
                } else {
                  return const Text('No data');
                }
              }
            }));
  }
}
