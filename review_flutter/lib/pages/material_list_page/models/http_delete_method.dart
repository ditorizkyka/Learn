// import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpDeleteMethod {
  String? name, job, email;
  int? id;

  HttpDeleteMethod({
    this.name,
    this.id,
    this.job,
    this.email,
  });

  static Future<int> deleteDataAPI() async {
    var data = await http.delete(Uri.parse("https://reqres.in/api/users/2"));

    print(data.statusCode);
    return data.statusCode;
  }
}
