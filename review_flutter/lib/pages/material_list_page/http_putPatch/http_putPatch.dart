import 'package:flutter/material.dart';
import 'package:review_flutter/pages/material_list_page/models/http_putPatch_method.dart';

class HttpPutpatch extends StatefulWidget {
  const HttpPutpatch({super.key});

  @override
  State<HttpPutpatch> createState() => _HttpStatefulState();
}

class _HttpStatefulState extends State<HttpPutpatch> {
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerJob = TextEditingController();
  HttpPutPatchMethod httpPutPatch = HttpPutPatchMethod();

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
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("Please fill all field")));
                          } else {
                            HttpPutPatchMethod.changeDataAPI(
                                    _controllerName.text, _controllerJob.text)
                                .then((value) {
                              setState(() {
                                httpPutPatch = value;
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
              Text("Changed data : ${httpPutPatch.name}, ${httpPutPatch.job} "),
              const SizedBox(
                height: 20,
              ),
              Text("Changed data : ${httpPutPatch.update} "),
            ],
          ),
        ]),
      ),
    );
  }
}
