import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpPost {
  String? id, name, job, createdAt;

  HttpPost({
    this.name,
    this.id,
    this.job,
    this.createdAt,
  });

  static Future<HttpPost> connectAPI(String name, String job) async {
    Uri url = Uri.parse("https://reqres.in/api/users");
    var response = await http.post(url, body: {
      "name": name,
      "job": job,
    });

    var data = json.decode(response.body);

    return HttpPost(
      id: data["id"],
      name: data["name"],
      job: data["job"],
      createdAt: data["createdAt"],
    );
  }
}
