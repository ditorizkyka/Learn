import 'package:flutter/material.dart';
import 'package:review_flutter/pages/material_list_page/models/http_delete_method.dart';
import 'package:review_flutter/pages/material_list_page/models/http_get_method.dart';

class HttpGet extends StatefulWidget {
  const HttpGet({super.key});

  @override
  State<HttpGet> createState() => _HttpStatefulState();
}

class _HttpStatefulState extends State<HttpGet> {
  HttpGetMethod httpGet = HttpGetMethod();
  // HttpDeleteMethod? httpDel = HttpDeleteMethod();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, // Set the color you want
        ),
        title: const Text(
          'HTTP Get And Delete Method Method',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(children: [
          Table(
            border: TableBorder.all(),
            children: [
              const TableRow(children: [
                Text("Attribute",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text("Data",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ]),
              TableRow(children: [
                const Text("ID", style: TextStyle(fontSize: 12)),
                Text((httpGet.id == null) ? "Belum ada Data" : "${httpGet.id}",
                    style: const TextStyle(fontSize: 12)),
              ]),
              TableRow(children: [
                const Text("Name", style: TextStyle(fontSize: 12)),
                Text(
                    (httpGet.name == null)
                        ? "Belum ada Data"
                        : "${httpGet.name}",
                    style: const TextStyle(fontSize: 12)),
              ]),
              TableRow(children: [
                const Text("Job", style: TextStyle(fontSize: 12)),
                Text(
                    (httpGet.job == null) ? "Belum ada Data" : "${httpGet.job}",
                    style: const TextStyle(fontSize: 12)),
              ]),
              TableRow(children: [
                const Text("Created At", style: TextStyle(fontSize: 12)),
                Text(
                    (httpGet.email == null)
                        ? "Belum ada Data"
                        : "${httpGet.email}",
                    style: const TextStyle(fontSize: 12)),
              ]),
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.lightGreen)),
              onPressed: () {
                HttpGetMethod.getDataApi().then(
                  (value) {
                    setState(() {
                      // httpDel = value as HttpDeleteMethod;
                      httpGet = value;
                    });
                  },
                );
              },
              child: const Text(
                "GET DATA",
                style: TextStyle(color: Colors.white),
              )),
          ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.red)),
              onPressed: () {
                HttpDeleteMethod.deleteDataAPI().then(
                  (value) {
                    if (value == 204) {
                      setState(() {
                        httpGet.email = "Data Dihapus";
                        httpGet.id = 0;
                        httpGet.name = "Data Dihapus";
                        httpGet.job = "Data Dihapus";
                      });
                    }
                  },
                );
              },
              child: const Text(
                "DELETE DATA",
                style: TextStyle(color: Colors.white),
              )),
        ]),
      ),
    );
  }
}
