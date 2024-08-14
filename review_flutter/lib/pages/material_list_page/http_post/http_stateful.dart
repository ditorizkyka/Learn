import 'package:flutter/material.dart';
import 'package:review_flutter/pages/material_list_page/models/http_post.dart';

class HttpStateful extends StatefulWidget {
  const HttpStateful({super.key});

  @override
  State<HttpStateful> createState() => _HttpStatefulState();
}

class _HttpStatefulState extends State<HttpStateful> {
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerJob = TextEditingController();
  HttpPost httpPost = HttpPost();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, // Set the color you want
        ),
        title: const Text(
          'HTTP Post Method',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(children: [
          TextField(
            controller: _controllerName,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Name',
              hintText: 'Enter Your Name',
              prefixIcon: Icon(Icons.person),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          TextField(
            controller: _controllerJob,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Job',
              hintText: 'Enter Your Job',
              prefixIcon: Icon(Icons.work),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                        ),
                        onPressed: () {
                          if (_controllerName.text == "" ||
                              _controllerJob.text == "") {
                            print("Nothing");
                          } else {
                            HttpPost.connectAPI(
                                    _controllerName.text, _controllerJob.text)
                                .then((data) {
                              setState(() {
                                httpPost = data;
                              });
                            });
                          }
                        },
                        child: const Text(
                          "POST DATA",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TableResponHTTPPost(httpPost: httpPost),
            ],
          ),
        ]),
      ),
    );
  }
}

class TableResponHTTPPost extends StatelessWidget {
  const TableResponHTTPPost({
    super.key,
    required this.httpPost,
  });

  final HttpPost httpPost;

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(),
      children: [
        const TableRow(children: [
          Text("Attribute",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Text("Data",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ]),
        TableRow(children: [
          const Text("ID", style: TextStyle(fontSize: 12)),
          Text((httpPost.id == null) ? "Belum ada Data" : "${httpPost.id}",
              style: const TextStyle(fontSize: 12)),
        ]),
        TableRow(children: [
          const Text("Name", style: TextStyle(fontSize: 12)),
          Text((httpPost.name == null) ? "Belum ada Data" : "${httpPost.name}",
              style: const TextStyle(fontSize: 12)),
        ]),
        TableRow(children: [
          const Text("Job", style: TextStyle(fontSize: 12)),
          Text((httpPost.job == null) ? "Belum ada Data" : "${httpPost.job}",
              style: const TextStyle(fontSize: 12)),
        ]),
        TableRow(children: [
          const Text("Created At", style: TextStyle(fontSize: 12)),
          Text(
              (httpPost.createdAt == null)
                  ? "Belum ada Data"
                  : "${httpPost.createdAt}",
              style: const TextStyle(fontSize: 12)),
        ]),
      ],
    );
  }
}
