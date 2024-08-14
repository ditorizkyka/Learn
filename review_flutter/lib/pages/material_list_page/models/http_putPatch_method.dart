import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpPutPatchMethod {
  String? name;
  String? job;
  String? update;

  HttpPutPatchMethod({this.name, this.job, this.update});

  static Future<HttpPutPatchMethod> changeDataAPI(
      String name, String job) async {
    Uri url = Uri.parse("https://reqres.in/api/users/2");
    var response = await http.put(url, body: {
      "name": name,
      "job": job,
    });

    var data = json.decode(response.body);
    return HttpPutPatchMethod(
      name: data["name"],
      job: data["job"],
      update: data["updatedAt"],
    );
  }
}
