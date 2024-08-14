import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpGetMethod {
  String? name, job, email;
  int? id;

  HttpGetMethod({
    this.name,
    this.id,
    this.job,
    this.email,
  });

  static Future<HttpGetMethod> getDataApi() async {
    var data = await http.get(Uri.parse("https://reqres.in/api/users/2"));

    var jsonData = (json.decode(data.body) as Map<String, dynamic>)["data"];
    return HttpGetMethod(
      id: jsonData["id"],
      name: jsonData["first_name"],
      job: jsonData["last_name"],
      email: jsonData["email"],
    );
  }
}
